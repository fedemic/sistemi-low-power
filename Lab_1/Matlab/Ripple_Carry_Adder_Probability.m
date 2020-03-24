%% Autore Tiziano

close all;
clear all;
clc;

% Vettori da intendere da LSB a MSB
P_S = [0 0 0 0 0 0 0 0];
A_S = [0 0 0 0 0 0 0 0];

P_A = 0.5*ones(8,1);
P_B = 0.5*ones(8,1);
P_Cin = [0 0 0 0 0 0 0 0 0]; % Ha 9 elementi per poter inserire l'ultimo Cout

for i = 1:8
    % Calcolo P_S e ESW
    P_S(i) = P_A(i)*(1-P_B(i))*(1-P_Cin(i)) + P_B(i)*(1-P_A(i))*(1-P_Cin(i)) + P_Cin(i)*(1-P_A(i))*(1-P_B(i)) + P_A(i)*P_B(i)*P_Cin(i);
    A_S(i) = 2*P_S(i)*(1-P_S(i));
    
    % Calcol carry in dello stadio successivo
    P_Cout = P_A(i)*P_B(i)*(1-P_Cin(i)) + P_A(i)*P_Cin(i)*(1-P_B(i)) + P_B(i)*P_Cin(i)*(1-P_A(i)) + P_A(i)*P_B(i)*P_Cin(i);
    P_Cin(i+1) = P_Cout;    
    
end

% Risultati
P_S
A_S

