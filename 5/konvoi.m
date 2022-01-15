clear; clc;
I = imread('cameraman.tif'); 
k = ones(3)/9;
Hsl = padding(I, k); 
imshow(I);
figure, imshow(uint8(Hsl));
