pkg load image 
filename=uigetfile();
im=imread(filename);
img=im;
[x,y,z]=size(im);
if z==3
  im=rgb2gray(im);
endif
img_thresh=graythresh(im);
img_thr=img_thresh*255;
img_Low_thresh=img_thr/2;
img_High_thresh=img_Low_thresh*3;

for i=1:rows(im)
  for j=1:columns(im)
    if im(i,j)>img_High_thresh
       im(i,j)=255;
    elseif im(i,j)>img_thr && im(i,j)< img_High_thresh;
       im(i,j)=127;
    elseif im(i,j)>img_Low_thresh && im(i,j)< img_thr;
       im(i,j)=70;  
    else 
       im(i,j)=0; 
    endif
  endfor
endfor
figure;
subplot(2,1,1);imshow(img);title('original');
subplot(2,1,2);imshow(im);title('threshized');