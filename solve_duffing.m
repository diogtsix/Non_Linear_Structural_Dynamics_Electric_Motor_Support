function sol = solve_duffing(t, y, zeta, epsilon, n, p)

sol = [y(2); -2 * zeta * y(2) - y(1) - epsilon * y(1) ^ 3 + n ^ 2 * p * cos(n*t)];