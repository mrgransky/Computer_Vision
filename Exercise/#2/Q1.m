clc
clear all;
close all;

% World Coordinate frame
W = eye(4);

theta = pi/6;
phi = pi/3;
psi = pi/4;

% RZ
UT_A = [sin(phi)  -cos(phi)   0   11;
        cos(phi)   sin(phi)   0  -1;
        0           0         1   8;
        0           0         0   1;
    ];
% RX
BT_A = [1,0,0,0;
        0,cos(theta),-sin(theta),10;
        0,sin(theta),cos(theta),-20;
        0,0,0,1];


CT_U = [.866,-.5,0,-3;
        .433,.75,-.5,-3;
        .25,.433,.866,8;
        0,0,0,1];
    
    
BT_C = BT_A * inv(CT_U)*inv(UT_A)

figure;
drawtransf(W,'World');
hold on;
drawtransf(UT_A,'UT_A');
hold on;
drawtransf(BT_A,'BT_A');
hold on;
drawtransf(CT_U,'CT_U');
hold on;
drawtransf(BT_C,'BT_C');