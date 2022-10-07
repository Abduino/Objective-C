
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

changing = 1;
[rows, columns] = size(im);
BW_Thinned = im;
BW_Del = ones(rows, columns);
while changing
    % BW_Del = ones(rows, columns);
    changing = 0;
    % Setp 1
    for i=2:rows-1
        for j = 2:columns-1
            P = [BW_Thinned(i,j) BW_Thinned(i-1,j) BW_Thinned(i-1,j+1) BW_Thinned(i,j+1) BW_Thinned(i+1,j+1) BW_Thinned(i+1,j) BW_Thinned(i+1,j-1) BW_Thinned(i,j-1) BW_Thinned(i-1,j-1) BW_Thinned(i-1,j)]; % P1, P2, P3, ... , P8, P9, P2
            if (BW_Thinned(i,j) == 1 &&  sum(P(2:end-1))<=6 && sum(P(2:end-1)) >=2 && P(2)*P(4)*P(6)==0 && P(4)*P(6)*P(8)==0)   % conditions
                % No. of 0,1 patterns (transitions from 0 to 1) in the ordered sequence
                A = 0;
                for k = 2:size(P,2)-1
                    if P(k) == 0 && P(k+1)==1
                        A = A+1;
                    end
                end
                if (A==1)
                    BW_Del(i,j)=0;
                    changing = 1;
                end
            end
        end
    end
    BW_Thinned = BW_Thinned.*BW_Del;  % the deletion must after all the pixels have been visited
    % Step 2 
    for i=2:rows-1
        for j = 2:columns-1
            P = [BW_Thinned(i,j) BW_Thinned(i-1,j) BW_Thinned(i-1,j+1) BW_Thinned(i,j+1) BW_Thinned(i+1,j+1) BW_Thinned(i+1,j) BW_Thinned(i+1,j-1) BW_Thinned(i,j-1) BW_Thinned(i-1,j-1) BW_Thinned(i-1,j)];
            if (BW_Thinned(i,j) == 1 && sum(P(2:end-1))<=6 && sum(P(2:end-1)) >=2 && P(2)*P(4)*P(8)==0 && P(2)*P(6)*P(8)==0)   % conditions
                A = 0;
                for k = 2:size(P,2)-1
                    if P(k) == 0 && P(k+1)==1
                        A = A+1;
                    end
                end
                if (A==1)
                    BW_Del(i,j)=0;
                    changing = 1;
                end
            end
        end
    end
    BW_Thinned = BW_Thinned.*BW_Del;
end%while

figure
subplot(1,2,1)
imshow(BW_Original)
subplot(1,2,2)
imshow(BW_Thinned)
