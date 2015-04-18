function Tasks_2_1
clc;
clear all;
close all;
%% CONSTANTS
unit_mass   = 1.6726E-27;           % mass of a proton

task2_2(5E3);
task2_2(2E4);
task2_2(4E4);
task2_2(6E4);


%% Task 2.1%%%%%%%%%%%%%%%%%%%%%%%%%%%%
function f = maxwellian(m, n, T, u, v)
kb = 1.38066e-23; % Boltzmann constant
f = n*(m/(2*pi*kb*T)^(3/2))*exp(-(m*(v-u).^(2))/(2*kb*T));
end

%% Task 2.2%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%---------------------------------------------
function task2_2(dv) 
% Bin the velocity space:
T = 1E6;
n = 3E6;
vmin = 0;
vmax = 6E5;
u = 3E5;
m = unit_mass;
v = vmin : dv : vmax;
%---------------------------------------------
% Calculate distribution function
f = zeros(length(v), 1); % Pre-allocate memory for all f values.

f = maxwellian(m, n, T, u, v);

%---------------------------------------------
% Plot the results
figure;
subplot(2,1,1);
plot(v, f);
title(sprintf('Maxwellian distribution for a proton with dv=%1.2f [m/s] ',dv));
xlabel('v(t) [m/s]');
ylabel('Fs(v)');


% plot in log-scale
subplot(2,1,2);
semilogy(v, f); % equivalent to plot(v, log10(f) );
xlabel('v(t) [m/s]');
ylabel('Fs(v)');
end

end%End main function