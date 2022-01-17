function yy = lagrange(x, y, xx) 

% interpolazione polinomiale con il metodo di lagrange
%
% input
% x : array di nodi;
% y : array di ordinate;
% xx : array di ascisse;
%
% output
% yy : array di valutazione del polinomio interpolante nei punti in X

yy = zeros();

for j = 1:length(xx)
    yy(j) = 0;

    for k = 1:length(x)
        lk = 1;
        for i = [1:k-1, k+1:length(x)]
            lk = lk * ((xx(j) - x(i)) / (x(k) - x(i)));
        end
        yy(j) = yy(j) + lk * y(k);
    end

end


