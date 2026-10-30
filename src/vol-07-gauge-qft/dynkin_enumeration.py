#!/usr/bin/env python3
"""Phase D experiment: finite-type Dynkin diagrams up to rank eight.

Claim evidenced (paper, Theorem 3.1): the connected Dynkin diagrams of finite
type are exactly the lists A_r, B_r, C_r, D_r, G2, F4, E6, E7, E8. The
experiment enumerates all edge-labelled trees up to eight nodes, builds the
corresponding Cartan matrices, keeps the positive definite ones, and checks
that the surviving isomorphism classes are exactly the standard finite-type
list. Computational evidence only; the classification theorem is Theorem 3.1
of the paper.

Module: dynkin_enumeration.py
Function named in the code evidence appendix: enumerate_finite_type
"""

# Label convention for adjacency entries (node -> [(neighbor, label)]):
#   1 = single edge (a_ij = a_ji = -1)
#   2 = double edge, arrow at `node` (a_node,other = -2)
#   3 = double edge, arrow at `neighbor` (a_node,other = -1, a_other,node = -2)
#   4 = triple-edge form of G2, arrow at `node` (a_node,other = -3)
#   5 = triple-edge form of G2, arrow at `neighbor`
# A multiple edge is stored with complementary labels at its two endpoints:
# 2 with 3, and 4 with 5.

from fractions import Fraction


def canonical_form(adj):
    """AHU canonical string of an edge-labelled unrooted tree.

    The mark of a parent-child edge records its shape as seen in that
    direction. The string is an isomorphism invariant of the labelled tree.
    """

    def rooted_encoding(root, parent):
        parts = []
        for neighbor, label in adj[root]:
            if neighbor == parent:
                continue
            if label == 1:
                mark = "s"
            elif label in (2, 4):
                # arrow points at root, i.e. at the parent side of this edge.
                mark = "d3" if label == 4 else "d2"
            else:
                mark = "D3" if label == 5 else "D2"
            parts.append(mark + rooted_encoding(neighbor, root))
        return "(" + "".join(sorted(parts)) + ")"

    degree = {node: sum(1 for _ in adj[node]) for node in adj}
    current = dict(degree)
    leaves = [node for node, d in current.items() if d <= 1]
    remaining = len(adj)
    while remaining > 2:
        next_leaves = []
        for node in leaves:
            current[node] = -1
            remaining -= 1
            for neighbor, _ in adj[node]:
                if current[neighbor] >= 0:
                    current[neighbor] -= 1
                    if current[neighbor] == 1:
                        next_leaves.append(neighbor)
        leaves = next_leaves
    centers = [node for node in adj if current[node] >= 0]
    return min(rooted_encoding(center, None) for center in centers)


def enumerate_unlabelled_trees(n):
    """All unlabelled trees on n nodes as adjacency dicts with label 1."""
    if n == 1:
        return [{0: []}]
    seen = {}
    for smaller in enumerate_unlabelled_trees(n - 1):
        for attach_to in smaller:
            candidate = {node: list(neigh) for node, neigh in smaller.items()}
            new_node = n - 1
            candidate[new_node] = []
            candidate[attach_to].append((new_node, 1))
            candidate[new_node].append((attach_to, 1))
            key = canonical_form(candidate)
            if key not in seen:
                seen[key] = candidate
    return list(seen.values())


def edge_list(adj):
    edges = []
    for node, neigh in adj.items():
        for nb, label in neigh:
            if node < nb:
                edges.append((node, nb, label))
    return edges


def apply_labels(tree, labels):
    """Labelled copy of `tree` for a per-edge label tuple.

    For a multiple edge, the arrow target is the endpoint named by the label:
    labels 2 and 4 put the arrow at the lower-index endpoint, labels 3 and 5
    at the higher-index endpoint.
    """
    adj = {node: [] for node in tree}
    for (u, v, _), label in zip(edge_list(tree), labels):
        if label == 1:
            adj[u].append((v, 1))
            adj[v].append((u, 1))
        elif label == 2:
            adj[u].append((v, 2))
            adj[v].append((u, 3))
        elif label == 3:
            adj[u].append((v, 3))
            adj[v].append((u, 2))
        elif label == 4:
            adj[u].append((v, 4))
            adj[v].append((u, 5))
        else:
            adj[u].append((v, 5))
            adj[v].append((u, 4))
    return adj


def cartan_matrix(adj):
    """Cartan matrix of the labelled tree: 2 on the diagonal, -1 or -2 or -3
    off it, with the short root's row carrying the larger entry."""
    nodes = sorted(adj)
    index = {node: i for i, node in enumerate(nodes)}
    n = len(nodes)
    matrix = [[2 if i == j else 0 for j in range(n)] for i in range(n)]
    for node, neigh in adj.items():
        for nb, label in neigh:
            i, j = index[node], index[nb]
            if label == 1:
                matrix[i][j] = -1
            elif label == 2:
                matrix[i][j] = -2
            elif label == 4:
                matrix[i][j] = -3
            else:
                matrix[i][j] = -1
    return matrix


