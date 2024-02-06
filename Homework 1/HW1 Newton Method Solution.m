%Newton's Method HW1 Solution!

function [k,t,u] = BE(N,T)
k = T/N;
t = 0:k:T;
tol = 0.001;
u = zeros(1,N+1);
u(1)=-2;

for n = 1:N 
    u(n+1) = Newton(u(n), t(n+1), k ,tol);
end

%put in different file?
function output = Newton(xold, t, k ,tol)

fun=@(x) 2*(x+1)*(x-xold)-k*(3*t^2+10*t+1);
dfun  =@(x) 2*(2*x+1-xold);

error = 10;
while (error > tol)
    xnew = xold - fun(xold)/dfun(xold);
    %Can use either but have to change stopping condition: 
    %error = abs(xnew-xold); %Stopping Condition: |x_(m+1)-x_m| < tol;
    error = abs(fun(xnew)); %Stopping Condition: |f(x_(m+1))| < tol;
    xold = xnew;
end
output = xnew;
