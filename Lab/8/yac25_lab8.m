%{
Yonatan Carver
ECES 352 - Lab 8

%}
clear; clc; close all

% C:\Users\yonic\Documents\DREXEL UNIVERSITY\t9_w\eces_352\lab\8

%% 3.1 - Nulling Filters for Rejection

b0 = 1;
b1 = -2*cos(0.5*pi);
b2 = 1;
% w_hat_n = 0.5*pi;
w_hat_n = [];

% coefficients of y[n]
h1 = [1, -2*cos(0.22*pi), 1];
h2 = [1, -2*cos(0.85*pi), 1];
% h = [b0 -2*cos(0.22*pi) -2*cos(0.85*pi) b2];

% (a) & (b)
n = linspace(0, 149, 150);
xx = 20*cos(0.22.*pi.*n) + 25*cos(0.45.*pi.*n - pi/3) + 20*cos(0.85.*pi.*n - pi/4);

% (c) cascade system
yy1 = conv(xx, h1);
yy2 = conv(yy1, h2);

n_point = 4096;

figure('Name', 'Colvolve h1 & h2', 'units', 'normalized', 'outerposition', [0 0.04 1 0.96])
plot(linspace(-pi, pi, n_point), abs(fftshift(fft(conv(h1, h2), n_point))))
grid on
title('Colvolve h1 & h2')
xticks([-pi -pi/2 0 pi/2 pi])
xticklabels({'-\pi', '-\pi/2', '0', '\pi/2', '\pi'})

figure('Name', 'Input x[n]', 'units', 'normalized', 'outerposition', [0 0.04 1 0.96])
plot(linspace(-pi, pi, n_point), abs(fftshift(fft(xx, n_point))))
grid on
title('Input: x[n] = 20cos(0.22\pin) + 25cos(0.45\pin - \pi/3) + 20cos(0.85\pin - \pi/4)')
xticks([-pi -0.85*pi -pi/2 -0.45*pi -0.22*pi 0 0.22*pi 0.45*pi pi/2 0.85*pi pi])
xticklabels({'-\pi', '-0.85\pi', '-\pi/2     ', '     -0.45\pi', '-0.22\pi', '0', '0.22\pi', '0.45\pi     ', '     \pi/2', '0.85\pi', '\pi'})

figure('Name', 'Output y[n]', 'units', 'normalized', 'outerposition', [0 0.04 1 0.96])
plot(linspace(-pi, pi, n_point), abs(fftshift(fft(yy2, n_point))))
grid on
title({'Output: y[n] = x[n] - 2cos(\omega_n)x[n-1] + x[n-2]', 'Allows for 0.45\pi frequency to pass through'})
xticks([-pi -0.85*pi -pi/2 -0.45*pi -0.22*pi 0 0.22*pi 0.45*pi pi/2 0.85*pi pi])
xticklabels({'-\pi', '-0.85\pi', '-\pi/2     ', '     -0.45\pi', '-0.22\pi', '0', '0.22\pi', '0.45\pi     ', '     \pi/2', '0.85\pi', '\pi'})
annotation('textarrow',[0.420625 0.38375],...
	[0.798212005108557 0.892720306513411],'String',{'-0.45 * \pi'});
annotation('textarrow',[0.615625 0.650625],...
	[0.795934865900383 0.890166028097063],'String',{'0.45 * \pi'});


%% 3.2 Simple Bandpass Filter Design

% (a)
n_point = 2048;	% n-point FFT

% L = 12;		% passband width is controlled by L
wc = 0.45*pi;	% center frequency

step = 0.001;
hh12 = (2/12) * cos(wc .* (0:step:12) );		% L-point FIR filter, L = 12
hh24 = (2/24) * cos(wc .* (0:step:24) );		% L-point FIR filter, L = 24
hh48 = (2/48) * cos(wc .* (0:step:48) );		% L-point FIR filter, L = 48

out12 = conv(xx, hh12);		% xx = signal to be filtered
out24 = conv(xx, hh24);		% xx = signal to be filtered
out48 = conv(xx, hh48);		% xx = signal to be filtered

Hejw12 = abs(fft(out12, n_point));		% frequency response of output
Hejw24 = abs(fft(out24, n_point));		% frequency response of output
Hejw48 = abs(fft(out48, n_point));		% frequency response of output

