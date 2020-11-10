function xx = dtmfdial(keynames, fs)
% DTMFDIAL	create a signal vector of tones which will dial a DTMF (Touch Tone)
% telephone system.
% 
% usage: xx = dtmfdial(keynames, fs)
%	keynames = vector of characters containing valid key names
% 	fs = sampling frequency
% OUTPUT
% 	xx = signal vector that is the concatenation of DTMF tones

dtmf.keys = ...
	['1', '2', '3', 'A';
	 '4', '5', '6', 'B';
	 '7', '8', '9', 'C';
	 '*', '0', '#', 'D'];

dtmf.colTones = ones(4,1) * [1209, 1336, 1477, 1633];
dtmf.rowTones = [697; 770; 852; 941] * ones(1,4);

dtmf.Tones = dtmf.rowTones + dtmf.colTones;

% make placeholder that is length of keynames with padded zeros in between
length_sound = 2000;	% duration of each tone pair: 0.20 seconds (2000 zeros)
length_silence = 500;	% duration of silence: 0.05 seconds (500)
% xx = zeros(1, length(keynames)*length_sound + length(keynames)*length_silence);

xx=[];

for i = 1:length(keynames)
	kk = keynames(i);
	xx = [xx, zeros(1,length_silence)];
	[ii,jj] = find(kk == dtmf.keys);
	row_f = dtmf.rowTones(ii,jj);
	col_f = dtmf.colTones(ii,jj);
	xx = [xx, cos(2*pi*row_f*(0:length_sound)/fs) + cos(2*pi*col_f*(0:length_sound)/fs)];
end

% specgram(xx, 1024, 11025);

end
