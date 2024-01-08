
%% configuration
addpath(genpath('./code'));

% read Image
imdata=Img;

%% creat mask
ot  = otsu(Ivessel,3);
msk=normalize01(imgmsk);
ot=ot.*double(msk);
V=-1.*ones(584,565); % foreground
for i=1:size(ot,1)
    for j=1:size(ot,2)
        if (ot(i,j) == 0)
            V(i,j)= -1;
        end
    end
end
for i=1:size(Img,1)
    for j=1:size(Img,2)
        if (ot(i,j) == 2)
            V(i,j)= 0;
        end
    end
end
for i=1:size(Img,1)
    for j=1:size(Img,2)
        if (ot(i,j) == 3)
            V(i,j)= 1;
        end
    end
end
mask = V;

%% compute alpha matte
[alpha]=learningBasedMatting(imdata,mask);

%% show results
figure
subplot(1,2,1); imshow(imdata,[]),title('Orginal Image');
subplot(1,2,2),imshow(uint8(alpha*255),[]),title('Alpha matting');
