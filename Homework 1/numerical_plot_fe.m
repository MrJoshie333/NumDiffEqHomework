function main()
    N_values = [32, 128];
    colors = ["r-.", "b-."];
    T = 2;

    figure(1); hold on
    
    for i = 1:length(N_values)
        N = N_values(i);
        color = colors(i);
        [t, y_fe, y_ex] = run(N, T);
        plot(t, y_fe, color, 'linewidth', 2);
        y_fe(end) %To get correct answer for part b, must replace one of the N values with 64 to get a k of 1/32. Otherwise, the N values are 32, 128
    end
    % Plot exact solution
    plot(t, y_ex(t), 'g-.', 'linewidth', 2)
    title("Problem 1 Forward Euler")
    subtitle("Numerical Result for k=1/16 and k=1/32")
    xlabel('t'); ylabel('y(t)');
    legend('k = 1/16', 'k = 1/32', 'Exact solution');
    %t(end)
    %y_fe(end)
    
    hold off
end

function [t, y_fe, y_ex] = run(N, T)
    k = T/N;
    t = 0:k:T;
    y_fe = zeros(1, N+1);
    y_fe(1) = -2;

    for n = 1:N
        y_fe(n+1) = y_fe(n) + k*((3*t(n)^2+10*t(n)+1)/(2*(y_fe(n)+1)));
  
    end
    %y_ex =@(x) t.*exp(-t) -2.*exp(-t) + 3; % Problem 1
    y_ex =@(x) -sqrt(1+(t.^3)+((5*t.^2))+(t))-1 %Problem 2
end


