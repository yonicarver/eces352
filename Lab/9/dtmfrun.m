function keys = dtmfrun(xx, L, fs)

	center_freqs = [697, 770, 852, 941, 1209, 1336, 1477, 1633];
	dtmf.keys = ...
		['1', '2', '3', 'A';
		 '4', '5', '6', 'B';
		 '7', '8', '9', 'C';
		 '*', '0', '#', 'D'];

	hh = dtmfdesign(center_freqs, L, fs);
	[start_loc, stop_loc] = dtmfcut(xx, fs);	% beginning & end of sounds

	keys = [];
	sc = zeros(1,8);		% placeholder for score values
	for i = 1:length(start_loc)
		x_seg = xx(start_loc(i):stop_loc(i));	% segment of sound
		for j = 1:8
			sc(j) = dtmfscore(x_seg, hh(:,j));
		end
		num_freq = find(sc == 1);
		if length(num_freq) > 2
			keys = [keys, '-1'];
		else
			row_index = find(sc(1:4) == 1);		% if positive match
			col_index = find(sc(5:8) == 1);		% if positive match
			keys = [keys, dtmf.keys(row_index, col_index)];
		end
	end
end

