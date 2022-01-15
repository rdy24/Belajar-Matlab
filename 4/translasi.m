Tx = 20;
Ty = 50;
C = imread('cameraman.tif'); [r c] = size(C);
for x = 1 : r
    for y = 1 : c
        D(x+Tx, y+Ty) = C(x,y);
    end
end
figure, imshow(D);