
%% 2.2 D-to-A Conversion

fsamp = 11025;

t1 = 0 : 1/fsamp : 0.5;
x1 = 100 * cos(2*pi*800*t1 - (pi/3));
t2 = 0 : 1/fsamp : 0.8;
x2 = 80 * cos(2*pi*1200*t2 + (pi/4));

% function [xx, tt] = syn_sin(fk, Xk, fs, dur, tstart)
% [x, tt] = syn_sin([800, 1200], [100, 80], fsamp, 3, 0);

% plot(tt, x1)
% hold on
% grid on
% plot(tt, x2)

% soundsc(x1)
% soundsc(x2)

xx = [x1, zeros(1,1100), x2];
tt = (1/11025)*(1:length(xx));
plot(tt, xx)
xline(0.5+0.1, 'r');

%% 2.3 Structures in MATLAB
x.Amp = 7;
x.phase = -pi/2;
x.freq = 100;
x.fs = 11025;
x.timeInterval = 0 : (1/x.fs) : 0.05;
x.values = x.Amp * cos(2*pi*(x.freq) * (x.timeInterval) + x.phase);
x.name = 'My Signal';
% x		% echo contents of structure "x"
plot(x.timeInterval, x.values)
grid on
title(x.name)