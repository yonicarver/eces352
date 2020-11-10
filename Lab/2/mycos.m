function [values, times] = mycos(A, w, phase, dur)

tt = 0 : 1/1000000 : dur;
mycos = A * cos( w * tt + phase);
plot(tt, mycos); grid on
title(['x(t) = ', num2str(A), 'cos(', num2str(w), 't + ', num2str(phase), ')'])

times = tt;
values = mycos;
xlabel('time (seconds)')