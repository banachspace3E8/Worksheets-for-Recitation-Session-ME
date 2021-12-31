%Shishir Khanal
%Matlab code to compute the parameters for problem#D.P.7.12
%---------------------------------------------------

clc;clear;
num = [1 3];
den = [1 15 70 120 64];
G = tf(num,den);
figure(1)
rlocus(G)
K =  10;
intermediate_sys = K*G;
system = feedback(intermediate_sys,1)

figure(2)
step(system)