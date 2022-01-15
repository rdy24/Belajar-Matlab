A = not(imread('logika1.bmp')); 
B = not(imread('logika3.bmp')); 
[r1 c1] = size(A);
for x = 1 : r1
    for y = 1 : c1
        C(x,y) = xor(A(x,y),B(x,y));
    end
end
figure, imshow(C);