def det_exact(matrix):
    """Exact determinant of a matrix over Q by Bareiss elimination."""
    n = len(matrix)
    mat = [[Fraction(v) for v in row] for row in matrix]
    sign = 1
    prev = Fraction(1)
    for k in range(n - 1):
        if mat[k][k] == 0:
            swap = None
            for r in range(k + 1, n):
                if mat[r][k] != 0:
                    swap = r
                    break
            if swap is None:
                return Fraction(0)
            mat[k], mat[swap] = mat[swap], mat[k]
            sign = -sign
        for i in range(k + 1, n):
            for j in range(k + 1, n):
                mat[i][j] = (mat[i][j] * mat[k][k] - mat[i][k] * mat[k][j]) / prev
        prev = mat[k][k]
    return sign * mat[n - 1][n - 1]


def symmetrized_form(cartan, adj):
    """The symmetric bilinear form of the root system.

    The Cartan matrix is symmetrizable: with positive weights d_i such that
    d_i a_ij = d_j a_ji the matrix B_ij = d_i a_ij is symmetric, and B is the
    form whose positive definiteness is the finite-type condition. The weights
    are propagated by breadth-first search over the tree.
    """
    nodes = sorted(adj)
    index = {node: i for i, node in enumerate(nodes)}
    n = len(nodes)
    weights = {nodes[0]: Fraction(1)}
    queue = [nodes[0]]
    while queue:
        node = queue.pop()
        for nb, _ in adj[node]:
            if nb in weights:
                continue
            i, j = index[node], index[nb]
            weights[nb] = weights[node] * Fraction(cartan[i][j], cartan[j][i])
            queue.append(nb)
    b = [[Fraction(0)] * n for _ in range(n)]
    for i, node_i in enumerate(nodes):
        for j, node_j in enumerate(nodes):
            b[i][j] = weights[node_i] * cartan[i][j]
    return b


def is_positive_definite(cartan, adj):
    """Sylvester's criterion on the symmetrized Cartan form."""
    n = len(cartan)
    b = symmetrized_form(cartan, adj)
    for k in range(1, n + 1):
        minor = [row[:k] for row in b[:k]]
        if det_exact(minor) <= 0:
            return False
    return True


def arm_lengths(adj, center):
    lengths = []
    for neighbor, _ in adj[center]:
        length = 1
        prev, cur = center, neighbor
        while len(adj[cur]) > 1:
            for nb, _ in adj[cur]:
                if nb != prev:
                    prev, cur = cur, nb
                    length += 1
                    break
        lengths.append(length)
    return sorted(lengths)


def name_diagram(adj):
    """Human-readable name of a connected edge-labelled tree."""
    n = len(adj)
    degrees = sorted(len(neigh) for neigh in adj.values())
    multiples = [edge for edge in edge_list(adj) if edge[2] != 1]
    if n == 1:
        return "A1"
    if n == 2:
        label = multiples[0][2] if multiples else 1
        if label in (4, 5):
            return "G2"
        return "B2 (same class as C2)" if multiples else "A2"
    if not multiples and max(degrees) == 2:
        return f"A{n}"
    if not multiples and max(degrees) == 3:
        center = max(adj, key=lambda node: len(adj[node]))
        arm = arm_lengths(adj, center)
        if arm == [1, 1, n - 3]:
            return f"D{n}"
        if arm == [1, 2, n - 4] and n in (6, 7, 8):
            return f"E{n}"
        return f"unnamed fork of rank {n}"
    if len(multiples) == 1 and max(degrees) == 2 and multiples[0][2] in (2, 3):
        u, v, _ = multiples[0]
        endpoint = u if len(adj[u]) == 1 else v if len(adj[v]) == 1 else None
        if endpoint is not None:
            return f"B{n} or C{n}"
        return "F4" if n == 4 else f"unnamed inner double edge of rank {n}"
    return f"unnamed diagram of rank {n}"


def pruned_labelings(edge_count):
    """Label tuples with at most one non-single edge.

    A diagram with two multiple edges is never positive definite; the
    unpruned cross-check at rank at most 4 below verifies this pruning does
    not change the finite-type output.
    """
    yield tuple(1 for _ in range(edge_count))
    for pos in range(edge_count):
        for label in (2, 3, 4, 5):
            labels = [1] * edge_count
            labels[pos] = label
            yield tuple(labels)


def full_labelings(edge_count):
    if edge_count == 0:
        yield ()
        return
    for rest in full_labelings(edge_count - 1):
        for label in (1, 2, 3, 4, 5):
            yield rest + (label,)


