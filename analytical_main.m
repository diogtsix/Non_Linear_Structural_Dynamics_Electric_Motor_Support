clear;clc;
[delta, f0, beta] = data(1);

sigma = -5:5e-2:25; % Sigma sweep
roots_ = zeros(3,length(sigma)); % Create empty array for roots  

for i = 1:length(sigma)
	poly = [beta^2, -2 * beta * sigma(i), sigma(i)^2 + delta^2, - f0^2]; 
	roots_(:,i) = roots(poly); % Calculate roots of polynomial and append it to 'roots' array
end
GAMMA=[];
ALPHA=[];
SIGMA=[];
for i = 1:length(sigma) % Sweep all values of 'sigma' vector
	for j=1:3 % Sweep all roots for every sigma value
		alpha_sq = roots_(j,i);
		if isreal(alpha_sq) % If root is real continue, if not proceed to next root
			if (alpha_sq >= 0) % If root is positive continue, if not proceed to next root
% 				figure(1) % Sigma-alpha graph
% 				plot(sigma(i), sqrt(alpha_sq), 'r.')
% 				hold on
% 				figure(2) % Sigma-gamma graph
				gamma = atan2(delta, beta * alpha_sq - sigma(i)); % Calculate gamma value for known alpha
                GAMMA=[GAMMA gamma];
                ALPHA=[ALPHA alpha_sq];
                SIGMA=[SIGMA sigma(i)];
% 				plot(sigma(i), gamma, 'r.');
% 				hold on
			end
		end
	end
end
ALPHA=sqrt(ALPHA);
figure(1)
plot(SIGMA, ALPHA, 'r.')
figure(2)
plot(SIGMA, GAMMA,  'r.');



figure(1) % Create xlabel, ylabel, tile and legend for sigma-alpha graph
xlabel('${\sigma}$','interpreter','latex')
ylabel('${\alpha}$','interpreter','latex')
title('Amplitude response','interpreter','latex')
legend(['{\delta}=', num2str(delta)])
grid on
figure(2) % Create xlabel, ylabel, tile and legend for sigma-gamma graph
xlabel('${\sigma}$','interpreter','latex')
ylabel('${\gamma}$','interpreter','latex')
title('Phase response','interpreter','latex')
legend(['{\delta}=', num2str(delta)])
grid on






