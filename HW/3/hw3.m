clear; clc; close all

%% Problem 1
% (a)

tt = -0.2 : 1/1000 : 0.2;
A = 2*sqrt(2);
B = 4*sqrt(2);
phi = pi/2;

x = 2 * sqrt(2) * cos(25 * pi * tt + (pi/3)) + A * cos(25 * pi * tt + phi);

y = B * cos(25 * pi * tt);

plot(tt, x)
grid on; hold on
plot(tt, y, '--')

%% Problem 2
% (a)
clear; clc; close all

tt = -0.005 : 1/100000 : 0.005;

v = cos(2 * pi * 1000 * tt);

subplot(2,1,1)
plot(tt, v)
title('v(t) = cos(2\pi (1000) t)')
grid on

fft_v = fftshift(abs(fft(v)));

subplot(2,1,2)
plot(fft_v)
title('FFT of v(t)')
grid on

%% (b)

carrier_freq = 750 * 10^3;	% 750kHz

A = 2;
x = ( v + A ) .* ( cos(2 * pi * carrier_freq) * tt );

fft_x = fftshift(abs(fft(x)));

figure
subplot(2,1,1)
plot(tt, x)
title(['x(t) = [v(t) + ', num2str(A), '] * cos(2\pi(', num2str(carrier_freq),') t)'])
grid on

subplot(2,1,2)
plot(fft_x)
title('FFT of x(t)')
grid on

% peaks @
% 1.1411		3.1734		3.1734		1.1411
% -0.0001100	-0.0000100	0.0000100	0.0001100

%% (c)

carrier_freq = 680 * 10^3;	% 680kHz

A = 2;
x = ( v + A ) .* ( cos(2 * pi * carrier_freq) * tt );

fft_x = fftshift(abs(fft(x)));

figure
subplot(2,1,1)
plot(tt, x)
title(['x(t) = [v(t) + ', num2str(A), '] * cos(2\pi(', num2str(carrier_freq),') t)'])
grid on

subplot(2,1,2)
plot(fft_x)
title('FFT of x(t)')
grid on

%% Problem 4
% (c)

clear; clc; close all

tt = -0.02 : 1/100000 : 0.05;

x = 8 * cos(100 * pi * tt) .* sin(200 * pi * tt);

plot(tt, x)
grid on
title('x(t) = 8[cos(100\pit)] * [sin(200\pit)]')
xlabel('time (seconds)')

figure
fft_x = fftshift(abs(fft(x)));
plot(fft_x)
grid on
title('FFT of x(t)')
xlabel('time (seconds)')

%% Problem 5
% (a)

clear; clc; close all

tt = -0.02 : 1/100000 : 0.02;

x = 2 * cos(300 * pi * tt) + 5 * sin(600 * pi * tt + (pi/4));
fft_x = (abs(fft(x)));

[yyy, xxx] = findpeaks(fft_x);

% peaks @
% 7, 10002
% 13, 4006
% 3990, 4006
% 3996, 10002
% period: 0.0067

subplot(2,1,1)
plot(tt, x)
grid on
title('x(t) = 2cos(300\pit) + 5sin(600\pit + \pi/4)')

subplot(2,1,2)
plot(fft_x)
grid on
xlabel('frequency (Hz)')

%%
% (c)

y = -x + 2 * cos(450 * pi * tt + (pi/3));
fft_y = (abs(fft(y)));

[yyy, xxx] = findpeaks(fft_y);

figure
subplot(2,1,1)
plot(tt, y)
grid on
title('y(t) = -x(t) + 2cos(450\pit + \pi/3)')

subplot(2,1,2)
plot(fft_y)
grid on
xlabel('frequency (Hz)')




