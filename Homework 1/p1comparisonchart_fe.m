function main()
    N_values = [8, 16, 32, 64, 128, 256, 512, 1024];

    T = 2;

    figure(1); hold on
    
    for i = 1:length(N_values)
        N = N_values(i);
     
        [t, y_fe, y_ex] = run(N, T);
        plot(t, y_fe,'linewidth', 2);
        y_fe(end);%To get correct answer for part b, must replace one of the N values with 64 to get a k of 1/32. Otherwise, the N values are 32, 128
        error = y_fe(end) - 3;
        error 
    end
    % Plot exact solution
    plot(t, y_ex, 'k-', 'linewidth', 2);
    title("Problem 1 Forward Euler")
    subtitle("Numerical Result for k=1/16 and k=1/32")
    xlabel('t'); ylabel('y(t)');
    legend('k = 1/16', 'k = 1/32', 'Exact solution');
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
        y_fe(n+1) = y_fe(n) + k * (3 + exp(-t(n)) - y_fe(n));
        y_be(n+1) = (y_be(n) + 3 * k + k * exp(-t(n+1))) / (1 + k);
    end
    y_ex =@(x) t.*exp(-t) -2.*exp(-t) + 3;

end


