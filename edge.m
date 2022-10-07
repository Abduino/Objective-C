pkg load image;
filename = uigetfile();
img = imread(filename);
img=rgb2gray(img);
SE3= ones(7,7)/49;
SE = zeros(3,3);
SE(1,1)=1; SE(1,2)=2; SE(1,3)=1;
SE(3,1)=1;  SE(3,2)=2; SE(3,3)=1;

SE2 = zeros(3,3);
SE(1,1)=1; SE(2,2)=2; SE(3,3)=1;
SE(1,1)=-1;  SE(2,2)=-2; SE(3,3)=-1;


img1=imfilter(img,SE3)
img_filtered=imfilter(img,SE);
img_v=imfilter(img,SE2);
img_both=img_filtered + img_v;
figure;
subplot(2,2,1); imshow(img_filtered); title("h");
subplot(2,2,2); imshow(img_v); title("v");
subplot(2,2,3); imshow(img_both); title("comb");
subplot(2,2,4); imshow(img1); title("filtered comb");