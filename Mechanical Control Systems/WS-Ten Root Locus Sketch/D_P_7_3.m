%Shishir Khanal
%Matlab code to compute the parameters for problem#D.P.7.3
%---------------------------------------------------
clc;clear;
%a.
num1 = 1;
den1 = [1 3 2];
Gman = tf(num1,den1);
num2 = [1 6.5 12];
den2 = [0 1 0];
Gintermediate = tf(num2,den2);
G = series(Gman, Gintermediate)
figure(1)
rlocus(G)

%b.
[kp,poles] = rlocfind(G)

%c
k = 400;
sys = k*G;
system = feedback(sys,1)
figure(2)
step(system)