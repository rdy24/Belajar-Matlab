A =  imread('lena.jpg'); 
LAB = rgb2lab(A); 
imwrite(LAB,'lenaalab.jpg') 
figure, imshow  (A); 
figure, imshow (LAB);