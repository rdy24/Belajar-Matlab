A = imread('lenaayiq.jpg'); 
YIQ = ntsc2rgb(A);
figure, imshow (A); 
figure, imshow (YIQ);
