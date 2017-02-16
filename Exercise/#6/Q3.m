clc;
close all;
clear all;


coins1 = imread('coins-1.png');
coins2 = imread('coins-2.png');

%%

radCoin1 = [21 500];
radCoin2 = [10 190];

[C1, R1] = imfindcircles(coins1,radCoin1);
[C2, R2] = imfindcircles(coins2,radCoin2);

numCircle_1 = size(C1,1)
numCircle_2 = size(C2,1)

% figure;
subplot(121);
imshow(coins1);
% hold on;
% plot(C1(:,1),C1(:,2),'r*');
viscircles(C1, R1,'EdgeColor','b');
subplot(122);
imshow(coins2);
% hold on;
% plot(C2(:,1),C2(:,2),'b*');
viscircles(C2, R2,'EdgeColor','r');
