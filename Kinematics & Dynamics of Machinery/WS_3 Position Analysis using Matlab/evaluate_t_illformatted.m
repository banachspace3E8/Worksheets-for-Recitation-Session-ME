%Shishir Khanal
%ME3320
%Recitation - 3
%Date: 9/12/2021
%Purpose: Evaluate the parameters for the closing door mechanism
%Problem-2
clc;clear;close all;
%------------------------------------------------------------

q = 3;
h = 4;
a = 10;
d = 8;
alpha = deg2rad(30);
theta = 0:0.01:2*pi;
thetamin = 0.3597;
thetamax = 2.2143;

t = zeros(length(theta),1);
    for i= 1: length(theta)
        A = 1;
        B = 2*(q*cos(theta(i)) - h*sin(theta(i)));
        C = q^2 + h^2 - d^2;
        t(i) = (-B + sqrt(B^2 - 4 * C)) / 2;
    end
    
figure(1)
plot(theta, t)
xlabel('theta');
ylabel('t');
title('Plot of Joint length(t) for changing theta(0,2*pi)');
grid on
hold on
axis equal

plot(thetamin,t,'o')
hold on
plot(thetamax,t,'o')
hold off

beta = zeros(length(theta),1);
for i= 1: length(theta)
    num = -h + t(i)*sin(theta(i));
    den = q + t(i)*cos(theta(i));
    beta(i) = atan2(num, den);
end
figure(2)
plot(theta, beta)
xlabel('theta');
ylabel('beta');
title('Plot of Dependent angle(beta) with respect to theta');
axis equal
grid on

hold on
plot(thetamin,beta,'o')
hold on
plot(thetamax,beta,'o')
hold off

%----------------------------------------------------------

meaningfultheta = thetamin:0.01:thetamax;
meaningfulbeta = zeros(length(meaningfultheta),1);


for i= 1: length(meaningfultheta)
    num = -h + t(i)*sin(meaningfultheta(i));
    den = q + t(i)*cos(meaningfultheta(i));
    meaningfulbeta(i) = atan2(num, den);
end

Px = zeros(length(meaningfulbeta),1);
Py = zeros(length(meaningfulbeta),1);
for i= 1: length(meaningfulbeta)
    Px(i) = a*cos(alpha + meaningfulbeta(i));
    Py(i) = a*sin(alpha + meaningfulbeta(i));
end

figure(3)
plot(Px,Py)
xlabel('Px');
ylabel('Py');
title('Plot of the Position vector(P) with respect to allowable theta');
axis equal
grid on
hold on
plot(0,0,'*r')
%----------------------------------------------------------