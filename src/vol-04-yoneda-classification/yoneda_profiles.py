#!/usr/bin/env python3
"""Phase D experiment for vol-04-yoneda-classification.

Evidences (computational evidence only, never proof):
  - Corollary (full faithfulness): Hom(A,B) <-> Nat(y(A), y(B)) on a finite
    test category. Function: check_yoneda_bijection.
  - Corollary (relational equivalence is isomorphism): distinct objects of the
    test category have distinct relational profiles. Function: check_faithfulness.
  - Remark (finite Stone duality): the Stone space of the power set of a finite
    set X recovers X from ultrafilter probes. Function: check_stone_finite.

Run: python3 yoneda_profiles.py
"""

from itertools import product


def make_category():
    """Finite category: objects A, B, C; morphisms idA, idB, idC, f: A -> B."""
    objs = ["A", "B", "C"]
    hom = {
        ("A", "A"): ["idA"],
        ("B", "B"): ["idB"],
        ("C", "C"): ["idC"],
        ("A", "B"): ["f"],
    }
    # composition table: (g: X->Y, f: Y->Z) -> g ; f
    comp = {
        ("idA", "f"): "f",
        ("f", "idB"): "f",
        ("idA", "idA"): "idA",
        ("idB", "idB"): "idB",
        ("idC", "idC"): "idC",
    }
    return objs, hom, comp


def profile(objs, hom, comp, P):
    """Relational profile y(P): values Hom(R,P) and action along probe morphisms."""
    values = {R: list(hom.get((R, P), [])) for R in objs}
    # action of y(P) along u: R->R' is precomposition: Hom(R',P) -> Hom(R,P)
    actions = {}
    for (R, Rp), us in hom.items():
        for u in us:
            for g in values[Rp]:
                # precomposition: y(P)(u)(g) = g . u
                actions[(u, g)] = comp.get((u, g), None)
    return values, actions


def natural_transformations(objs, hom, comp, P, Q):
    """All natural transformations y(P) -> y(Q) as per-object function choices."""
    yP = profile(objs, hom, comp, P)[0]
    yQ = profile(objs, hom, comp, Q)[0]
    choices = []
    for R in objs:
        src, dst = yP[R], yQ[R]
        if not src:
            choices.append([dict()])
        else:
            maps = []
            for images in product(dst, repeat=len(src)):
                maps.append(dict(zip(src, images)))
            choices.append(maps)
    naturals = []
    for combo in product(*choices):
        theta = dict(zip(objs, combo))
        ok = True
        for (R, Rp), us in hom.items():
            for u in us:
                for g in yP[Rp]:
                    through_u = comp.get((u, g), None)
                    if through_u is None or through_u not in yP[R]:
                        continue
                    left = theta[R].get(through_u, None)
                    # precompose in Q: y(Q)(u)(theta[Rp](g)) = theta[Rp](g) . u
                    img = theta[Rp].get(g, None)
                    if img is None:
                        continue
                    right = comp.get((u, img), None)
                    if left != right:
                        ok = False
                        break
                if not ok:
                    break
            if not ok:
                break
        if ok:
            naturals.append(theta)
    return naturals


def check_yoneda_bijection():
    """Hom(A,B) <-> Nat(y(A), y(B)) is a bijection (Yoneda, full faithfulness).

    Runs the check on every ordered pair of objects of the test category.
    """
    objs, hom, comp = make_category()
    pairs = [(P, Q) for P in objs for Q in objs]
    all_ok = True
    for (P, Q) in pairs:
        homs = hom.get((P, Q), [])
        nats = natural_transformations(objs, hom, comp, P, Q)
        # the bijection sends alpha to alpha_P(id_P)
        images = []
        for theta in nats:
            idP = "id" + P
            images.append(theta[P].get(idP, None))
        bijective = sorted(images) == sorted(homs) and len(set(images)) == len(homs)
        status = "PASS" if bijective and len(nats) == len(homs) else "FAIL"
        if status == "FAIL":
            all_ok = False
        print(f"  yoneda bijection {P}->{Q}: |Hom|={len(homs)} |Nat|={len(nats)} "
              f"images={sorted(set(images))} [{status}]")
    return all_ok


def check_faithfulness():
    """Distinct objects of the test category have distinct relational profiles."""
    objs, hom, comp = make_category()
    profiles = {P: profile(objs, hom, comp, P)[0] for P in objs}
    ok = True
    for P, Q in [("A", "B"), ("A", "C"), ("B", "C")]:
        distinct = profiles[P] != profiles[Q]
        status = "PASS" if distinct else "FAIL"
        if not distinct:
            ok = False
        print(f"  profiles of {P} and {Q} differ: {profiles[P]} vs {profiles[Q]} [{status}]")
    return ok


def check_stone_finite():
    """Stone space of 2^X recovers X from ultrafilter probes (finite Stone).

    Ultrafilters are enumerated exhaustively from the filter axioms and
    maximality, then compared with the principal filters, so the construction
    is shown to exhaust the ultrafilters rather than assume it.
    """
    from itertools import combinations

    X = [0, 1, 2]
    # Boolean algebra B = power set of X
    B = [frozenset(s) for r in range(len(X) + 1) for s in combinations(X, r)]
    full = frozenset(X)
    empty = frozenset()

    def is_filter(members):
        if full not in members or empty in members:
            return False
        for a in members:
            for b in members:
                if a & b not in members:
                    return False
            if not a <= full:
                return False
        # upward closure
        for a in members:
            for c in B:
                if a <= c and c not in members:
                    return False
        return True

    # exhaustively enumerate ultrafilters: maximal proper filters
    ultrafilters = []
    for mask in range(1, 2 ** len(B) - 1):
        members = frozenset(B[i] for i in range(len(B)) if mask >> i & 1)
        if not is_filter(members):
            continue
        # maximality: for every b, b in F or complement in F
        maximal = all(b in members or (full - b) in members for b in B)
        if maximal:
            ultrafilters.append(members)
    # principal filters F_x = {b : x in b}
    principals = [frozenset(b for b in B if x in b) for x in X]
    exhaust = sorted(ultrafilters, key=lambda f: sorted(map(sorted, f))) == \
              sorted(principals, key=lambda f: sorted(map(sorted, f)))
    # clopen recovery: each point is the intersection of its filter
    recovered = []
    for uf in ultrafilters:
        pt = frozenset.intersection(*[b for b in uf]) if uf else frozenset()
        recovered.append(tuple(sorted(pt)))
    rec_ok = sorted(recovered) == [tuple([x]) for x in X]
    status = "PASS" if exhaust and rec_ok and len(ultrafilters) == len(X) else "FAIL"
    print(f"  Stone(2^X): {len(ultrafilters)} exhaustive ultrafilters for |X|={len(X)}, "
          f"all principal: {exhaust}, recovered points={sorted(recovered)} [{status}]")
    return exhaust and rec_ok and len(ultrafilters) == len(X)


def main():
    print("yoneda_profiles.py: relational profile experiments (computational evidence)")
    ok1 = check_yoneda_bijection()
    ok2 = check_faithfulness()
    ok3 = check_stone_finite()
    print(f"SUMMARY: check_yoneda_bijection={'PASS' if ok1 else 'FAIL'} "
          f"check_faithfulness={'PASS' if ok2 else 'FAIL'} "
          f"check_stone_finite={'PASS' if ok3 else 'FAIL'}")
    return 0 if (ok1 and ok2 and ok3) else 1


if __name__ == "__main__":
    raise SystemExit(main())
