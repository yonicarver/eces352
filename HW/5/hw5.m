
%% problem 2a

tt = linspace(-2,11,1000);

t1 = linspace(0,4,1000);
t2 = linspace(5,9,1000);

p1 = tt - t1.*0.1;

x1 = 32 * ones(1,length(t1));
x2 = 32 .* 0.5.^(t2-4);

grid on; hold on

plot(t1, x1.*p1)
plot(t2, x2.*p1)


%%

grid on; hold on
plot(-3:.1:0, zeros(length(-3:.1:0)), '*-')
plot(t1, 32*ones(length(t1)), '*-')
plot(4:.1:5, zeros(length(4:.1:5)), '*-')
plot(t2, (32.*0.5.^(t2-4)), '*-')
plot(9:.1:12, zeros(length(9:.1:12)), '*-')

%% problem 2b

tt = -0.5 : .1 : 0.5;

grid on; hold on
plot(-1.5:.1:-0.5, zeros(length(-1.5:.1:-0.5)), '*-')
plot(tt, ones(length(tt)), '*-')
plot(0.5:.1:1.5, zeros(length(0.5:.1:1.5)), '*-')

%% problem 1c

tt = -0.1 : .00001 : 0.1;

grid on; hold on
plot(tt, 1-10.*abs(tt))



%% problem 3a

fs = 1000;

tt = 0:1/fs:.1;
xx = 7*cos(1800*pi*tt + (pi/4));

plot(tt, xx)
grid on




%% problem 3b
t2 = 0 : 1/1000 : 5;
x2 = cos(2000 .* pi .* t2 - 400 .* pi .* t2.^2);
figure
plot(t2,x2)
figure
specgram(x2,128)


%% problem 4a

t1 = 0 : 1/2000 : .1;
x1 = 3 * cos(2*pi*50*t1 - pi/2) + 2*cos(2*pi*300*t1);

t2 = 0 : 1/200000 : .1;
x2 = 3 * cos(2*pi*50*t2 - pi/2) + 2*cos(2*pi*300*t2);

hold on
% plot(t1, x1)
plot(t2, x2)
grid on

% specgram(x2, 200)

yt = 3*cos(2*pi*50*t2 - pi/2) + 2;
plot(t2, yt)




