function interpolaFunction(f, a, b, n)

% interpolazione funzione con confronto
% 
% input
% f : funzione da interpolare
% [a, b] : estremi dell'intervallo
% n : numero di nodi equidistanti dell'intervallo [a, b]

if(nargin == 0) 
    f = @(x) 1./(1+x.^2);
    a = -5;
    b = 5;
    %f = @(x) exp(-x).*sin(2*x);
    %a = 0;
    %b = pi;
    n = 10;
end

x = linspace(a, b, n);
xx = linspace(a, b, 100)';
y = f(x);
fxx = f(xx);
yy = lagrange(x, y, xx);

figure(1);
plot (x, y, 'b--o', xx, fxx, 'g', xx, yy, 'r');
legend('x, y', 'xx, fxx', 'xx, yy');

% plot (xx, yy, 'r'); copre plot(xx, fxx, 'g');
