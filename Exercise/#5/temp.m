clc
clear all;
close all;

I = imread('lena_bw.png');

cropTemp = imcrop(I,[250.5 208.5 127 84]);
imshow(cropTemp)