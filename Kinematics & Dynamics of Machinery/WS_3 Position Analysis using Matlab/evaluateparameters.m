%Shishir Khanal
%ME3320
%Recitation - 3
%Date: 9/12/2021
%Purpose: Evaluate the parameters for the closing door mechanism
%Problem-1
clc;clear;
%------------------------------------------------------------

q = 3;
h = 4;
a = 10;
d = 8;
alpha = deg2rad(30);
t1 = 5;
t2 = 13;
theta1 = evaluatetheta(h, q, t1, d)
theta2 = evaluatetheta(h, q, t2, d)


%----------------------------------------------------------
%Functions:
function [theta] = evaluatetheta(h, q, t, d)
%evaluatetheta() takes in the length parameters of the door closing mechanism
%and outputs the theta value in radians
%   Detailed explanation goes here
gamma = evaluategamma(h,q);
epsilon = evaluateepsilon(h, q, t, d);
theta = pi - gamma - epsilon;
end

function [gamma] = evaluategamma(h,q)
%evaluategamma() takes in the relevant length parements of the mechanism
%and computes the angle gamma in radians
%   Detailed explanation goes here
gamma = atan(h/q);
end

function [epsilon] = evaluateepsilon(h, q, t, d)
%evaluateepsilon() takes in the length parameters of the mechanism and
%outputs the angle epsilon in radians
%   Detailed explanation goes here
num = t^2 + h^2 + q^2 - d^2;
den = 2*t*sqrt(h^2 + q^2);
epsilon = acos(num/den);
end
%----------------------------------------------------------
