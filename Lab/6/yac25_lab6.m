%{
Yonatan Carver
ECES 352 - Lab 6

%}
clear; clc; close all
%%
load stinger	% as var: xx
size_xx = size(xx);
downsample_factor = 4;
downsampled_image = xx(1:downsample_factor:end, 1:downsample_factor:end);	% downsample the image
size_ds_image = size(downsampled_image);	% size of downsampled image

figno = 1;	% counter for figure number - no two images can have the same figure number
show_img(xx, figno, 0); trusize
title('Original Image')
figno = figno + 1;

show_img(downsampled_image, figno, 0); trusize
title(['Downsampled Image (downsampled by: ', num2str(downsample_factor), ')'])
figno = figno + 1;

%%
dsf_ones = ones(downsample_factor, downsample_factor);	% [downsample_factor by downsample_factor] grid of ones
x = {};	% empty cell array to hold [downsample_factor by downsample_factor] matrices

for row = 1:size(downsampled_image,1)
		for col = 1:size(downsampled_image,2)
			x = [x double(downsampled_image(row, col)) * dsf_ones];
	end
end

% x contains a matrix of cells, each with size [downsample_factor x downsample_factor]

%%

% reconstructed matrix puts takes all cells from "x" and creates the
% correct size image

reconstructed = [];

for i = [1:length(downsampled_image):length(x)]
	reconstructed = [reconstructed ; cell2mat(x(i:(i+length(downsampled_image)-1)))];
end

show_img(reconstructed, figno, 0); trusize
title('Reconstructed image using zero hold')
figno = figno + 1;

%%

% interpolate over the rows
q = zeros(size_ds_image(1),size_ds_image(2)*downsample_factor);
for i = 1:1:size_ds_image(1)
	q(i,:) = interp1([1:1:size_ds_image(2)], double(downsampled_image(i,:)), linspace(1,size_ds_image(2),size_ds_image(2)*downsample_factor));
end

% interpolate over the columns
w = zeros(size_ds_image(1)*downsample_factor, size_ds_image(2)*downsample_factor);
for j = 1:1:size_ds_image(2)*downsample_factor
	w(:,j) = interp1([1:1:size_ds_image(1)], double(q(:,j)), linspace(1,size_ds_image(1),size_ds_image(1)*downsample_factor));
end

show_img(w, figno, 0); trusize
title('Interpolated Image - reconstructed from downsampled image')
