function corners = findcorners(img, N, t)

sigma = 1;
k = .04;
% [dx,dy] = meshgrid(-N:N,-N:N);
dx = [1 0 -1; 1 0 -1; 1 0 -1];
dy = dx';

order = 3; % filter order
Gaussian_size = ceil(6*sigma); % cutoff
kernel = fspecial('gaussian',Gaussian_size,sigma);

% imgR = img(:,:,1);

imgDoub = double(img);

% step 1:
Ix = conv2(imgDoub,dx,'same');
Iy = conv2(imgDoub,dy,'same');

% step 2: smooth image
Ix2 = conv2(double(Ix.^2),kernel,'same');
Iy2 = conv2(double(Iy.^2),kernel,'same');
Ixy = conv2(double(Ix.*Iy),kernel,'same');

% step 3: Harris;
harris = (Ix2.*Iy2 - Ixy.^2)./(Ix2+Iy2 + eps);

% harris = (Ix2.*Iy2 - Ixy.^2)-k*(Ix2+Iy2).^2;

% step 4: 2D statistics filtering of Harris
harrisFilt = ordfilt2(harris,order^2,ones(order));

figure;
subplot(121);
imshow(harris);
title('Harris');
subplot(122);
imshow(harrisFilt);
title('Harris Filtered');

harris_points = (harris == harrisFilt)&(harris > t);

% find rows and columns of nonzero values
[row, col] = find(harris_points);
corners = [col,row];
figure; 
imshow(img), hold on;
plot(col,row,'rx');

end