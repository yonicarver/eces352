% Yonatan Carver

clear ; clc ; close all

%% 2 - Warm-up
% 2.1 MATLAB Array Indexing

% (a)
jkl = 0 : 6;            % creates a 1x7 matrix with numbers 0 through 6
jkl = 2 : 4 : 17;       % creates a 1x4 matrix with numbers 2, 6, 10, 14
jkl = 99 : -1 : 88;     % creates a 1x12 matrix with numbers 99 through 88
ttt = 2 : (1/9) : 4;    % creates a 1x19 matrix from 2 to 4 incremented by (1/9)
tpi = pi * [ 0:0.1:2 ]; % creates a 1x21 matrix from 0 to 2 incremented by 0.1 all multiplied by pi

% (b)
xx = [ zeros(1,3), linspace(0,1,5), ones(1,4) ];
xx(4:6);                % gets indexes 4 through 6 of array xx
size(xx);               % size of array xx (1 by 12)
length(xx);             % length of array xx (12)
xx(2:2:length(xx));     % returns indexes 2, 4, 6, 8, 10, 12 from array xx

% (c)
yy = xx;
yy(4:6) = pi*(1:3);

zz = xx;
zz(2:2:length(zz)) = pi^pi;
% zz = [ 0 36.4622 0 36.4622 0.2500 36.4622  0.7500 36.4622 1.0000 36.4622 1.0000 36.4622 ]

%%
% 2.2 MATLAB Script Files

% (a)



%% 3 - Laboratory: Manipulating Sinusoids with MATLAB

% (a)
xk = cos( pi*(0:11)/4 );    % compute cosines
% xk(1) is the first element of xk
% xk(0) is not defined

% (b)
yy = [ ];   %initialize the yy vector to be empty
for k=-5:5
    yy(k+6) = cos( k*pi/5 );
end
% It is necessary to write yy(k+6) because indices must start at 1 (the
% first index in this case will be 1, not -5 (if you use yy(k))

% (c)
x = [ -3 -1 0 1 3 ];
y = x.*x - 3*x;
plot( x,y )
z = x + y*sqrt(-1);
plot( z )       % complex values: plot imag vs. real





