close all;
%% read image
[filename , pathname] = uigetfile({('*.jpg;*.png;*.gif;*.tif;*.bmp')},'Select a pic');
I=imread([pathname filename]);
I = I(:,:,2);
% % I = imadjust(I);
I = adapthisteq(I); % CLHAE
I = double(I);
I = medfilt2(I, [3, 3]);
Img=I;
%% mask and manual
name = filename(1:3);
fnd = findstr(pathname,'test');
imgman=imread(strcat(name,'manual1.gif'));
imgmsk=imread(strcat(name,'test_mask.gif'));
manu=imgman;    mask=imgmsk;    Omask=mask;
maskbw=im2bw(imgmsk);

%% call hessian matrix
Ivessel=FrangiFilter2D(double(I));
Ivessel=Ivessel.*double(imgmsk);

%% Alpha matting
demo_matting;
computAUC(alpha, manu,  mask , Omask)

