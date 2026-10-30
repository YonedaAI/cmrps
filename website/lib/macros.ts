import * as fs from 'fs';
import * as path from 'path';

export type MacroMap = Record<string, string>;

export const BASE_MACROS: MacroMap = {
  '\\slashed': '\\not{#1}',
  '\\bra': '\\langle #1 \\vert',
  '\\ket': '\\vert #1 \\rangle',
  '\\braket': '\\langle #1 \\vert #2 \\rangle',
  '\\Hom': '\\operatorname{Hom}',
  '\\Tr': '\\operatorname{Tr}',
  '\\Lan': '\\operatorname{Lan}',
  '\\Ran': '\\operatorname{Ran}',
  '\\End': '\\operatorname{End}',
  '\\Nat': '\\operatorname{Nat}',
  '\\Sp': '\\operatorname{Sp}',
  '\\id': '\\operatorname{id}',
  '\\im': '\\operatorname{im}',
  '\\coker': '\\operatorname{coker}',
  '\\rank': '\\operatorname{rank}',
  '\\diag': '\\operatorname{diag}',
  '\\supp': '\\operatorname{supp}',
  '\\Arg': '\\operatorname{Arg}',
  '\\Res': '\\operatorname{Res}',
  '\\ad': '\\operatorname{ad}',
};

/**
 * Auto-extract \newcommand / \renewcommand / \DeclareMathOperator definitions
 * from the LaTeX preambles of the series papers. Papers define 50-70 custom
 * commands between them; missing any produces red error text on the site.
 */
export function extractMacros(texDir: string): MacroMap {
  const macros: MacroMap = { ...BASE_MACROS };
  if (!fs.existsSync(texDir)) return macros;

  const newCmd = /\\(?:newcommand|renewcommand)\s*\{?(\\[a-zA-Z]+)\}?\s*(?:\[(\d)\])?\s*\{/g;
  const declOp = /\\DeclareMathOperator\*?\s*\{?(\\[a-zA-Z]+)\}?\s*\{([^{}]*)\}/g;

  for (const file of fs.readdirSync(texDir)) {
    if (!file.endsWith('.tex')) continue;
    const src = fs.readFileSync(path.join(texDir, file), 'utf8');
    // only scan the preamble — the body can contain usage, not definitions
    const preamble = src.includes('\\begin{document}')
      ? src.slice(0, src.indexOf('\\begin{document}'))
      : src;

    let m: RegExpExecArray | null;
    while ((m = newCmd.exec(preamble)) !== null) {
      const name = m[1];
      const arity = m[2] ? parseInt(m[2], 10) : 0;
      const body = extractBraceGroup(preamble, newCmd.lastIndex - 1);
      if (body === null) continue;
      let replacement = body;
      for (let i = 1; i <= arity; i++) {
        replacement = replacement.replace(
          new RegExp(`#${i}`, 'g'),
          `{#${i}}`,
        );
      }
      macros[name] = replacement;
    }
    while ((m = declOp.exec(preamble)) !== null) {
      macros[m[1]] = `\\operatorname{${m[2]}}`;
    }
  }
  return macros;
}

function extractBraceGroup(src: string, openIdx: number): string | null {
  if (src[openIdx] !== '{') return null;
  let depth = 0;
  for (let i = openIdx; i < src.length; i++) {
    const c = src[i];
    if (c === '\\') {
      i++;
      continue;
    }
    if (c === '{') depth++;
    else if (c === '}') {
      depth--;
      if (depth === 0) return src.slice(openIdx + 1, i);
    }
  }
  return null;
}

let cached: MacroMap | null = null;

export function getMacros(): MacroMap {
  if (cached) return cached;
  const candidates = [
    path.join(process.cwd(), '..', 'papers', 'latex'),
    path.join(process.cwd(), 'content', 'tex'),
  ];
  for (const dir of candidates) {
    if (fs.existsSync(dir)) {
      cached = extractMacros(dir);
      return cached;
    }
  }
  cached = { ...BASE_MACROS };
  return cached;
}
