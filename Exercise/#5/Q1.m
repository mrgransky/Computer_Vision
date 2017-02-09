
%%
clc
clear all;
close all;

img = imread('blocks_bw.png');

%%
tHigh = 1.42;
tLow = .4*tHigh;
tSobel = 0.16;
tPrewitt = 0.1;

% Canny edge detector
% [cannyEdges, threshCanny] = edge(img,'canny');
cannyEdges = edge(img,'canny',tLow,tHigh);

% Sobel edge detector
% [sobelEdges, threshSobel] = edge(img,'sobel');
sobelEdges = edge(img,'sobel',tSobel);

% Prewitt edge detector
% [prewittEdges, threshPrewitt]= edge(img,'prewitt');
prewittEdges = edge(img,'prewitt',tPrewitt);

%Plots
% figure;
subplot(311);
imshow(cannyEdges);
title('Canny');

subplot(312);
imshow(sobelEdges);
title('Sobel');

subplot(313);
imshow(prewittEdges);
title('Prewitt');