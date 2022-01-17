function a = coeff(x, y)

% scrivere una funzione matlab che abbia in input due vettori x e y 
% della stessa lunghezza e restituisca, in output, 
% i coefficienti del polinomio interpolante in un vettore a.

%inizializzazione della matrice
A = zeros(length(x), 'double');

% costruzione della matrice vondermande
for i = 1:length(x)
    for j = 1:length(x)
        A(i, j) = x(i)^(j-1);
    end
end

a = inv(A) * y;