figure('Name', 'xx conv hh', 'units', 'normalized', 'outerposition', [0 0.04 1 0.96])
hold on
plot(linspace(-pi, pi, length(out12)), abs((fft(out12))));
plot(linspace(-pi, pi, length(out24)), abs((fft(out24))));
plot(linspace(-pi, pi, length(out48)), abs((fft(out48))));
grid on
title('xx conv hh')


figure('Name', 'Bandpass Filter', 'units', 'normalized', 'outerposition', [0 0.04 1 0.96])
hold on
plot(linspace(-pi, pi, n_point), fftshift(Hejw12))
% plot(linspace(-pi, pi, n_point), fftshift(Hejw24))
% plot(linspace(-pi, pi, n_point), fftshift(Hejw48))
grid on
title({'Band Pass Filter', ['h[n] = ^2/_L cos(', num2str(wc), 'n)']})
% xlim([0 pi])
xlim([-pi pi])

% xticks([-pi -pi/2 0 pi/2 pi])
% xticklabels({'-\pi', '-\pi/2', '0', '\pi/2', '\pi'})
xticks([-pi -0.85*pi -pi/2 -0.45*pi -0.22*pi 0 0.22*pi 0.45*pi pi/2 0.85*pi pi])
xticklabels({'-\pi', '-0.85\pi', '-\pi/2     ', '     -0.45\pi', '-0.22\pi', '0', '0.22\pi', '0.45\pi     ', '     \pi/2', '0.85\pi', '\pi'})

legend('L = 12', 'L = 24', 'L = 48')

% [Hejw12_y Hejw12_x] = findpeaks(fftshift(Hejw12));
% Hejw12_y = sort(Hejw12_y);
% 
% annotation('textbox',...
% 	[0.722875 0.4 0.14 0.09],...
% 	'String',{['\omega = 0.45\pi', newline,...
% 	'Gain at \omega = 0.22\pi = ', num2str(Hejw12_y(end-2)), newline,...
% 	'Gain at \omega = 0.45\pi = ', num2str(Hejw12_y(end-4)), newline,...
% 	'Gain at \omega = 0.85\pi = ', num2str(Hejw12_y(end-10))]},...
% 	'FitBoxToText','off');

%{
Gain at w = 0.22*pi: 389.12
Gain at w = 0.45*pi: 244.97
Gain at w = 0.85*pi: 129.71
%}

%% 3.2 (b)
H_max12 = max(out12);
H_max24 = max(out24);
H_max48 = max(out48);

% passband region
passband12 = out12(find(abs(out12) >= (1/sqrt(2)) * H_max12));
passband24 = out24(find(abs(out24) >= (1/sqrt(2)) * H_max24));
passband48 = out48(find(abs(out48) >= (1/sqrt(2)) * H_max48));
figure('Name', 'Passband', 'units', 'normalized', 'outerposition', [0 0.04 1 0.96])
grid on; hold on
plot( linspace(-pi, pi, length(passband12)), abs(fftshift(fft(passband12))), 'Linewidth', 2 )
plot( linspace(-pi, pi, length(passband24)), abs(fftshift(fft(passband24))), '--', 'Linewidth', 2 )
plot( linspace(-pi, pi, length(passband48)), abs(fftshift(fft(passband48))), '-.', 'Linewidth', 2 )
title('Passband')
xticks([-pi -pi/2 0 pi/2 pi])
xticklabels({'-\pi', '-\pi/2', '0', '\pi/2', '\pi'})
legend('L = 12', 'L = 24', 'L = 48')

% stopband = H(e^jw) < 10% of H_max
stopband12 = out12(find((out12) < (H_max12*0.10)));
stopband24 = out24(find((out12) < (H_max24*0.10)));
stopband48 = out48(find((out12) < (H_max48*0.10)));
figure('Name', 'Stopband', 'units', 'normalized', 'outerposition', [0 0.04 1 0.96])
grid on; hold on
plot( linspace(-pi, pi, length(stopband12)),abs(fftshift(fft(stopband12))) )
plot( linspace(-pi, pi, length(stopband24)),abs(fftshift(fft(stopband24))) )
plot( linspace(-pi, pi, length(stopband48)),abs(fftshift(fft(stopband48))) )
title('Stopband')
xticks([-pi -pi/2 0 pi/2 pi])
xticklabels({'-\pi', '-\pi/2', '0', '\pi/2', '\pi'})
legend('L = 12', 'L = 24', 'L = 48')




