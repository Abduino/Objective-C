filename=uigetfile();
img=imread(filename);
img=rgb2gray(img);
img_2=img;
img_2(img<=125) = 10;
img_2(img>125) = 35;

img_3=img;
img_3(img<=125) = 140;
img_3(img>125) = 150;

img_4=img;
img_4(img<=125) = 200;
img_4(img>125) = 210;

figure;
subplot(2,2,1);imshow(img);title("original image");
subplot(2,2,2);imshow(img_2);title("darker image");
subplot(2,2,3);imshow(img_3);title("low contrast image");
subplot(2,2,4);imshow(img_4);title("lighter image");
