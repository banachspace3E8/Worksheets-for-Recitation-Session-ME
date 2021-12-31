%ME 4473
%Recitation-6
% Problem-C

clc;clear;
K1 = [0.4 0.5 1.0 2.0 6.5E-2];
t = 0:0.01:150;
% creates a new plot at each iteration
for i = 1:1:length(K1)
    K = K1(i);
    titleText = sprintf('K = %1.4f', K);
    wn = sqrt(0.2*K);
    num = wn^2;
    den = [1 0.104 wn^2];
    zeta = 0.104/(2*wn);
    %tf of Shaft angle with respect to theta_r
    sys = tf(num,den);
    %step response
    y = step(sys,t);
    %Finding max overshoot
    if zeta<1
        Mp = (max(y)-1)*100;
        overshootText = sprintf('Max overshoot = %3.2f%', Mp);
    else
        overshootText = sprintf('No overshoot');
    end
    % Finding rise time
    idx_01 = max(find(y<0.1));
    idx_09 = min(find(y>0.9));
    t_r = t(idx_09)-t(idx_01);
    risetimeText = sprintf('Rise Time = %3.2f sec', t_r);
    %Plotting
    subplot(3,2,i)
    plot(t,y)
    grid on;
    title(titleText)
    text(0.5, 0.3, overshootText);
    text(0.5,0.1,risetimeText);
end

%--------------------------------------------------
%Function to compute rise time
function tr = risetime(t,y)
%A. Emami 2006
%normalize y to 1
y = y/(length(y));
idx1 = min(find(y >= 0.1))
idx2 = min(find(y >= 0.9))
if isempty(idx1) & isempty(idx2)
    tr = t(idx2) - t(idx1);
else
    tr = 0
end
end
%----------------------------------------------------