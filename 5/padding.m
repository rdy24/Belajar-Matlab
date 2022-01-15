function B = padding(A, k)
[r, c] = size(A);
[m, n] = size(k);
m2 = floor (m/2);
n2 = floor (n/2);
 
A2=double(A);
for y = m2+1 : r-m2
    for x = n2+1 : c-n2
        jum = 0;
        for p = -m2 : m2
            for q = -n2 : n2
                jum = jum + k(p+m2+1,q+n2+1) * A2(y-p, x-q);
            end
        end
        B(y-m2, x-n2) = jum;
    end
end
end
