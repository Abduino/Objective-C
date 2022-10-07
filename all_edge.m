pkg load image;


filename = uigetfile();
img = imread(filename);
[x,y,z]=size(img);
if  z==0
  continue
 else
  %qimg=rgb2gray(img);
endif

SE_horizontal_matrix = zeros(3,3);
SE_horizontal_matrix(1,1)=-1; SE_horizontal_matrix(1,2)=2; SE_horizontal_matrix(1,3)=-1;
SE_horizontal_matrix(2,1)=-1; SE_horizontal_matrix(2,2)=2; SE_horizontal_matrix(2,3)=-1;
SE_horizontal_matrix(3,1)=-1;  SE_horizontal_matrix(3,2)=2; SE_horizontal_matrix(3,3)=-1;

SE_vertical_matrix = zeros(3,3);
SE_vertical_matrix(1,1)=-1; SE_vertical_matrix(1,2)=-1; SE_vertical_matrix(1,3)=-1;
SE_vertical_matrix(2,1)=2; SE_vertical_matrix(2,2)=2; SE_vertical_matrix(2,3)=2;
SE_vertical_matrix(3,1)=-1;  SE_vertical_matrix(3,2)=-1; SE_vertical_matrix(3,3)=-1; 

SE_rdiagonal_matrix = zeros(3,3);
SE_rdiagonal_matrix(1,1)=2; SE_rdiagonal_matrix(1,2)=-1; SE_rdiagonal_matrix(1,3)=-1;
SE_rdiagonal_matrix(2,1)=-1; SE_rdiagonal_matrix(2,2)=2; SE_rdiagonal_matrix(2,3)=-1;
SE_rdiagonal_matrix(3,1)=-1;  SE_rdiagonal_matrix(3,2)=-1; SE_rdiagonal_matrix(3,3)=2;
%SE_horizontal_matrix_Inverse=SE_horizontal_matrix*-1;

SE_ldiagonal_matrix = zeros(3,3);
SE_ldiagonal_matrix(1,1)=-1; SE_ldiagonal_matrix(1,2)=-1; SE_ldiagonal_matrix(1,3)=2;
SE_ldiagonal_matrix(2,1)=-1; SE_ldiagonal_matrix(2,2)=2; SE_ldiagonal_matrix(2,3)=-1;
SE_ldiagonal_matrix(3,1)=2;  SE_ldiagonal_matrix(3,2)=-1; SE_ldiagonal_matrix(3,3)=-1;

im_horizontal=imfilter(img,SE_horizontal_matrix);
im_vertical=imfilter(img,SE_vertical_matrix);
im_rdiagonal=imfilter(img,SE_rdiagonal_matrix);
im_ldiagonal=imfilter(img,SE_ldiagonal_matrix);

im_total_combination=im_horizontal+im_vertical+im_rdiagonal+im_ldiagonal;

figure;
subplot(2,2,1); imshow(im_horizontal); title("Horizontal");
subplot(2,2,2); imshow(im_vertical); title("vertical");
subplot(2,2,3); imshow(im_rdiagonal); title("-45");
subplot(2,2,4); imshow(im_ldiagonal); title(" 45");

figure;
subplot(1,1,1); imshow(im_total_combination); title("Total");

%subplot(2,2,3); imshow(im_total_combination); title("Total combination");
%subplot(2,2,4); imshow(img1); title("filtered comb");


##im_right_diagonal_inverse=imfilter(img,SE_horizontal_matrix_Inverse);
##im_fv_inverse=imfilter(img,SE_horizontal_matrix_2);
##img_horiz=im_right_diagonal+im_right_diagonal_inverse;
##img_vertic=im_fv + im_fv_inverse;
##img_combination=img_horiz+img_vertic;