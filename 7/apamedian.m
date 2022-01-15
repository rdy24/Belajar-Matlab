clear; clc;     
I = imread('coins.png');      
I= imnoise (I,'salt & pepper',0.01);          
[r c] = size(I);           
Rep = padarray (I,[1 1]); 
Rep = double (Rep);
B = zeros (r,c);
for x = 1 : r       
    for y = 1  : c 
       for i = 1 : 3
            for j = 1 : 3
                q = x - 1;
                w = y -1;
                array((i - 1) * 3 + j) = Rep(i + q, j + w);
            end
        end
        B(x, y) = median(array(:));
    end
end
figure, imshow(I);
figure, imshow(uint8(B));
