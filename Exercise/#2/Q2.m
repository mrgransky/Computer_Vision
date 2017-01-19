close all;
clc;
clear all;

load('kuutio.mat');

cellE = struct2cell(edge);
initP = cell2mat(cellE(1));
endP = cell2mat(cellE(2));
cellV = struct2cell(vertex);
vrtx = [cell2mat(cellV(1));cell2mat(cellV(2));cell2mat(cellV(3))];

drawCube(initP,endP,vrtx);
view(3)