% Clear
% -------------------------------------------------------------------------
clear all;
clc;
% -------------------------------------------------------------------------
% Data
p = 1.;
zeta_1 = 0.015;
zeta_2 = 0.101;
ratio_1 = 10.05; % omega_2_dash / omega_1_dash
ratio_2 = 4.35; % omega / omega_1_dash
omega = 1.;

omega_1_dash = omega / ratio_2;
omega_2_dash = ratio_1 * omega_1_dash;

omega_1 = omega_1_dash / omega;
omega_2 = omega_2_dash / omega;








% -------------------------------------------------------------------------
% Initial conditions
u0 = 0.;
v0 = 0.;
% -------------------------------------------------------------------------
% Solution

y0 = [u0;v0];
steps = 1000.;
theta_ode = 0.:2*pi/steps:2000*2*pi;
options = odeset('MaxStep',1e-3);
[theta,y] = ode45(@(theta,y) solver(theta,y,zeta_1,omega_1,zeta_2,omega_2,p), theta_ode, y0, options);

y_poincare = y(1:steps:end,1);
ydot_poincare = y(1:steps:end,2);

figure(1)
subplot(2,1,1)
plot(theta(end-50*steps:end),y(end-50*steps:end,1))
xlabel('${\theta}={\omega}t$','interpreter','latex')
ylabel('y','interpreter','latex')
title('Response at the end of simulation','interpreter','latex')
subplot(2,1,2)
plot(theta(end-50*steps:end),y(end-50*steps:end,2))
xlabel('${\theta}={\omega}t$','interpreter','latex')
ylabel('$\dot{y}$','interpreter','latex')
title('Velocity at the end of simulation','interpreter','latex')
figure(2)
subplot(2,1,1)
scatter(y_poincare(end-100:end),ydot_poincare(end-100:end),'r.')
xlabel('y','interpreter','latex')
ylabel('$\dot{y}$','interpreter','latex')
title('Poincare section','interpreter','latex')
subplot(2,1,2)
plot(y(end-50*steps:end,1),y(end-50*steps:end,2))
xlabel('y','interpreter','latex')
ylabel('$\dot{y}$','interpreter','latex')
title('Trajectory in $(y,\dot{y})$ plane','interpreter','latex')
