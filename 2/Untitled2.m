I =imread('fotoku.jpg');
a = rgb2gray(I);
[r c]= size(a);
data = reshape (a,r*c,1);
angka = unique(data);
[r1 c1] = size (angka);
jumlah_angka = histc(data,angka);
total = r*c;
for x=1:r1
    H1(x,1)=jumlah_angka(x,1)/total;
end
figure, imshow(a);
figure, bar (H1);