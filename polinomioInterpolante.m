function P = polinomioInterpolante(x, y, z)

n = length(x);
P = 0;

for k = 1:n
    xk = x(k);
    supp = 1;

    for i = 1:n
        if(i ~= k) 
            supp = supp * ((z - x(i)) / (xk - x(i)));
        end
    end

    P = supp * y(k);
end
