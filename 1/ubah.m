a = imread('fotoku.jpg');
b = rgb2gray(a);
c = im2bw(b);
figure, imshow(a)
figure, imshow(b)
figure, imshow(c)