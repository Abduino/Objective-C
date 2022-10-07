pkg load image;
%img='images.png';
img = imread('images.png');
imgc = gray2ind(img,256);
S = conv2 (img, ones (5, 5) / 25, "same");
[Dx, Dy] = gradient (S);
#C = [0 2 4 6; 8 10 12 14; 16 18 20 22];
#C = [0 2 4 6; 8 10 12 14; 16 18 20 255];
%img
#colormap gray;
#image(C);
#imread('test1.bmp')
#imshow(B)
% Inverts image
#invert = 255 - img;
imshow(imgc);
#meanVal = mean(grayImage,"all");
#binaryImage = grayImage >= meanVal;
#A=(3,3);
#A(1,1)=255;
#imshow(A);