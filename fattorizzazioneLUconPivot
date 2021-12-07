function U = fattorizzazioneLUconPivot(A)

% 'm' numero di righe
[m,n] = size(A);

%copia della prima riga
for x = 1:n
    U(1, x) = A(1, x);
end

for k = 1:m
    for i = (k+1):m
        molt = -(A(i, k) / A(k, k));
        for j = k:m
            U(i,j) = molt * A(k, j) + A(i, j);
        end
    end
    A = U;
end
