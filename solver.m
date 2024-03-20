function sol = solver(theta, y, zeta_1, omega_1, zeta_2, omega_2, p)

sol = [y(2); -2*zeta_1*omega_1*y(2)-omega_1^2*y(1)+p*cos(theta)];
if (y(1) > 1.)
    sol = [y(2); -2*zeta_2*omega_2*y(2)-omega_2^2*y(1)+p*cos(theta)+omega_2^2-omega_1^2];
end