%% Autore Tiziano

close all;
clear all;
clc;


P_A = 0.4;
P_B = 0.6;
P_Cin = 0.5;


% Calcolo P_S e ESW
P_S = P_A*(1-P_B)*(1-P_Cin) + P_B*(1-P_A)*(1-P_Cin) + P_Cin*(1-P_A)*(1-P_B) + P_A*P_B*P_Cin;
A_S = 2*P_S*(1-P_S);
    
% Calcol carry in dello stadio successivo
P_Cout = P_A*P_B*(1-P_Cin) + P_A*P_Cin*(1-P_B) + P_B*P_Cin*(1-P_A) + P_A*P_B*P_Cin;
A_Cout = 2*P_Cout*(1-P_Cout);


% Risultati
P_S
A_S

P_Cout
A_Cout