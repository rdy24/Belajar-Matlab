clear; clc;     
I = imread('cameraman.tif');        
k = [-1 -1 -1; -1 9 -1; -1 -1 -1];            
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
