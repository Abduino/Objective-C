pkg load image;
#filename=uigetfile();
#img= imread(filename);
#imshow(img);
#img=rgb2gray(img);
A= zeros(6,6);
C = [0 2 4 6; 8 10 12 14; 16 18 20 22];
var_x = [0:0.01:1];
var_y=[50,60,70,80];
disp(A);
A(2,2)=1;
A(2,5)=1;
A(4,2)=1;
A(4,5)=1;
A(5,2)=1;
A(5,3)=1;
A(5,4)=1;
A(5,5)=1;
#A(1,1)=255;
disp(A);
plot(var_x, var_y);
#colormap gray;
#image(A);
#colormap
#imshow(A);title("original image");