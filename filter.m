pkg load image;
filename=uigetfile();
im=imread(filename);
[x,y,z]=size(im);

if z==0
  continue
else
  im=rgb2gray(im);
endif
SE=ones(3,3)/9;
im_filtered=imfilter(im,SE);
figure;
subplot(2,1,1);imshow(im);title("original image");
subplot(2,1,2);imshow(im_filtered);title("filtered image");