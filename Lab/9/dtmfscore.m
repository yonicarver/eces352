function sc = dtmfscore(xx, hh)
	xx = xx * (2/max(abs(xx)));
	yy = conv(xx, hh);
	if (max(abs(yy))) >= 0.71
		sc = 1;
	else
		sc = 0;
	end
	
% 	ww = 200:500;
% 	figure
% 	plot(ww, yy(200:500));
end