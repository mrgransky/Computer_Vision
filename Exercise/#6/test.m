clc;
close all;
clear all;

x = -2*pi:.01:2*pi;
y = x.^2.*sin(x);

[yMin, indxMin] = min(y)

locMin = find(y == yMin)

plot(x,y)
hold on;
plot(x(indxMin),yMin,'rs');
