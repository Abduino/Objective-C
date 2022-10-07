pkg load image 
filename=uigetfile();
im=imread(filename);
%im=rgb2gray(im);
im_eq=histeq(im);
im_n=(255-im);
im_log=(0.1 * log (1+im));
im_square=(0.1 * im exp (0.3));
figure;
subplot(2,2,1);imshow(im);title("original image");
%subplot(2,2,2);imhist(im);title("histogram image");
subplot(2,2,2);imshow(im_n);title("negative image");
subplot(2,2,3);imshow(im_log);title("logarithm image");
subplot(2,2,4);imshow(im_square);title("square of  image");