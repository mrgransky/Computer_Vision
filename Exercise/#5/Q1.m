clc
clear all;
close all;

img = imread('blocks_bw.png');

%%

% Canny edge detector
[~, threshCanny] = edge(img,'canny');

% tCanny = 1.52*threshCanny;
% tHigh = tCanny(1);
% tLow = tCanny(2);
tHigh = .05;
tLow = .8*tHigh;
cannyEdges = edge(img,'canny',tLow,tHigh);

% Sobel edge detector
[~, threshSobel] = edge(img,'sobel');

tSobel = 0.1;
sobelEdges = edge(img,'sobel',tSobel);

% Prewitt edge detector
[~, threshPrewitt]= edge(img,'prewitt');

tPrewitt = 0.14;
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