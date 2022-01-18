function [C, b] = eliminazioneGauss(A, b)

% scrivere una funzione Scilab che implementi l’algoritmo di eliminazione di Gauss che effettui scambi
% di righe solo nel caso si incontri un elemento pivotale nullo. La funzione dovr`a avere:
% - INPUT: una matrice quadrata A e un vettore colonna b;
% - OUTPUT: Una matrice triangolare superiore U e un vettore colonna c tali che il sistema U x = c sia equivalente al sistema Ax = b.

C = zeros();
u = zeros();

[m, n] = size(A);

for k = 1:m

    if A(k, k) == 0 

        suppRiga = k+1;
        while(A(suppRiga, k) == 0 && suppRiga <= m)
            suppRiga = suppRiga + 1;
        end

        if(A(suppRiga, k) ~= 0)
            for i = 1:n
                temp = A(k, i);
                A(k, i) = A(suppRiga, i);
                A(suppRiga, i) = temp;
            end

            temp = b(k);
            b(k) = b(suppRiga);
            b(suppRiga) = temp;
        end

    end

    for j = k+1:m
        molt = -(A(j, k) / A(k,k));
        U(j, k) = molt;

        for i = k:n
            A(j, i) = molt * A(k, i) + A(j, i);
        end

        b(j) = molt * b(k) + b(j);
    end
end

u = b;
C = A;
