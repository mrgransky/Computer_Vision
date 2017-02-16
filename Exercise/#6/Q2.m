clc
close all;
clear all;

I  = imread('lena_bw.png');
% %% gantrycrane image
% I  = imread('gantrycrane.png');
% imgGray = rgb2gray(I);
% edg = edge(imgGray,'canny');
% figure,imshow(edg);


%% Noisy Lena's image
imgNoisy = imnoise(I,'salt & pepper',.05);
imgGray = imgNoisy;
edg = edge(imgGray,'canny');


% Hough Transform
[H,theta,rho] = hough(edg); 
p = houghpeaks(H,10,'Threshold',ceil(0.5*max(H(:))));
% figure;
% imshow(H,[],'XData',theta,'YData',rho,...
%     'InitialMagnification','fit');
% xlabel('\theta'),ylabel('\rho');
% axis on, axis normal; hold on;
% x = theta(p(:,2)); y = rho(p(:,1));
% plot(x,y,'ys');

% Hough Line
l = houghlines(edg,theta,rho,p,...
'FillGap',5,'MinLength',7);
maxLength = 0;

figure;
subplot(121);
imshow(imgNoisy), hold on
for k = 1:size(l,2)
    
   xy = [l(k).point1;l(k).point2];
   
   % plot beginning and end of lines
   plot(xy(1,1),xy(1,2),'x','LineWidth',2,'Color','y');
   plot(xy(2,1),xy(2,2),'x','LineWidth',2,'Color','r');
   
   % plot lines
   plot(xy(:,1),xy(:,2),'LineWidth',2,'Color','g');
   
   % determine longest line
    lineLength = norm(l(k).point1 - l(k).point2);
    if (lineLength > maxLength)
        maxLength = lineLength;
        xyLong = xy;
    end   
end
plot(xyLong(:,1),xyLong(:,2),'LineWidth',2,'Color','c');


subplot(122);
imshow(edg);
title('edge');
%% Lena's image without Noise
imgGray = I;
edg = edge(imgGray,'canny');


% Hough Transform
[H,theta,rho] = hough(edg); 
p = houghpeaks(H,10,'Threshold',ceil(0.5*max(H(:))));
% figure;
% imshow(H,[],'XData',theta,'YData',rho,...
%     'InitialMagnification','fit');
% xlabel('\theta'),ylabel('\rho');
% axis on, axis normal; hold on;
% x = theta(p(:,2)); y = rho(p(:,1));
% plot(x,y,'ys');

% Hough Line
l = houghlines(edg,theta,rho,p,...
'FillGap',5,'MinLength',7);
maxLength = 0;

figure;
subplot(121);
imshow(I);
imshow(imgGray), hold on
for k = 1:size(l,2)
    
   xy = [l(k).point1;l(k).point2];
   
   % plot beginning and end of lines
   plot(xy(1,1),xy(1,2),'x','LineWidth',2,'Color','y');
   plot(xy(2,1),xy(2,2),'x','LineWidth',2,'Color','r');
   
   % plot lines
   plot(xy(:,1),xy(:,2),'LineWidth',2,'Color','g');
   
   % determine longest line
    lineLength = norm(l(k).point1 - l(k).point2);
    if (lineLength > maxLength)
        maxLength = lineLength;
        xyLong = xy;
    end   
end
plot(xyLong(:,1),xyLong(:,2),'LineWidth',2,'Color','c');



subplot(122);
imshow(edg);
title('edge');

% [indxH, indxW] = size(edg);
% distMax = round(sqrt(indxH^2 + indxW^2)); % max distance from the origin
% 
% theta = -90:1:89;
% rho = -distMax:1:distMax;
% 
% H = zeros(size(rho,2),size(theta,2));
% % scan through edge image
% for r = 1:indxW
%     for c = 1:indxH
% %         r,c
%         if edg(c,r)~= 0
% %             disp('NON zero');
%             for indxTheta = 1: size(theta,2)
%                 angleRad = theta(indxTheta)*pi/180;
%                 dist = r*cos(angleRad) + c*sin(angleRad);
%                 
%                 [d, indxRho] = min(abs(rho-dist));
%                 
%                 if d <= 1
% %                     disp('d <= 1');
%                     H(indxRho,indxTheta) = H(indxRho,indxTheta) + 1;
%                     
%                 else
% %                     disp('d > 1');
%                 end
%                 
%             end
%         else
% %             disp('zero on edge');
%         end
%     end
%     
% end

% [H,T,R] = hough(BW);
% P  = houghpeaks(H,2);
% imshow(H,[],'XData',T,'YData',R,'InitialMagnification','fit');
% xlabel('\theta'), ylabel('\rho');
% axis on, axis normal, hold on;
% plot(T(P(:,2)),R(P(:,1)),'s','color','white');