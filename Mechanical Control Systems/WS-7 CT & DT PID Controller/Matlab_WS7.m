% Written by: Shishir Khanal
% Recitation 7
% Code to evalaute parameters for the discrete PID control system
%------------------------------------------------

clc;clear;
num = [1 0]
den = [1 -3 6]
ctf = tf(num,den)
Ts = 0.01;
dtf = c2d(ctf, Ts)
% discrete_num = [0.009851 -0.009851];
% discrete_den = [1 -1.97 0.9704];
% Code below can be used to develop the pid control loop
%step(dtf)
% hold on
% output=step(ctf)
% PIDeq = pid(1,1,1)
% combined= series(PIDeq, ctf)
% whole = feedback(combined,1)
% step(whole)