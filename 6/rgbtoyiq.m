A =  imread('lena.jpg'); 
YIQ = rgb2ntsc(A); 
imwrite(YIQ,'lenaayiq.jpg') 
figure, imshow (A);
figure, imshow (YIQ);
