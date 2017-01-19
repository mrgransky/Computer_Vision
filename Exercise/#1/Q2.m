clc
clear all;
close all;

% World Coordinate frame
W = eye(4);

% Camera Coordinate frame
C = [   -.866 -.5   0   2;
        -.5   .866  0   -1;
        0       0  -1   3;
        0       0   0   1;
    ];

% Robot Coordinate frame (X-Y plane)
R = [-.3 -.1 -.4 .2;1.5 .2 -.5 -.1; 0 -2.27 .02 -.8; 0 0 0 1];

%% Test with function

figure;
drawtransf(W);
hold on;
drawtransf(C);
hold on;
drawtransf(R);


