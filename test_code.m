function main()
    N_values = [12, 24, 48, 96, 192 1536];
    %colors = ["r-.", "b-.", "g-."];
    T = 3;

    figure(1); hold on
    
    for i = 1:length(N_values)
        N = N_values(i);
        %color = colors(i);
        [t, y_fe, y_ex] = run(N, T);
        plot(t, y_fe, 'linewidth', 2);
        y_fe(end) %To get correct answer for part b, must replace one of the N values with 64 to get a k of 1/32. Otherwise, the N values are 32, 128
    end
    % Plot exact solution
    %plot(t, y_ex, 'k-', 'linewidth', 2);
    %title("Problem 1 Forward Euler")
    %subtitle("Numerical Result for k=1/16 and k=1/32")
    %xlabel('t'); ylabel('y(t)');
    legend('k = 1/16', 'k = 1/32', 'k = 1/512');
    %t(end)
    %y_fe(end)
    
    hold off
end

function [t, y_fe, y_be, y_ex] = run(N, T)
    k = T/N;
    t = 0:k:T;
    y_fe = zeros(1, N+1);
    y_be = zeros(1, N+1);
    y_fe(1) = 1;
    y_be(1) = 1;

    for n = 1:N
        y_fe(n+1) = y_fe(n)+k * (1+2*exp(-t(n))*y_fe(n)-(y_fe(n))^3);
        
    end
    y_ex =@(x) t.*exp(-t) -2.*exp(-t) + 3;
end
%Numerically Exact: 1.0479
%error:
% 1/4: 1.0458; diff = 0.0021
% 1/8: 1.0468; diff = 0.0011
% 1/16: 1.0473; diff = 0.0006
% 1/32: 1.0476; diff = 0.0003
% 1/64: 1.0577; diff = 0.0002
%

