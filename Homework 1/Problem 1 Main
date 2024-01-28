% Math 5604 Numerical Differential Equations
% Joshua Santy 
% Homework 1 Problem 1
function main(N, T)
% ======================================================================
% Functions to compare the forward and backward Euler methods in solving
% the cooling problems
% Inputs:
% T: End time of simulations
% N: Number of partition on [0, T].
% ======================================================================
k = T/N % Setting time step;
t = 0:k:T; % Setting time sequences;
y_fe = zeros(1,N+1); % Solution from FE;
y_be = zeros(1,N+1); % Solution from BE;
y_fe(1) = 1; % Initial conditions;
y_be(1) = 1;
% Time marching:
for n = 1:N
y_fe(n+1) = y_fe(n) + k * (3 + exp(-t(n)) - y_fe(n));
y_be(n+1) = (y_be(n) + 3 * k + k * exp(-t(n+1))) / (1 + k);
end
% Exact solution
y_ex =@(x) t.*exp(-t) -2*exp(-t) + 3;
%Getting specific values
y_fe_at_2 = y_fe(2)
y_be_at_2 = y_be(2)
close all
% Compare the numerical solution;
figure(1); hold on
plot(t, y_fe, 'r-.', 'linewidth', 2);
plot(t, y_be, 'b--', 'linewidth', 2);
plot(t, y_ex(t), 'k-', 'linewidth', 2);
xlabel('t'); ylabel('y(t)')
legend('Forward Euler solution', 'Backward Euler solution', 'Exact solution')
% Compare the numerical errors;
figure(2); hold on
plot(t, y_fe - y_ex(t), 'r-', 'linewidth', 2);
plot(t, y_be - y_ex(t), 'b--', 'linewidth', 2);
xlabel('t'); ylabel('Errors')
legend('Forward Euler method', 'Backward Euler method')
