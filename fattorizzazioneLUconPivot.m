function U = fattorizzazioneLUconPivot(A)

% 'm' numero di righe
[m,n] = size(A);

%copia della prima riga
for x = 1:n
    U(1, x) = A(1, x);
end

for k = 1:m
    
    % controllo che il pivot sia nullo - eventualmente devo risolvere la
    % situazione
    while(A(k, k) == 0 && k < m) 
        suppRiga = k;
        % scorro tra le righe finché non trovo un pivot diverso da 0 e non
        % supero il numero di righe definito
        while(A(suppRiga, k) == 0 && suppRiga < m) 
            suppRiga = suppRiga + 1;
        end

        %controllo che il valore trovato sia minore del numero di righe
        %definito
        if(suppRiga <= m)

            % devo effettuare lo scambio delle due righe
            for w = 1:n 
                suppVal = A(k, w);
                A(k, w) = A(suppRiga, w);
                A(suppRiga, w) = suppVal;
            end
            
        else
            % introduzione della VARIANTE
            % non ci sono elementi pivotali lungo la colonna, 
            % dunque sono costretto a spostarmi di una colonna a destra
            k = k + 1;
        end
        U = A;
    end 

    for i = (k+1):m
        
        molt = -(A(i, k) / A(k, k));

        for j = k:m
            U(i,j) = molt * A(k, j) + A(i, j);
        end
    end
    A = U;
end
