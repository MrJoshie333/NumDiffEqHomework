function main()
    N_values = [32, 128];
    colors = ["r-.", "b-."];
    T = 2;

    figure(1); hold on
    
    for i = 1:length(N_values)
        N = N_values(i);
        color = colors(i);
        [t, y_be, y_ex] = run(N, T);
        plot(t, y_be, color, 'linewidth', 2);
        y_be(end) %To get correct answer for part b, must replace one of the N values with 64 to get a k of 1/32. Otherwise, the N values are 32, 128

    end
    % Plot exact solution
    plot(t, y_ex(t), 'k-', 'linewidth', 2);
    title("Problem 1 Backwards Euler")
    subtitle("Numerical Result for k=1/16 and k=1/32")
    xlabel('t'); ylabel('y(t)');
    legend('k = 1/16', 'k = 1/32', 'Exact solution');
    
    hold off
end

function [t, y_be, y_ex] = run(N, T)
    k = T/N;
    t = 0:k:T;
    y_be = zeros(1, N+1);
    y_be(1) = 1;

    for n = 1:N
        y_be(n+1) = (y_be(n) + 3 * k + k * exp(-t(n+1))) / (1 + k);
    end
    y_ex =@(x) t.*exp(-t) -2.*exp(-t) + 3;
end


