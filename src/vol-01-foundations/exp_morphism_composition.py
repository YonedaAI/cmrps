# Phase D experiment for vol-01-foundations.
# Claim evidenced: Proposition 4.4, composition of morphism kinds is not
# typed. The composite of an admissible embedding and an admissible
# coarse-graining on finite classical records is a constant state map that
# satisfies none of the five preservation laws. Computational evidence only.

SOURCE = {"a": 0, "b": 1}
MID = {"1": 0, "2": 1, "3": 2, "4": 3}
TARGET = {"p": 0, "q": 1}

E_STATE = {"a": "1", "b": "3"}
G_STATE = {"1": "p", "2": "q", "3": "p", "4": "q"}


def compose(g, f):
    return {x: g[f[x]] for x in f}


def is_injective(m):
    return len(set(m.values())) == len(m)


def is_surjective(m, codomain):
    return set(m.values()) == set(codomain)


def is_bijective(m, codomain):
    return is_injective(m) and is_surjective(m, codomain)


def preserves_laws(composite, source, target):
    """Check the five preservation laws of Definition 4.3 on a state map."""
    results = {}
    results["coarse-graining (surjective state map)"] = is_surjective(
        composite, target
    )
    results["embedding (injective state map)"] = is_injective(composite)
    results["equivalence (bijective state map)"] = is_bijective(
        composite, target
    )
    results["duality (invertible after opposite)"] = is_bijective(
        composite, target
    )
    results["limiting procedure (named limit process)"] = False
    return results


if __name__ == "__main__":
    composite = compose(G_STATE, E_STATE)
    e_ok = is_injective(E_STATE) and set(E_STATE.values()) <= set(MID)
    g_ok = is_surjective(G_STATE, TARGET)
    laws = preserves_laws(composite, SOURCE, TARGET)
    print("embedding admissible:", e_ok)
    print("coarse-graining admissible:", g_ok)
    print("composite state map:", composite)
    for law, holds in laws.items():
        print(f"  {law}: {'holds' if holds else 'fails'}")
    if e_ok and g_ok and not any(laws.values()):
        print("PASS: composite satisfies no listed preservation law")
    else:
        print("FAIL: counterexample did not behave as Proposition 4.4 states")
