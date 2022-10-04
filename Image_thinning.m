pkg load image
clc,clear
pkg load image 
filename=uigetfile();
Img_Original =imread(filename);
Otsu_Threshold = graythresh(Img_Original);
Img_Original = not(im2bw(Img_Original,Otsu_Threshold));

changing = 1;
[rows, columns] = size(Img_Original);
Img_Thinned = Img_Original;
Img_Dialat = ones(rows, columns);
while changing
    changing = 0;
    for i=2:rows-1
        for j = 2:columns-1
            P = [Img_Thinned(i,j) Img_Thinned(i-1,j) Img_Thinned(i-1,j+1) Img_Thinned(i,j+1) Img_Thinned(i+1,j+1) Img_Thinned(i+1,j) Img_Thinned(i+1,j-1) Img_Thinned(i,j-1) Img_Thinned(i-1,j-1) Img_Thinned(i-1,j)];
            if (Img_Thinned(i,j) == 1 &&  sum(P(2:end-1))<=6 && sum(P(2:end-1)) >=2 && P(2)*P(4)*P(6)==0 && P(4)*P(6)*P(8)==0) 
               
                A = 0;
                for k = 2:size(P,2)-1
                    if P(k) == 0 && P(k+1)==1
                        A = A+1;
                    end
                end
                if (A==1)
                    Img_Dialat(i,j)=0;
                    changing = 1;
                end
            end
        end
    end
    Img_Thinned = Img_Thinned.*Img_Dialat; 
    for i=2:rows-1
        for j = 2:columns-1
            P = [Img_Thinned(i,j) Img_Thinned(i-1,j) Img_Thinned(i-1,j+1) Img_Thinned(i,j+1) Img_Thinned(i+1,j+1) Img_Thinned(i+1,j) Img_Thinned(i+1,j-1) Img_Thinned(i,j-1) Img_Thinned(i-1,j-1) Img_Thinned(i-1,j)];
            if (Img_Thinned(i,j) == 1 && sum(P(2:end-1))<=6 && sum(P(2:end-1)) >=2 && P(2)*P(4)*P(8)==0 && P(2)*P(6)*P(8)==0)   % conditions
                A = 0;
                for k = 2:size(P,2)-1
                    if P(k) == 0 && P(k+1)==1
                        A = A+1;
                    end
                end
                if (A==1)
                    Img_Dialat(i,j)=0;
                    changing = 1;
                end
            end
        end
    end
    Img_Thinned = Img_Thinned.*Img_Dialat;
end

figure
subplot(2,1,1)
imshow(Img_Original);title('original')
subplot(2,1,2)
imshow(Img_Thinned)
subplot(2,1,1);imshow(Img_Original);title('Image original');
subplot(2,1,2);imshow(Img_Thinned);title('Image Thinned');