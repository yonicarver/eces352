function hh = dtmfdesign(fcent, L, fs)
% DTMFDESIGN
% hh = dtmfdesign(fcent, L, fs)
%	returns a matrix (L by length(fcent)) where each column contains the impulse
%	response of a BPF, one for each frequency in fcent
% fcent = vector of center frequencyes
% L = length of FIR bandpass filters
% fs = sampling frequency

% Each BPF must be scaled so that its frequency response has a maximum magnitude
% to one

% n = 1:L-1;
% hh = (2 ./ fcent) .* cos((2 .* pi .* fcent .* n) );
% ./ fs

n = 0 : pi/1000 : pi;
hh = zeros(L, length(fcent));
beta = zeros(1, length(fcent));

for i = 1:length(fcent)
	h = cos(2*pi*fcent(i) .* (0:L-1)/fs);	% bandpass equation
	HH = freqz(h, 1, n);		% freq response
	beta(i) = 1/max(abs(HH));	% get beta value
	hh_1 = h .* beta(i);		% freq response
	hh(:,i) = hh_1;				% set column to hh_1
end





