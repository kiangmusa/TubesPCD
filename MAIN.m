close all;
clear;
image=imread('34.jpg');
mask = [0,1,1;0,1,0;0,0,0];
figure
imshow(sobel(image));
figure
imshow(im2bw(image));
figure
imshow(Dilasi(image,mask,3));
figure
imshow(Erosi(image,mask,size(mask,1)));


% E=flipkirikanan(A);
% F=flipatasbawah(A);
% 
% Red = image(:,:,1);
% Green = image(:,:,2);
% Blue = image(:,:,3);
% grayImage = .299*double(Red) + ...
%             .587*double(Green) + ...
%              .114*double(Blue);
% g2 = rgb2gray(image);
%       % You probably want to convert it back to uint8 so you can display it.
% gray = uint8(grayImage);
% figure 
% imshow(gray);
% gray=im2double(gray);
% gx = [-1,0,1;-1,0,1;-1,0,1];
% gy = [-1,-1,-1;0,0,0;1,1,1];
% figure
% konv1 = conv2(gray,gx,'same');
% konv2 = conv2(gray,gy,'same');
% imshow(konv1+konv2);

%imshow(grayImage);

% %Get histValues for each channel
% [yRed, x] = imhist(Red);
% [yGreen, x] = imhist(Green);
% [yBlue, x] = imhist(Blue);
% %Plot them together in one plot
% plot(x, yRed, 'Red', x, yGreen, 'Green', x, yBlue, 'Blue')

% [G,res1] = perbesar2(A,3);
% 
% % [F,res2] = perkecil(A,2);
% figure
% imshow(A);
% figure
% imshow(G);
% figure 
% imshow(F);
%     


