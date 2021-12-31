% Shishir Khanal
% Recitation-4
% Code to evaluate the sensitivity of system with a gain element & a Notch
% Filter
% Legend:(From Case-2) 
% Plot-1: Open Loop Transfer Function bode Plot
% Plot-2: Closed Loop Sensitivity Plot
% Plot-3: Closed Loop Step Response Plot
%------------------------------------------------


%------------------------------------------------
clc;clear;
%Create a state variable 's'
s = zpk(0,[],1);
% Now using s, we can write transfer function in polynomial form
G = 0.38*(s^2 + 0.1*s + 0.55)/(s*(s+1)*(s^2 + 0.06*s +0.5));

%------------------------------------------------
%Case -1:
%Using feedback to input sensitivity transfer function
%feedback(A(s), B(s)) is for TF = A(s)/(1+A(s)B(s))
%For '1/(1+G(s))'
Sensitivity_Function1 = feedback(1,G);
bode(Sensitivity_Function1)
% -----------------------------------------------

%------------------------------------------------
%Case-2:
%This section plots the 3 graphs for Case-1 
h1 = subplot(3,1,1);
OLTF1 = G;
bode(OLTF1)
title('Open Loop Bode Plot')
hold all
h2 = subplot(3,1,2);
bode(Sensitivity_Function1)
title('Closed Loop Sensitivity')
hold all
h3 = subplot(3,1,3);
StepResponseTF1 = feedback(G,1);
step(StepResponseTF1)
title('Step Response')
hold all
%-----------
% Start Looking from here for Case-2
axes(h1)
k = 0.5;
OLTF2 = k*G;
bode(OLTF2)
axes(h2)
Sensitivity_Function2 = feedback(1, k*G); 
bode(Sensitivity_Function2)
axes(h3)
StepResponseTF2 = feedback(k*G,1);
step(StepResponseTF2)
%-----------------------------------------------

% -----------------------------------------------
%Case-3: 
% Notch Filter Transfer Function
N = (s^2 + 0.7^2)/(s^2 + 0.35*s + 0.49);
axes(h1)
OLTF3 = N*G;
bode(OLTF3)
axes(h2)
Sensitivity_Function3 = feedback(1, N*G);
bode(Sensitivity_Function3)
axes(h3)
StepResponseTF3 =feedback(N*G,1);
step(StepResponseTF3)