%% 1.4 Get Test Images

load zone512
whos xx
% colormap(gray(256))
xx200 = xx(200,:);
plot(0:1:511, xx200)
grid on
xlim([0 512])


%% 2.1 Synthesize a Test Image

xpix = ones(256, 1) * cos(2*pi*(0:255)/16);
show_img(xpix); trusize

xpixx = cos(2*pi*(0:255)/16)'*cos(2*pi*(0:255)/16);
show_img(xpixx, 2); trusize

