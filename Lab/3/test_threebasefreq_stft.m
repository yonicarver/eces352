clc

DNA_SEQUENCE = hbb.Sequence;
WINDOW_LENGTH = 100;
NFFT = 1024;

% DNA_SEQUENCE = hbb.Sequence;
% WINDOW_LENGTH = 1000;
% NFFT = 1024;

output = threebasefreq_stft(DNA_SEQUENCE, WINDOW_LENGTH, NFFT);


%%
clc

DNA_SEQUENCE = hbb.Sequence;
WINDOW_LENGTH = 15;
NFFT = 1024;

cds_indices = hbb.CDS.indices;

sequence1 = DNA_SEQUENCE(1 : 81579);
% 81579

% coding_A = double(upper(DNA_SEQUENCE) == 'A');
% coding_T = double(upper(DNA_SEQUENCE) == 'T');
% coding_C = double(upper(DNA_SEQUENCE) == 'C');
% coding_G = double(upper(DNA_SEQUENCE) == 'G');

coding_A = double(upper(sequence1) == 'A');
coding_T = double(upper(sequence1) == 'T');
coding_C = double(upper(sequence1) == 'C');
coding_G = double(upper(sequence1) == 'G');

sequence_FT = abs(fft(coding_A, NFFT)) + ...
	abs(fft(coding_T, NFFT)) + ...
	abs(fft(coding_C, NFFT)) + ...
	abs(fft(coding_G, NFFT));

% 	msum = movsum(DNA_SEQUENCE, WINDOW_LENGTH);
% Threebaseperiodicity_vs_position = sequence_FT;
% 
% figure
s = spectrogram(coding_A, WINDOW_LENGTH, WINDOW_LENGTH-1, NFFT, 'yaxis');
fft_s = abs(fft(sum(real(s))));
fft_s = fft_s(50:length(fft_s) - 50);
plot(fft_s)

% figure
% spectrogram(coding_T, WINDOW_LENGTH, WINDOW_LENGTH-1, NFFT);
% figure
% spectrogram(coding_C, WINDOW_LENGTH, WINDOW_LENGTH-1, NFFT);
% figure
% spectrogram(coding_G, WINDOW_LENGTH, WINDOW_LENGTH-1, NFFT);

%%

Xtwz = zeros(N,nframes); % pre-allocate STFT output array
M = length(w);           % M = window length, N = FFT length
zp = zeros(N-M,1);       % zero padding (to be inserted)
xoff = 0;                % current offset in input signal x
Mo2 = (M-1)/2;           % Assume M odd for simplicity here
for m=1:nframes
  xt = x(xoff+1:xoff+M); % extract frame of input data
  xtw = w .* xt;         % apply window to current frame
  xtwz = [xtw(Mo2+1:M); zp; xtw(1:Mo2)]; % windowed, zero padded
  Xtwz(:,m) = fft(xtwz); % STFT for frame m
  xoff = xoff + R;       % advance in-pointer by hop-size R
end















