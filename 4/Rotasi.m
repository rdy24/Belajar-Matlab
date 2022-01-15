I = imread('cameraman.tif'); 
theta = 45;
distorted = imrotate(I,theta); 
figure, imshow(I);
figure, imshow(distorted);