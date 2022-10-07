pkg load image
#A=zeros(5)
#B=[1 2 3 4; 5 6 7 8]
#imshow(B)
at = imread('test1.bmp');
at(1,2)=200;
imshow(at);

#pkg load image;
#filename = uigetfile();
#img = imread(filename);
#[x,y,z]=size(img);
#if  z==0
#  continue
 #else
  %qimg=rgb2gray(img);
#endif