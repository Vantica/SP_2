function Tasks_2_1
clc;
clear all;
close all;
%% CONSTANTS
unit_mass   = 1.6726E-27;           % mass of a proton


task2_2();






%% Task 2.1%%%%%%%%%%%%%%%%%%%%%%%%%%%%
function f = maxwellian(m, n, T, u, v)
kb = 1.38066e-23; % Boltzmann constant
f = n*(m/(2*pi*kb*T)^(3/2))*exp(-(m*(v-u).^(2))/(2*kb*T));
end

%% Task 2.2%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%---------------------------------------------
function task2_2 
% Bin the velocity space:
T = 1E6;
n = 3E6;
dv = 5E3;
vmin = 0;
vmax = 6E5;
u = 3E5;
m = unit_mass;
v = vmin : dv : vmax;
%---------------------------------------------
% Calculate distribution function
f = zeros(length(v), 1); % Pre-allocate memory for all f values.
% It would be the best to avoid for-loops (use vectorized technique)

f = maxwellian(m, n, T, u, v);

%---------------------------------------------
% Plot the results
figure;
subplot(2,1,1);
plot(v, f);

% plot in log-scale
subplot(2,1,2);
semilogy(v, f); % equivalent to plot(v, log10(f) );

end

end%End main function