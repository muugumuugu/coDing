def adjugate(a, m=None):
    # Initialize
    sign = 1
    previous = pivot = 1

    # Bareiss formula
    def do_pivot(a, b, c, d, e):
        x = a * d - b * c
        if m is None:
            q, r = divmod(x, e)
            assert r == 0
            return q
        q = x * pow(e, -1, m)
        return q % m

    # Assert square matrix
    n = len(a)
    assert all(len(row) == n for row in a)

    # Build augmented matrix
    am = [
        list(map(int, row)) + [0] * i + [1] + [0] * (n - i - 1)
        for i, row in enumerate(a)
    ]

    # Iterate diagonally
    for c in range(n):

        # Test pivot
        if am[c][c] == 0:

            # Find pivot
            for i in range(c, n):
                if am[i][c] != 0:
                    break

            # Non-invertible detection
            else:
                return 0, [[0] * n for _ in range(n)]

            # Switch rows
            am[c], am[i] = am[i], am[c]
            sign *= -1

        # Get pivot
        previous, pivot = pivot, am[c][c]

        # Set zeros
        for i, row in enumerate(am):
            if i == c:
                continue
            am[i] = [
                do_pivot(pivot, y, row[c], x, previous) for x, y in zip(row, am[c])
            ]

    # Determinant
    determinant = sign * pivot
    if m is not None:
        determinant %= m

    # Return
    return determinant, [row[n:] for row in am]
