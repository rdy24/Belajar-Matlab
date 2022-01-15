I = imread('cameraman.tif');
C = imcrop(I,[50 50 150 150]);
figure,imshow(C) 
figure,imshow(I)