% Clear
% -------------------------------------------------------------------------
clear all;
clc;
% -------------------------------------------------------------------------
% Data
t0 = 0.;
t_end = 500.;
epsilon = 0.05;
delta = 0.5;
f = 2.5;
sigma = 5;
n = 1 + epsilon * sigma;
p = epsilon * f;
zeta = epsilon * delta;
% -------------------------------------------------------------------------
% Initial conditions
u0 = -0.1;  % Initial position
v0 = 0.015; % Initial velocity
% -------------------------------------------------------------------------
% Solution
y0 = [u0;v0]; % Initial conditions vector
t_ode = t0:0.01:t_end; % Return at the specified values given in this vector

[t,y] = ode45(@(t,y) solve_duffing(t,y,zeta,epsilon,n,p), t_ode, y0);

figure(1)
hold on
xlabel('t','interpreter','latex')
ylabel('u','interpreter','latex')
title(['Response for ${\sigma}$=', num2str(sigma) ' and ${\delta}$=', num2str(delta)],'interpreter','latex')
plot(t_ode, y(:,1))
grid on


