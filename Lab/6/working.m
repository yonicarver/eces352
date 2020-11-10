
clc
aa = [1 2 3 4 5 6;7 8 9 10 11 12;13 14 15 16 17 18; 19 20 21 22 23 24];

aa2 = aa(1:2:end, 1:2:end);

tbt = ones(2,2);

% x = zeros(size(xx));
a = {};
b = [];

for row = 1:size(aa2,1)
% 	disp(row)
		for col = 1:size(aa2,2)
% 			disp(col)
			a = [a double(aa2(row, col)) * tbt]
% 			x(row,:) = [x double(xx2(row, col)) * tbt];
		end
end

aaa = [ 1  1  3  3  5  5;
		1  1  3  3  5  5;
		13 13 15 15 17 17;
		13 13 15 15 17 17 ];

aaaa = [1 1 3 3 5 5 13 13 15 15 17 17;
		1 1 3 3 5 5 13 13 15 15 17 17];

row = 2;
grp = size(aaaa, 1) / row;

% for k = 1:grp
% 	idr = (1:row) + (k-1) * row;
% 	xxxx(idr,:)
% end

% C = num2cell(a, [1 3]);
% b = [b; C{1:6};C{7:12}]

% d = []; d = [d a(1:3)]
% e = []; e = [e a(4:end)]
