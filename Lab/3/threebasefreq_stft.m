%{

Yonatan Carver
ECES 352 - Lab 3.3.1

%}

% Threebaseperiodicity_vs_position = threebasefreq_stft(DNA_SEQUENCE, WINDOW_LENGTH, NFFT)

function Threebaseperiodicity_vs_position = threebasefreq_stft(DNA_SEQUENCE, WINDOW_LENGTH, NFFT)
	
% 	sequence1 = DNA_SEQUENCE(1 : 81579);
	% sequence length = 81579

	% convert A, T, C, G to binary numbers
	coding_A = double(upper(DNA_SEQUENCE) == 'A');
	coding_T = double(upper(DNA_SEQUENCE) == 'T');
	coding_C = double(upper(DNA_SEQUENCE) == 'C');
	coding_G = double(upper(DNA_SEQUENCE) == 'G');

% 	coding_A = double(upper(sequence1) == 'A');
% 	coding_T = double(upper(sequence1) == 'T');
% 	coding_C = double(upper(sequence1) == 'C');
% 	coding_G = double(upper(sequence1) == 'G');

	sequence_FT = abs(fft(coding_A, NFFT)) + ...
		abs(fft(coding_T, NFFT)) + ...
		abs(fft(coding_C, NFFT)) + ...
		abs(fft(coding_G, NFFT));

	% 	msum = movsum(DNA_SEQUENCE, WINDOW_LENGTH);

	s = spectrogram(coding_A, WINDOW_LENGTH, WINDOW_LENGTH-1, NFFT, 'yaxis');
	fft_s = abs(fft(sum(real(s))));		% take FFT of spectrogram results
	fft_s = fft_s(50:length(fft_s) - 50);	% remove beginning and end spikes
% 	plot(fft_s)
		
	Threebaseperiodicity_vs_position = fft_s;
end







% STFT
% for i = 0:81706
% 	X = x * w * exp(-1j * (2 * pi * 
% end



% movsum(A, B)
% A = vector
% B = window length