pkg load image;
filename = uigetfile();

im = im2double(imread(filename));
[x,y,z]=size(im);
#im=imresize(im);
img=imresize(im,[x,x]);
gu_f=fspecial('gaussian',x,10);
max(gu_f(:));
gu_f1 = mat2gray(gu_f);
img_f=fftshift(fft2(img));
img_guf=img_f.*gu_f1;
img_gufi=ifft2(img_guf);

figure;
subplot(2,2,1); imshow(img); title("original");
subplot(2,2,2); imshow(img_f); title("fourier");
subplot(2,2,3); imshow(gu_f1); title("gausian");
subplot(2,2,4); imshow(img_gufi); title("inverse");





##
##
##SE=ones(3,3)/9;
##im_filtered=imfilter(img,SE);
##
##SE_right_matrix
##
##
##SE_right_matrix = zeros(3,3);
##SE_right_matrix(1,1)=2; SE_right_matrix(1,2)=-1; SE_right_matrix(1,3)=-1;
##SE_right_matrix(2,1)=-1; SE_right_matrix(2,2)=2; SE_right_matrix(2,3)=-1;
##SE_right_matrix(3,1)=-1;  SE_right_matrix(3,2)=-1; SE_right_matrix(3,3)=2;
##%SE_right_matrix_Inverse=SE_right_matrix*-1;
##
##SE_left_matrix = zeros(3,3);
##SE_left_matrix(1,1)=-1; SE_left_matrix(1,2)=-1; SE_left_matrix(1,3)=2;
##SE_left_matrix(2,1)=-1; SE_left_matrix(2,2)=2; SE_left_matrix(2,3)=-1;
##SE_left_matrix(3,1)=2;  SE_left_matrix(3,2)=-1; SE_left_matrix(3,3)=-1;
##
##im_right_diagonal=imfilter(im_filtered,SE_right_matrix);
####im_right_diagonal_inverse=imfilter(im_filtered,SE_right_matrix_Inverse);
####im_right_diagonal_combination=im_right_diagonal+ im_right_diagonal_inverse;
##
##im_left_diagonal=imfilter(im_filtered,SE_left_matrix);
##
##im_total_combination=im_left_diagonal+im_right_diagonal;
##
##
##figure;
##subplot(2,1,1); imshow(im_left_diagonal); title("right diagonals");
##subplot(2,1,2); imshow(im_right_diagonal); title("left diagonals");
##%subplot(2,2,3); imshow(im_total_combination); title("Total combination");
##%subplot(2,2,4); imshow(img1); title("filtered comb");
##
##
####im_right_diagonal_inverse=imfilter(img,SE_right_matrix_Inverse);
####im_fv_inverse=imfilter(img,SE_right_matrix_2);
####img_horiz=im_right_diagonal+im_right_diagonal_inverse;
####img_vertic=im_fv + im_fv_inverse;
####img_combination=img_horiz+img_vertic;