function interpola(f, a, b, n)

% approssimazione di una funzione mediante polinomio interpolante
%
% dati di input
% f : funzione da interpolare
% [a, b] : intervallo di rappresentazione 
% n : numero di nodi equidistanti
%
% output grafico

if nargin == 0
    %esempio 1
    f = @(x) (sin(x));
    a = 0;
    b = pi;
    n = 10;
end

%nodi
x = linspace(a, b, n);
% valutazione della funzione f nei nodi
y = f(x);
X = linspace(a, b, 100)';
Y = lagrange(x, y, X);

fX = f(X);

%parte grafica
figure(1)
plot(x, y, 'o', X, fX, X, Y)
legend('punti', 'f(x)', 'p_n(x)')

function Y = lagrange(x, y, X)

% interpolazione di lagrange
%
% dati in input
% x : vettore di nodi
% y : vettore di ordinate
% X : vettore di punti in cui valutare il polinomio interpolante
%
% dati di output
% Y : vettore delle valutazioni del polinomio interpolante nei punti in X

n = length(x);

for j = 1:length(X)
    Y(j) = 0;
    for k = 1 : n
        Lk = 1;
        for i  = [1 : k-1, k+1 : n]
            
            Lk = Lk * (X(j) - x(i)) / (x(k) - x(i));
        end

        Y(j) = Y(j) + Lk * y(k);
    end
end

