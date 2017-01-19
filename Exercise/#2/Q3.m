clc
clear all;
close all;


load('kuutio.mat');

cellE = struct2cell(edge);
initP = cell2mat(cellE(1));
endP = cell2mat(cellE(2));
cellV = struct2cell(vertex);
vrtx = [cell2mat(cellV(1));cell2mat(cellV(2));cell2mat(cellV(3))];



% World Coordinate frame
W = eye(4);

% Camera Coordinate frame

C = [   -.866 -.5   0   2;
        -.5   .866  0   -1;
        0       0  -1   3;
        0       0   0   1;
    ];


% Robot Coordinate frame 
theta = pi/6;
phi = pi/3;
psi = pi/4;

Rob_x = [1,0,0,-3;
      0,cos(theta),-sin(theta),2;
      0,sin(theta),cos(theta),0;
      0,0,0,1];

Rob_y = [cos(phi),0,sin(phi),-3;
      0,1,0,2;
      -sin(phi),0,cos(phi),0;
      0,0,0,1];

Rob_z = [cos(psi),-sin(psi),0,-3;
      sin(psi),cos(psi),0,2;
      0,0,1,0;
      0,0,0,1];  

CT_R = Rob_z * inv(C)
%% Draw Camera, Robot and World coordinate systems

figure;
drawtransf(W,'World');
hold on;
drawtransf(C,'Camera');
hold on;
drawtransf(Rob_z,'Robot');
hold on;
% the cube in robot coordinate frame
P_rob = drawCube(initP,endP,vrtx,Rob_z)
hold on;
P_CAM = drawCube(initP,endP,vrtx,CT_R)

disp('view from camera coordinate frame is : *--- DIAMOND ---*');
% view([0 90])
