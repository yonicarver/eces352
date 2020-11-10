
%% Problem 1
Fo = 12;
Z = -1 + 1i;
dt = 1/(50 * Fo);
tt = -0.05 : dt : 0.15;
xx = real( Z * exp( 2j * pi * Fo * tt) );
%
plot( tt, xx )
grid on
title( 'SECTION of a SINUSOID')
xlabel( 'TIME (sec)' )


%% Problem 2

tt = -5 : 1/10 : 20;
xxx = 2 * cos((-pi/5) * tt + pi);
xx = real(2 * (exp(-1j*(pi/5) * tt) * exp(1j * pi)));
plot(tt, xxx)
hold on
plot(tt, xx, 'o')
grid on

dx = (2/pi) * (2*pi*sin((pi*(tt-0.01))/5))/5;

figure
plot(tt, dx)
grid on
title('Plot of: (2/pi) * (2*\pi*sin((\pi*(tt-0.01))/5))/5;')

%% Problem 3

clear; clc; close all

tt = -0.1 : 1/10000 : 0.1;

xa = 2 * cos(27 * pi * tt - (2*pi)/3) - cos(27 * pi * tt + (3*pi)/4);
xxa = real( 2 * (exp(1j * 27 * pi * tt)*(exp(-1j * (2 * pi)/3))) - (exp(1j * 27 * pi * tt)*exp(1j * (3 * pi)/4)) );
xa1 = 2 * (exp(-1j * (2 * pi)/3));
xa2 = -1 * exp(1j * (3 * pi)/4);

hold on; zcoords; ucplot; grid on
zvect(xa1, 'r')
zvect(xa2, 'b')
zvect(xa1 + xa2, '--')
% legend('','','','xa_1', 'xa_2', 'sum(xa_1, xa_2)')
hold off

fprintf('xa1')
zprint(xa1)
fprintf('xa2')
zprint(xa2)
fprintf('xa1 + xa2')
zprint(xa1 + xa2)


%%

clear; clc; close all
tt = -0.1 : 1/10000 : 0.1;

xb = sqrt(3) * cos(18.776 * pi * tt + 15.5 * pi) + 3 * cos(18.776 * pi * tt - 12.5 * pi) + sqrt(3) * cos(18.776 * pi * tt + 18 * pi);
xxb = real( sqrt(3) * (exp(1j * 18.776 * pi * tt)*exp(1j * 15.5 * pi)) + 3 * (exp(1j * 18.776 * pi * tt) * exp(-1j * 12.5 * pi)) + sqrt(3) * (exp(1j * 18.776 * pi * tt) * exp(1j * 18 * pi)) );
xb1 = sqrt(3) * exp(1j * 15.5 * pi);
xb2 = 3 * exp(-1j * 12.5 * pi);
xb3 = sqrt(3) * exp(1j * 18 * pi);


hold on; zcoords; ucplot; grid on
zvect(xb1, 'r')
zvect(xb2, 'g')
zvect(xb3, 'b')
zvect(xb1 + xb2 + xb3, '--')
hold off

fprintf('xb1')
zprint(xb1)
fprintf('xb2')
zprint(xb2)
fprintf('xb3')
zprint(xb3)
fprintf('xb1 + xb2 + xb3')
zprint(xb1 + xb2 + xb3)

%%

clear; clc; close all
tt = -0.1 : 1/10000 : 0.1;

xc = cos(120 * pi * tt + (3*pi)/4) + cos(120 * pi * tt + (5*pi)/4) + (2 * sin(120 * pi * tt - pi/4)) + (2 * sin(120 * pi * tt + pi/4));
xxc = -real( ...
	( exp(1j * 120 * pi * tt) * exp(1j * 3*pi/4) ) + ...
	( exp(1j * 120 * pi * tt) * exp(1j * 5*pi/4 ) ) + ...
	( 2 * (-exp(1j * 120 * pi * tt) * exp( -1j * 3*pi/4 ) ) ) + ...
	( 2 * (exp(-1j * 120 * pi * tt) * exp( 1j * -pi/4 ) ) ) ...
	);

xc1 = exp(1j * 3*pi/4);
xc2 = exp(1j * 5*pi/4);
xc3 = 2 * exp( -1j * 3*pi/4 );
xc4 = 2 * exp( 1j * -pi/4 );

hold on; zcoords; ucplot; grid on
zvect(xc1, 'r')
zvect(xc2, 'g')
zvect(xc3, 'b')
zvect(xc4, 'm')
zvect(xc1 + xc2 + xc3 + xc4, '--')
hold off

fprintf('xc1')
zprint(xc1)
fprintf('xc2')
zprint(xc2)
fprintf('xc3')
zprint(xc3)
fprintf('xc4')
zprint(xc4)
fprintf('xc1 + xc2 + xc3 + xc4')
zprint(xc1 + xc2 + xc3 + xc4)

% grid on
% hold on
% plot(tt, xa)
% plot(tt, xxa, '--')
% plot(tt, xb)
% plot(tt, xxb, '--')
% plot(tt, xc)
% plot(tt, xxc, '--')

% legend xa xxa xb xxb xc xxc

%%

clear; clc; close all

tt = -0.1 : 1/10000 : 0.1;

% x = (2 * sin(120 * pi * tt + pi/4));
% xx = real(2 * (exp(-1j * 120 * pi * tt) * exp(1j * (pi/4))) );
xc = (cos(120 * pi * tt + (3*pi)/4)) + ...
	(cos(120 * pi * tt + (5*pi)/4)) + ...
	(2 * sin(120 * pi * tt - pi/4)) + ...
	(2 * sin(120 * pi * tt + pi/4));

xxc = -real( ...
	( exp(1j * 120 * pi * tt) * exp(1j * 3*pi/4) ) + ...
	( exp(1j * 120 * pi * tt) * exp(1j * 5*pi/4 ) ) + ...
	( 2 * (-exp(1j * 120 * pi * tt) * exp( -1j * 3*pi/4 ) ) ) + ...
	( 2 * (exp(-1j * 120 * pi * tt) * exp( 1j * -pi/4 ) ) ) ...
	);

plot(tt, xc)
grid on
hold on
plot(tt, xxc, 'o')

%% Problem 4

w = 0.1 * pi;
tt = -10 : 1/10 : 10;

x = (sqrt(3) * cos(w * tt + pi/3)) + sin(w * tt + pi/2);
% xx = exp(1j * w * tt) * (3 * exp(1j * pi/3)) + exp(-1j * pi/2);
xx = (sqrt(3) * exp(1j * w * tt) * exp(1j * pi/3)) + (exp(1j * w * tt) * exp(1j * pi/2));
xxx = (1 - 1j) * exp(1j * w * tt);

hold on
% plot(tt, x);
plot(tt, xxx);
grid on

%% Problem 5

clear; clc; close all

tt = -0.1 : 1/1000 : 0.1;

xx = 1 + cos(300 * pi * tt + pi/2) + 0.6 * cos(600 * pi * tt + pi/5);
% yy = 

plot(tt, xx)
grid on

%% problem 6

clear; clc; close all

tt = -2 : 1/100 : 4;
x = -2.5 + 7.5 * sin(pi * tt);

fft_x = abs(fft(x));

plot(tt, x)
grid on

figure
plot(fft_x)
grid on

[y_coords, x_coords] = findpeaks(fft_x)


