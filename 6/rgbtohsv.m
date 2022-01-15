A = imread('lena.jpg'); 
HSV = rgb2hsv(A); 
imwrite(HSV,'lenaa22.jpg') 
figure, imshow (A); 
figure, imshow (HSV);