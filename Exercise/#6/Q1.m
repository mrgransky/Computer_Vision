clc
close all;
clear all;
% 
% % image 3
% img = imread('gantrycrane.png');
% imgGray = rgb2gray(img);

% image 2
img = imread('lena_bw.png');
imgGray = img;

% image 1
% img = zeros(80,80);
% img(30:60,30:60) = 1;
% img = img + .8*rand(80,80);
% imgGray = img;
% imgGrayDouble = double(imgGray);

sigma = 3;
octave = 5;
thresh = 10;


%% Normal Image

imgGrayDouble = double(imgGray);
[x1,y1,r1] = DoG(octave,sigma,thresh,imgGrayDouble);
% figure, imshow(imgGray,[]),hold on, scatter(y1,x1,r1,'r');

%% Subsampled Image

n = 5;
subSampImg = imgGray(1:n:end,1:n:end);

subSampDouble = double(subSampImg);
[x1,y1,r1] = DoG(octave,sigma,thresh,subSampDouble);
figure, imshow(subSampImg,[]),hold on, scatter(y1,x1,r1,'r');

%% Rotated Image
imgRot = imrotate(imgGray,45);
% 
% figure;
% subplot(121);
% imshow(imgGray);
% title('original');
% 
% 
% subplot(122);
% imshow(imgRot);
% title('Rotated Image');


imgRotDouble = double(imgRot);
[x1,y1,r1] = DoG(octave,sigma,thresh,imgRotDouble);
figure, imshow(imgRot,[]),hold on, scatter(y1,x1,r1,'r');


