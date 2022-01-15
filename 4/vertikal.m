I = imread('cameraman.tif'); 
[r c] = size(I);
for x = 1 : r
    for y = 1 : c
        J(x,y) = I(x, (c-y)+1);
    end
end
figure, imshow(I); 
figure, imshow(J);