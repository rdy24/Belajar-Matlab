A =  imread('lena.jpg'); 
XYZ = rgb2xyz(A); 
imwrite(XYZ,'lenaaxyz.jpg') 
figure, imshow (A);
figure, imshow (XYZ);
