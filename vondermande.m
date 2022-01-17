function V = vondermande(x)

% scrivere una funzione matlab che abbia in input un vettore x e 
% restituisca in output la matrice V di Vandermonde

V = zeros(length(x), 'int64');

for i = 1:length(x)
    for j = 1:length(x)
        V(i, j) = x(i)^(j-1);
    end
end