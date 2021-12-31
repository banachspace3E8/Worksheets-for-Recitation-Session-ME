% Shishir Khanal
% Recitation-4
% Code to evaluate the sensitivity of system with a gain element & a Notch
% Filter
% Legend:(From Case-2) 
% Plot-1: Open Loop Transfer Function bode Plot
% Plot-2: Closed Loop Sensitivity Plot
% Plot-3: Closed Loop Step Response Plot
% Instructions: 
% Case-1: Uncomment Lines 23-31
% Case-2: Uncomment Lines 33-66
% Case-3: Uncomment Lines 68-84
%------------------------------------------------


%------------------------------------------------
clc;clear;
%Create a state variable 's'
s = zpk(0,[],1);
% Now using s, we can write transfer function in polynomial form
G = 0.38*(s^2 + 0.1*s + 0.55)/(s*(s+1)*(s^2 + 0.06*s +0.5));

% %------------------------------------------------
% %Case -1:
% %Using feedback to input sensitivity transfer function
% %feedback(A(s), B(s)) is for TF = A(s)/(1+A(s)B(s))
% %For 'your sensitivity function,'
% %delete 1 and write down the code for your TF using feedback() 
% Sensitivity_Function1 = 1;
% bode(Sensitivity_Function1)
% % -----------------------------------------------

% %------------------------------------------------
% %Case-2:
% %This section plots the 3 graphs for Case-1 
% h1 = subplot(3,1,1);
% OLTF1 = G;
% bode(OLTF1)
% title('Open Loop Bode Plot')
% hold all
% h2 = subplot(3,1,2);
% bode(Sensitivity_Function1)
% title('Closed Loop Sensitivity')
% hold all
% h3 = subplot(3,1,3);
% StepResponseTF1 = feedback(G,1);
% step(StepResponseTF1)
% title('Step Response')
% hold all
% %-----------
% % Start from here for Case-2
% axes(h1)
% k = 0.5;
% % Delete 1 and write down your Loop Transfer Function
% OLTF2 = 1;
% bode(OLTF2)
% axes(h2)
% %Delete 1 and write down your Sensitivity Transfer Function
% Sensitivity_Function2 = 1; 
% bode(Sensitivity_Function2)
% axes(h3)
% %Delete 1 and write down your Transfer Function to evaluate step response
% %Which Transfer Function is used to evaluate Step Response?
% StepResponseTF2 = 1;
% step(StepResponseTF2)
% %-----------------------------------------------

% % -----------------------------------------------
% %Case-3: 
% % Notch Filter Transfer Function
% N = (s^2 + 0.7^2)/(s^2 + 0.35*s + 0.49);
% axes(h1)
% % Delete 1 and write down your Loop Transfer Function
% OLTF3 = 1;
% bode(OLTF3)
% axes(h2)
% %Delete 1 and write down your Sensitivity Transfer Function
% Sensitivity_Function3 = 1;
% bode(Sensitivity_Function3)
% axes(h3)
% %Delete 1 and write down your Transfer Function to evaluate step response
% StepResponseTF3 =1;
% step(StepResponseTF3)
% %---------------------------------------------------