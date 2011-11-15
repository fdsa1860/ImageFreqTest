clc;clear;close all;
im1=imread('marilyn.jpg','jpg');
im2=imread('einstein.jpg','jpg');

im1=rgb2gray(im1(:,4:198,:));
im2=rgb2gray(im2(4:254,:,:));
% imshow(im2);

X=fft2(im1);
X=fftshift(X);
Xabs=abs(X);

Y=fft2(im2);
Y=fftshift(Y);
Yabs=abs(Y);

FL=zeros(size(im1));
[r c]=size(FL);
s=35;
FL(round(r/2)-s:round(r/2)+s,round(r/2)-s:round(r/2)+s)=1;
FH=1-FL;

XY=X.*FL+Y.*FH;
XY=ifftshift(XY);
im3=ifft2(XY);
imshow(abs(im3),[]);
figure;
imshow(real(im3),[]);


% Xabsn=Xabs/max(max(Xabs));
% imshow(Xabsn);