def enumerate_finite_type(max_rank=8, cross_check_rank=8):
    """Enumerate positive definite edge-labelled trees up to `max_rank` nodes.

    Returns (rows, forms) where rows are (rank, name, canonical form) of each
    isomorphism class found and forms is the set of canonical strings. Every
    rank up to `cross_check_rank` is enumerated WITHOUT pruning: all 5^(n-1)
    arrow assignments of every unlabelled tree are tested for positive
    definiteness, so no candidate with two or more multiple edges is skipped.
    """
    rows = []
    found = {}
    for n in range(1, max_rank + 1):
        for tree in enumerate_unlabelled_trees(n):
            edges = edge_list(tree)
            if n <= cross_check_rank:
                pruned = set()
                for labels in pruned_labelings(len(edges)):
                    adj = apply_labels(tree, labels)
                    if is_positive_definite(cartan_matrix(adj), adj):
                        pruned.add(canonical_form(adj))
                unpruned = set()
                for labels in full_labelings(len(edges)):
                    adj = apply_labels(tree, labels)
                    if is_positive_definite(cartan_matrix(adj), adj):
                        unpruned.add(canonical_form(adj))
                assert pruned == unpruned, (
                    f"pruning changed the output at rank {n}: {pruned ^ unpruned}"
                )
            for labels in full_labelings(len(edges)):
                adj = apply_labels(tree, labels)
                if not is_positive_definite(cartan_matrix(adj), adj):
                    continue
                key = canonical_form(adj)
                if key in found:
                    continue
                found[key] = n
                rows.append((n, name_diagram(adj), key))
    return rows, set(found)


def fork_tree(arms):
    """Tree with a center and arms of the given leaf counts."""
    adj = {0: []}
    nxt = 1
    for arm in arms:
        prev = 0
        for _ in range(arm):
            adj[prev].append((nxt, 1))
            adj[nxt] = [(prev, 1)]
            prev = nxt
            nxt += 1
    return adj


def path_tree(n):
    path = {i: [] for i in range(n)}
    for i in range(n - 1):
        path[i].append((i + 1, 1))
        path[i + 1].append((i, 1))
    return path


def expected_finite_type():
    """Canonical forms of the standard finite-type diagrams up to rank 8.

    Built from the standard shapes without any positive-definiteness test, so
    the comparison against the enumeration verifies that these shapes are
    exactly the positive definite ones.
    """
    expected = {}
    for n in range(1, 9):
        expected[f"A{n}"] = canonical_form(path_tree(n))
    expected["B2"] = canonical_form({0: [(1, 2)], 1: [(0, 3)]})
    expected["G2"] = canonical_form({0: [(1, 4)], 1: [(0, 5)]})
    for n in range(3, 9):
        for arrow in (2, 3):
            labelled = path_tree(n)
            labelled[n - 2] = [(nb, l) for nb, l in labelled[n - 2] if nb != n - 1]
            labelled[n - 1] = [(nb, l) for nb, l in labelled[n - 1] if nb != n - 2]
            if arrow == 2:
                labelled[n - 2].append((n - 1, 2))
                labelled[n - 1].append((n - 2, 3))
            else:
                labelled[n - 2].append((n - 1, 3))
                labelled[n - 1].append((n - 2, 2))
            expected[f"BC{n}:{arrow}"] = canonical_form(labelled)
    for n in range(4, 9):
        expected[f"D{n}"] = canonical_form(fork_tree([1, 1, n - 3]))
    for n in (6, 7, 8):
        expected[f"E{n}"] = canonical_form(fork_tree([1, 2, n - 4]))
    expected["F4"] = canonical_form(
        {0: [(1, 1)], 1: [(0, 1), (2, 2)], 2: [(1, 3), (3, 1)], 3: [(2, 1)]})
    return expected


if __name__ == "__main__":
    print("=== Phase D: finite-type Dynkin diagrams up to rank 8 ===")
    print("Claim (paper, Theorem 3.1): finite type = A, B, C, D, G2, F4, E6, E7, E8.")
    print()
    rows, found = enumerate_finite_type(8)
    print(f"{'rank':<6} {'name':<16}")
    print("-" * 24)
    for rank, name, _ in sorted(rows):
        print(f"{rank:<6} {name:<16}")

    expected = expected_finite_type()
    expected_forms = set(expected.values())
    print()
    print(f"isomorphism classes found:    {len(found)}")
    print(f"standard finite-type classes: {len(expected_forms)}")
    assert found == expected_forms, (
        f"mismatch: unexpected {found - expected_forms}, "
        f"missing {expected_forms - found}"
    )
    names = sorted({name for _, name, _ in rows})
    print(f"names found: {', '.join(names)}")
    print()
    print("All known-value assertions passed.")
    print("Status: computational evidence only; the classification is Theorem 3.1.")
