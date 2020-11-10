%{
Jhonatas Silva Bastos 
ECES 352 - lab7 - FIR Filtering of Images
%}

%% Lab: FIR Filters  
clc; clear; close all 

%% 3.1 Deconvolution Experiment for 1-D Filters 

% Use the Matlab function conv()

xx = 256*(rem(0:100,30)>10);% x[n]
figure

% subplot(2,1,1)
% hold on
% title('')
% stem(xx)% show my signal
% grid on 
% title('x[n]')
% xlim([0 90])
% xlabel('time Index [n}')
bb = [ 1, -0.92 ]; % _________------------------------------------------------ h11[n] - Impulse reponse 

%figure(2)
%stem(h)% How do I plot h[n]

%w = xx - 0.92*xx
% subplot(2,1,2)
ww = conv(xx,bb); % convolving the both signals 
% stem(ww)
% title('w[n]')
% grid on
% xlim([0 90])
% xlabel('time Index [n]')
% hold off
%{ 
Explain why the output looks the way it doea 

%}

%% part b 

% length of x[n] = 101
% length of w[n] = 102 
% one extra element. Why? if h = 2 elements (n+2-1)


%% 3.1.1 Restoration Filter 

% a)
r = 0.92; 
M = 15;
l = 0:M;
cc = r.^l; %    ------------------------------------------------------------ h22[n] 

% b)
figure

% subplot(2,1,1)
% stem(ww)
% title('w[n]')
% xlim([0 90])
% grid on 
% xlabel('time Index [n]')

% subplot(2,1,2)
yy = conv(cc , ww); % h11[n] with w[n]
% stem(yy)
% title('y[n]')
% xlim([0 90])
% grid on 
% xlabel('time Index [n]')

% c)

% figure

% subplot(2,1,1)
% stem(xx)
% title('x[n]')
% xlim([0 90])
% grid on 
% xlabel('time Index [n]')
% 
% subplot(2,1,2)
% stem(yy)
% title('y[n]')
% xlim([0 90])
% grid on 
% xlabel('Time Index [n]')

%% 3.1.2 Worse-Case Error

% figure
%error = yy(1:101) - xx;
er = immse(yy(1:101) ,xx)
%stem(error)
% stem(er)
% xlabel('Time Index [n]')
% title('Maximum Error')

%% 3.1.3  Achor Filter

% a) defining echo 
fs = 8000; % Hz
% @ 0.2 seconds
td = 0.2*fs; % td is equal to 1600 becuse my sample has 8000 parts 
r1 = 0.9 % the magnitude of the signal - 90% 

% b) r is equal to 0.9 due to the 90% efficiency and the lenght of h22 is
% equal to 1600. 

% c)
load lab6dat
h222 = [1 zeros(1,1600-2) .9];
fs=8000;
%h3=zeros(1,2000);
%gg=.8.^(0:9);
%h3(1:200:2000)=gg; 
xx2=conv(x2,h222);
% soundsc(xx2,fs)

%% 3.2 Cascading Two Systems

%% 3.2.1 Overall Impulse Response
% this seciton contains a through c .

% I have w[n] and y[n]
% The Impulse response of the overall system cascaded  

% (b) h[n]= h11[n]*h22[n]

% (c) the convolutin has to be equal to the pulse train ????  

y = conv( cc, ww); % ------------------------------------------ This how I found y[n]
hh = conv(bb, cc);

figure(5)
subplot(3,1,1)
stem(bb)
title('h11[n]')
xlim([0,15])

subplot(3,1,2)
stem(cc)
title('h22[n]')
xlim([0,15])

subplot(3,1,3)
stem(hh)
xlim([0,15])
title('Impulse Response')
ylabel('Impulse Response')
xlabel('Time')

%% 3.2.2 Distorting and Restoring Images 

% a)

load echart

% b)

figure()
imshow(echart)
bb = [1,-.92]
title('Original')

for m = 0:15 
    bb1(m+1) = 0.92^m;
end
[row,height] = size(echart);
ech92 = zeros(row,height);
for i = 1:row
    temp = conv(echart(i,:),bb);
    ech92(i,:) = temp(1:height);
end
for i = 1:height
     temp = conv(ech92(:,i),bb);
    ech92(:,i) = temp(1:row);
end

