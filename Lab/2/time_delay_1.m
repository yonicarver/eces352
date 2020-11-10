function t1 = time_delay_1(xv, dt)
% time_delay_1 Function to calculate time delay in terms of vehicle position
% & transmitter location
% usage:
% t1 = time_delay_1(xv, dt)
% 
% INPUTS:
% xv = vehicle position
% dt = y-cooridnate of transmitter location (x-coordinate is always 0)
% 
% OUTPUTS:
% t1 = delay time from transmitter to vehicle

c = 2.9e8;	% speed of light

distance = sqrt((xv^2) + (dt^2));
t1 = distance / c;
