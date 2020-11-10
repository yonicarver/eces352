

f0 = 1/4;
% tt = -5 : 1/10000 : 5;
tt = -3*f0 : 1/100 : 3*f0;
xx = exp(1j * -2 * tt);

plot(tt, xx)
grid on

% tt = -3*f0 : 1/100 : 3*f0;
%%


tt = -0.005 : 1/10000000 : 0.005;
x = ( 5 + 15 * cos(500 * pi .* tt + (pi/2)) ) .* cos(2000 * pi .* tt - (pi/4));

plot(tt, x)
grid on


%% 

tt = -0.005 : 1/4000 : 0.005;
% tt = linspace(-0.005, 0.005, 4000);
x = ( 5 + 15 * cos(400 * pi .* tt + (pi/2))) .* cos(2000 * pi .* tt - (pi/4));

plot(tt, x)
grid on
figure
spectrogram(x,2,1,1024,4000, 'yaxis')




%% 

tt = -0.005 : 1/10000 : 0.005;
x =  15 + 8 * cos(2*pi*2000 .* tt - pi) .* 4 .* cos(2*pi*7000 .* tt + (3 * pi/4));

plot(tt, x)
grid on
figure
spectrogram(x,2,1,1024,10000, 'yaxis')




