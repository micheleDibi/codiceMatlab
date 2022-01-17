function U = fattorizzazioneLUconPivot(A)

% 'm' numero di righe
[m,n] = size(A);

%copia della prima riga
for a = 1:n
    U(1, a) = A(1, a);
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

        %controllo che il valore trovato sia diverso da zero
        if(A(suppRiga, k) ~= 0)

            % devo effettuare lo scambio delle due righe
            for w = 1:n 
                suppVal = A(k, w);
                A(k, w) = A(suppRiga, w);
                A(suppRiga, w) = suppVal;
            end
            % introduzione della VARIANTE
            % non ci sono elementi pivotali lungo la colonna, 
            % dunque sono costretto a spostarmi di una colonna a destra
        end
        U = A;
    end 

    for i = (k+1):m
        molt = -(A(i, k) / A(k, k));

        for j = k:n
            U(i,j) = molt * A(k, j) + A(i, j);
        end
    end
    A = U;
end