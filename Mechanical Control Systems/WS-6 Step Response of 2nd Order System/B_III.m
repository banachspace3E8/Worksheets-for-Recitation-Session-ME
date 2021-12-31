%ME 4473
%Recitation-6
% Problem-B

clc;clear;
K = 3.02;
num = [K];
den = [1 2 K];
sys = tf(num,den);
t = 0:.01:7;
y = step(sys,t);
plot(t,y)
yss = dcgain(sys);
Mp = (max(y) - yss)*100;
% Max overshoot
msg_overshoot = sprintf('Max overshoot = %3.2f%%',Mp);
%Peak Time
maxy =find(y ==(max(y))); 
idx = max(maxy);
tp = t(idx);
msg_peaktime = sprintf('Peak time = %3.2f', tp);
xlabel('Time(sec)');
ylabel('y(t)');
msg_title = sprintf('Step Response with K = %3.2f', K);
title(msg_title);
text(1.1, 0.3, msg_overshoot);text(1.1, 0.1, msg_peaktime);
grid on;