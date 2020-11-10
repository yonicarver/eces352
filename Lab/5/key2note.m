function xx = key2note(X, keynum, dur)
% KEY2NOTE	Produce a sinusoidal waveform corresponding to a given piano
% key number

% usage:
% xx = the output sinusoudal waveform
% X = complex amplitude for the sinusoid, X = A*exp(j*phi)
% keynum = the piano keyboard number of the desired note
% dur = the duration (in seconds) of the output note

fs = 11025;
tt = 0 : (1/fs) : dur;
freq = (440) * 2^((keynum-49)/12);
xx = real( X * exp(j * 2 * pi * freq * tt));