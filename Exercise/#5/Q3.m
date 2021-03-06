clc
clear all;
close all;

I = imread('lena_bw.png');
iComp = imcomplement(I); 
% background        -> Black,
% forground (obj)   -> White


level = 0.4941;
pixels = 312;
binImg = im2bw(iComp,level);
% iFilled = imfill(binImg,'holes');
iFilled = bwareaopen(binImg,pixels);
[objLabel,objNum] = bwlabel(iFilled);
imgReg = regionprops(objLabel,'all');

cropTemp = imcrop(I,[315.5 250.5 34 32]);
subplot(621);
imshow(cropTemp);
title('template photo');
subplot(622);
histTemp = imhist(cropTemp);
plot(histTemp);
title('template hist');


leftEye = imcrop(I,[248.5 248.5 34 32]);
subplot(623);
imshow(leftEye);
title('left eye photo');
subplot(624)
histLeftEye = imhist(leftEye);
plot(histLeftEye);

lips = imcrop(I,[276.5 336.5 34 32]);
subplot(625);
imshow(lips);
title('lips photo');
subplot(626);
histLips = imhist(lips);
plot(histLips);

nose = imcrop(I,[287.5 297.5 34 32]);
subplot(627);
imshow(nose);
title('nose photo');
subplot(628);
histNose = imhist(nose);
plot(histNose);


crop4 = imcrop(I,[109.5 43.5 34 32]);
subplot(629);
imshow(crop4);
title('croped photo');
subplot(6,2,10);
histCrop4 = imhist(crop4);
plot(histCrop4);

hair = imcrop(I,[189.5 228.5 34 32]);
subplot(6,2,11);
imshow(hair);
title('hair photo');
subplot(6,2,12);
histHair = imhist(hair);
plot(histHair);
% comparison

eyeDiff = histLeftEye - histTemp;
noseDiff = histNose - histTemp;
lipDiff = histLips - histTemp;
crop4Diff = histCrop4 - histTemp;
hairDiff = histHair - histTemp;


diff1 = sqrt(sum((eyeDiff).^2))
diff2 = sqrt(sum((noseDiff).^2))
diff3 = sqrt(sum((lipDiff).^2))
diff4 = sqrt(sum((hairDiff).^2))


figure;
subplot(221);
imshow(I);
title('original');
hold on;

for j = 1:objNum
    [row,col] = find(objLabel == j);
   cent = [imgReg(j).Centroid];
   box = rectangle('Position',imgReg(j).BoundingBox);
   set(box,'EdgeColor',[.81 .05 0]);
   plot(cent(1),cent(2),'b*');
   hold on;
   
end

subplot(222);
imshow(binImg);
title('Binary Image');

subplot(223);
imshow(iFilled);
title('Cleaned Binary Image');

subplot(224);
imshow(objLabel);
title('Labeled Image');

