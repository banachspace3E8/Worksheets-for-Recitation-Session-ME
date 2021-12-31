
clc;clear;
Mb=100; Ms=10; L=1; g=9.81; a=5; b=10;
%
K=6000; % Final design value of K
%
numg=[-1/Mb/L]; deng=[1 0 -(Mb+Ms)*g/Mb/L];
sysg = tf(numg,deng)
numc=-K*[1 a]; denc=[1 b];
sysc = tf(numc,denc)

% Part (a)

sys = feedback(sysg,sysc)
w=logspace(0,1,400);
%define the logspace x-axis for bode plot
%of 400 points between 10^0 & 10^1
figure(1)
bode(sys,w)
% generates the bode plot for user defined frequency axis
[mag,phase]=bode(sys,w);
%mag-magnitude values for each of the user defined frequencies
%phase-phase values for each of the user defined frequencies
[M,I]=max(mag)
%M= max magnitude of Bode Plot not in dB
%I index of max magnitude
MpDb=20*log10(M)-20*log10(mag(1)) % Mpw in decibels
wr=w(I) % Mpw and peak frequency

% Part (b)

% From Eqs. (8.36) and (8.37)
Mpw=10^(MpDb/20);zeta=sqrt((1-sqrt(1-(1/Mpw^2)))/2);
wn=wr/sqrt(1-2*zeta^2)
%How can we use these equations when our CLTF is a 3rd order?
ts=4/(zeta*wn)
po=100*exp(-zeta*pi/sqrt(1-zeta^2))

% Part (c)

t=0:0.1:10;
[y,x]=step(sys,t);
figure(2)
plot(t,y*180/pi)
xlabel('time [sec]')
ylabel('theta [deg]')
grid

