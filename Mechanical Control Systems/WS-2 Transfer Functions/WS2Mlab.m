%Worksheet 2 
% Matlab Code to evaluate the Closed Loop Transfer function
% ----------------------------------------------------------
% TF1 = 4
num1=[4];
den1=[1];
sys1 = tf(num1,den1);
% TF2 = 1/(s+1)
num2=[1]; 
den2=[1 1]; 
sys2 = tf(num2,den2); 
% TF3 = s/(s^2 + 2)
num3=[1 0]; 
den3=[1 0 2]; 
sys3 = tf(num3,den3);
% TF4 = 1/s^2
num4=[1]; 
den4=[1 0 0]; 
sys4 = tf(num4,den4);
% TF5 = (4s+2)/(s^2 + 2s + 1)
num5=[4 2]; 
den5=[1 2 1]; 
sys5 = tf(num5,den5); 
% TF6 = 50
num6=[50]; 
den6=[1]; 
sys6 = tf(num6,den6); 
% TF7 = (s^2 + 2)/(s^3 + 14)
num7=[1 0 2]; 
den7=[1 0 0 14]; 
sys7 = tf(num7,den7);
% +1 for positive feedback
% Negative feedback by default
sysa = feedback(sys4,sys6,+1); 
sysb = series(sys2,sys3); 
sysc = feedback(sysb,sys5); 
sysd = series(sysc,sysa); 
syse = feedback(sysd,sys7); 
sys = series(sys1,syse)