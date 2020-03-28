close all;
clear all;
clc;

%% Vettori da intendere da LSB a MSB
P_A = 0.5*ones(8,1);
P_B = 0.5*ones(8,1);
P_Cin = [0 0 0 0 0 0 0 0 0]; % Ha 9 elementi per poter inserire l'ultimo Cout

P_S = [0 0 0 0 0 0 0 0];
A_S = [0 0 0 0 0 0 0 0];

A_Cout = [0 0 0 0 0 0 0 0];

%% calcolo probabilità e activity
for i = 1:8
    % Calcolo P_S e ESW
    P_S(i) = P_A(i)*(1-P_B(i))*(1-P_Cin(i)) + P_B(i)*(1-P_A(i))*(1-P_Cin(i)) + P_Cin(i)*(1-P_A(i))*(1-P_B(i)) + P_A(i)*P_B(i)*P_Cin(i);
    A_S(i) = 2*P_S(i)*(1-P_S(i));
    
    % Calcol carry in dello stadio successivo
    P_Cout = P_A(i)*P_B(i)*(1-P_Cin(i)) + P_A(i)*P_Cin(i)*(1-P_B(i)) + P_B(i)*P_Cin(i)*(1-P_A(i)) + P_A(i)*P_B(i)*P_Cin(i);
    P_Cin(i+1) = P_Cout;    
    A_Cout(i) = 2*P_Cout*(1-P_Cout);
    
end

%% dati simulati
clk_cycles = 200;

% RCA con delay sulle somme
A_S1_sim = [92 102 101 98 85 105 102 84]/clk_cycles;
A_CO1_sim = 123/clk_cycles;

% RCA con delay su somme e carry
A_S2_sim = [92 178 201 210 199 213 242 250]/clk_cycles;
A_CO2_sim = 123/clk_cycles;