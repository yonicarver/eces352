function t2 = time_delay_2(xv, dt, dxr, dyr)
% time_delay_2 Function to calculate time delay in terms of vehicle position
% & transmitter location
% usage:
% t2 = time_delay_2(xv, dt)
% 
% INPUTS: 
% xv = vehicle position
% dt = y-cooridnate of transmitter location (x-coordinate is always 0)
% dxr = x-coordinate of reflector
% dyr = y-coordinate of reflector
% 
% OUTPUTS:
% t2 = delay time from transmitter to reflector to vehicle

c = 2.9e8;	% speed of light

distance_t_to_r = sqrt(((dt-dyr)^2) + (dxr^2));
distance_r_to_v = sqrt(((dxr)^2) + ((dxr-xv)^2));
t2 = (distance_t_to_r + distance_r_to_v) / c;