% c)
figure()
imshow(ech92);   % What is this image? What is the difference between the three images? 
title(' X ')
reconstructed = zeros(row,height);
for i = 1:row
    temp = conv(ech92(i,:),bb1);
    reconstructed(i,:) = temp(1:height);
end
for i = 1:height
     temp = conv(reconstructed(:,i),bb1);
    reconstructed(:,i) = temp(1:row);
end

figure()
imshow(reconstructed);
title('Restore Image');

%{

There is small delay in the picture during the first filter. Its called
ghost. It is very small and hard to notice with this picture. 
%}


%% 3.2.3 A Second Restoration Experiment 

%% a) 

for k = 0:10
    bb2(k+1) = 0.92^k;
end

[row,height] = size(echart);
ech92_10 = zeros(row,height);

for i = 1:row
    temp = conv(echart(i,:),bb);
    ech92_10(i,:) = temp(1:height);
end
for i = 1:height
     temp = conv(ech92_10(:,i),bb);
    ech92_10(:,i) = temp(1:row);
end

recon10 = zeros(row,height);
for i = 1:row
    temp = conv(ech92_10(i,:),bb2);
    recon10(i,:) = temp(1:height);
end
for i = 1:height
     temp = conv(recon10(:,i),bb2);
    recon10(:,i) = temp(1:row);
end

figure()
subplot(2,2,1)
imshow(recon10);   % What is this image? What is the difference between the three images? 
title(' M = 10  ')

% b)

for o = 0:15 
    bb3(o+1) = 0.92^o;
end
[row,height] = size(echart);
ech92_15 = zeros(row,height);
for i = 1:row
    temp = conv(echart(i,:),bb);
    ech92_15(i,:) = temp(1:height);
end
for i = 1:height
     temp = conv(ech92_15(:,i),bb);
    ech92_15(:,i) = temp(1:row);
end

recon15 = zeros(row,height);
for i = 1:row
    temp = conv(ech92_15(i,:),bb3);
    recon15(i,:) = temp(1:height);
end
for i = 1:height
     temp = conv(recon15(:,i),bb3);
    recon15(:,i) = temp(1:row);
end

subplot(2,2,2)
imshow(recon15);   % What is this image? What is the difference between the three images? 
title(' M = 15 ')

% c)

for e = 0:30
    bb4(e+1) = 0.92^e;
end
[row,height] = size(echart);
ech92_30 = zeros(row,height);
for i = 1:row
    temp = conv(echart(i,:),bb);
    ech92_30(i,:) = temp(1:height);
end
for i = 1:height
    temp = conv(ech92_30(:,i),bb);
    ech92_30(:,i) = temp(1:row);
end

recon30 = zeros(row,height);
for i = 1:row
    temp = conv(ech92_30(i,:),bb4);
    recon30(i,:) = temp(1:height);
end
for i = 1:height
     temp = conv(recon30(:,i),bb4);
    recon30(:,i) = temp(1:row);
end

subplot(2,2,3)
imshow(recon30);   % What is this image? What is the difference between the three images? 
title(' M = 30')

% Extreme case 

for me = 0:10000
    bb5(me+1) = 0.92^me;
end
[row,height] = size(echart);
ech92e = zeros(row,height);
for i = 1:row
    temp = conv(echart(i,:),bb);
    ech92e(i,:) = temp(1:height);
end
for i = 1:height
     temp = conv(ech92e(:,i),bb);
    ech92e(:,i) = temp(1:row);
end

recone = zeros(row,height);
for i = 1:row
    temp = conv(ech92e(i,:),bb5);
    recone(i,:) = temp(1:height);
end
for i = 1:height
     temp = conv(recone(:,i),bb5);
    recone(:,i) = temp(1:row);
end


subplot(2,2,4)
imshow(recone);   % What is this image? What is the difference between the three images? 
title(' M =1000')

%{
Explain what do you see?

 As I increased the value of M the the impulse response the became more
 and more ideal and the errrors was approaching zeros. Therefore, the higher the
value of M the better quality your reconstructed picture will have. 
 

%} 

%% Error Margins

WorstCaseError_10  = max(max(echart - recon10))

WorstCaseError_15 = max(max(echart - recon15))

WorstCaseError_30 = max(max(echart - recon30))

WorstCaseError_1000 = max(max(echart - recone))

