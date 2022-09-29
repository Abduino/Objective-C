pkg load image;
filename=uigetfile();
img= imread(filename);
imshow(img);
img=rgb2gray(img);
A=zeros(3,3);
A(1,1)=255;
#img='phpw0ywwv.png';
#img=rgb2gray(img);
#imshow(img);

img_2=img;
img_2(img<=125) = 0;
img_2(img>125) = 255;

img_3=img;
img_3(img<=125) = 140;
img_3(img>125) = 150;

img_4=img;
img_4(img<=125) = 200;
img_4(img>125) = 210;

figure;
subplot(3,2,1);imshow(A);title("original image");
subplot(3,2,2);imshow(img);title("original image");
subplot(3,2,3);imshow(img_2);title("darker image");
subplot(3,2,4);imshow(img_3);title("low contrast image");
subplot(3,2,5);imshow(img_4);title("lighter image");

#imshow(gimg);