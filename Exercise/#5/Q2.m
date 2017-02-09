clc
clear all;
close all;


source = imread('blocks_bw.png');
findcorners(source,2,100);

