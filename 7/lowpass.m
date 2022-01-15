clear; clc;     
I = imread('coins.png');      
I= imnoise (I,'salt & pepper',0.01);
k = ones(3)/9;            
[r c] = size(I);        
[m n] = size(k);      
Rep = padarray (I,[1 1]); 
Rep = double (Rep);
for x = 1 : r       
    for y = 1  : c 
        jum = 0;
        for i = 1 : m
            for j = 1 : n
                q = x - 1;
                w = y -1;
                jum = jum + (Rep(i + q, j + w) * k(i, j));
            end
        end
        B(x,y)=jum;
    end
end
figure, imshow(I);
figure, imshow(uint8(B));
