clear;clc;
[delta, f0, beta] = data(1);

sigma = 0:5e-3:20; % Sigma sweep
roots_ = zeros(2,length(sigma)); % Create empty array for roots  
e=0.05;
f=1;
delta=1;
for i = 1:length(sigma)
    h=3+e*sigma(i);
  
    L=(f*h^2)/(2*(1-h^2));
p=64/81;
    p=p*((81/4)*L^2-9*sigma(i)/4-(90/16)*L^2);
    q=(64/81);
    q=q*(81*L^4-18*sigma(i)*L^2+delta^2+sigma(i)^2);
    
	poly = [1, p, q]; 
	roots_(:,i) = roots(poly); % Calculate roots of polynomial and append it to 'roots' array
end
GAMMA=[];
ALPHA=[];
SIGMA=[];
for i = 1:length(sigma) % Sweep all values of 'sigma' vector
	for j=1:2 % Sweep all roots for every sigma value
		alpha_sq = roots_(j,i);
		if isreal(alpha_sq) % If root is real continue, if not proceed to next root
			if (alpha_sq >= 0) % If root is positive continue, if not proceed to next root
% 				figure(1) % Sigma-alpha graph
% 				plot(sigma(i), sqrt(alpha_sq), 'r.')
% 				hold on
% 				figure(2) % Sigma-gamma graph
 h=3+e*sigma(i);
    L=f*h^2/(2*(1-h^2));
				gamma = atan2(9*delta,3*( -sigma(i)+(9*alpha_sq/8)+9*L^2)); % Calculate gamma value for known alpha
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
axis([0 22 0 5])
figure(2)
plot(SIGMA, GAMMA,  'r.');
axis([0 22 0 5])

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


