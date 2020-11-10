%{
Yonatan Carver
ECES 352 - Lab 6

%}
clear; clc; close all

%% 3.1 Down Sampling
%{

a) Visually, aliasing can look like a moire pattern. It might look like a
checkered pattern or spiral pattern, depending on the amount that the image
has been downsized.

b) For one, if the factor by which the image is being downsized by is 2
(i.e. the image is down-sampled by one half of the original image), there
are fewer high frequency components of the signal.

%}

load lighthouse		% as var: ww

plot(abs(fft(ww)))
p=2;
wp = ww(1:p:end, 1:p:end);
% show_img(wp)
figure
plot(abs(fft(wp)))


%% 3.2 Reconstruction of Images

load stinger	% as var: xx
size_xx = size(xx);
xx4 = xx(1:4:end, 1:4:end);
size_xx4 = size(xx4);

% figure; imshow(xx); trusize
% figure; imshow(xx4); trusize

%% (a)
xr1 = cos(2*pi*(0:7)/8);
L = length(xr1);
nn = ceil((0.999:1:5*L)/5);		% round up to the integer part
xr1hold = xr1(nn);

figure
plot(xr1); grid on
title('Plot of xr1')
figure
plot(xr1hold); grid on
title('Plot of xr1hold')

%{
The vector nn is of length 40 and contains 5 values each of numbers 1
through 8. That is, nn is being held at each value for 5 indices.

The interpolation factor is 5.

%}

%% (b)

% n = ceil((0.999:1:4*length(xx4))/4);

% xholdrows = zeros(410,544);
xholdrows = zeros(size(xx));

% for i = 1:size_xx(2)
% 	xholdrows(i,:) = xx4(i,:) .* ceil(1:1:size_xx(2)/4);
% end

% for i = 1:size_xx(1)
% 	xholdrows(:,i) = (1:1:4*size_xx(1))/4;
% end
% 	xholdrows = xx4(n);
% imshow(xholdrows)

%% (c)

%% (d)
n1 = 0:7;
xr1 = cos(2*pi*n1/8);
tti = 0 : 0.1 : 7;	 % locations between the n1 indices

%% (e)

%% (f)

%% (g)

%% (h)

show_img(xx); truesize








