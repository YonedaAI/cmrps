# Phase D experiment for vol-01-foundations.
# Claim evidenced: Theorem 8.2, finite dynamical records under disjoint union.
# (a) irreducibility equals connectedness of the functional graph,
# (b) the connected-component decomposition is the unique finest invariant
# partition, and (c) isomorphism is decided by the multiset of component
# isomorphism classes. Computational evidence only; the proof is in the paper.

from itertools import permutations, product as iproduct


def set_partitions(xs):
    if not xs:
        yield []
        return
    first, rest = xs[0], xs[1:]
    for parts in set_partitions(rest):
        for i in range(len(parts)):
            yield parts[:i] + [[first] + parts[i]] + parts[i + 1:]
        yield [[first]] + parts


def components_of(n, fmap):
    neigh = {x: set() for x in range(n)}
    for x in range(n):
        y = fmap[x]
        neigh[x].add(y)
        neigh[y].add(x)
    seen, comps = set(), []
    for x in range(n):
        if x in seen:
            continue
        stack, comp = [x], []
        while stack:
            u = stack.pop()
            if u in seen:
                continue
            seen.add(u)
            comp.append(u)
            stack.extend(neigh[u] - seen)
        comps.append(sorted(comp))
    return comps


def invariant_partitions(n, fmap):
    out = []
    for parts in set_partitions(list(range(n))):
        if all(all(fmap[x] in block for x in block) for block in parts):
            out.append([sorted(b) for b in parts])
    return out


def canonical_component(fmap, comp):
    best = None
    for perm in permutations(comp):
        relabel = {old: i for i, old in enumerate(perm)}
        signature = tuple(
            sorted((relabel[x], relabel[fmap[x]]) for x in comp)
        )
        if best is None or signature < best:
            best = signature
    return best


def check_structure(max_n=4):
    failures = []
    for n in range(1, max_n + 1):
        for fmap in iproduct(range(n), repeat=n):
            comps = components_of(n, fmap)
            parts = invariant_partitions(n, fmap)
            irreducible = len(comps) == 1
            splittable = any(len(p) > 1 for p in parts)
            if irreducible == splittable:
                failures.append(f"(a) failed at n={n} f={fmap}")
            comp_sets = [frozenset(c) for c in comps]
            for p in parts:
                p_sets = [frozenset(b) for b in p]
                for c in comp_sets:
                    if not any(c <= q for q in p_sets):
                        failures.append(f"(b) failed at n={n} f={fmap}")
    return failures


def check_conjugacy(max_n=4):
    systems = list(iproduct(range(max_n), repeat=max_n))
    sigs = {
        f: sorted(
            canonical_component(f, c) for c in components_of(max_n, f)
        )
        for f in systems
    }
    checked = 0
    for a in systems:
        for b in systems:
            checked += 1
            same_sig = sigs[a] == sigs[b]
            conj = any(
                all(perm[a[x]] == b[perm[x]] for x in range(max_n))
                for perm in permutations(range(max_n))
            )
            if same_sig != conj:
                return [f"(c) failed at f={a} g={b}"], checked
    return [], checked


if __name__ == "__main__":
    fails = check_structure()
    cfails, pairs = check_conjugacy()
    fails.extend(cfails)
    if fails:
        for f in fails[:20]:
            print("FAIL:", f)
    else:
        print("PASS: irreducible equals connected for all maps on <= 4 points")
        print("PASS: component partition is the finest invariant partition")
        print(f"PASS: conjugacy matches component signatures on {pairs} pairs")
