close all;
clear all;
clc;

%% probabilità input
P_A = 0.5;
P_B = 0.5;
P_Cin = 0.5;

%% half adder

P_sum_half = P_A*(1- P_B) + P_B*(1- P_A)
A_sum_half = 2*P_sum_half*(1 - P_sum_half)

P_cout_half = P_A*P_B
A_cout_half = 2*P_cout_half*(1 - P_cout_half)

%% full adder

P_sum_full = P_A*(1-P_B)*(1-P_Cin) + P_B*(1-P_A)*(1-P_Cin) + P_Cin*(1-P_A)*(1-P_B) + P_A*P_B*P_Cin
A_sum_full = 2*P_sum_full*(1-P_sum_full)
    
P_cout_full = P_A*P_B*(1-P_Cin) + P_A*P_Cin*(1-P_B) + P_B*P_Cin*(1-P_A) + P_A*P_B*P_Cin
A_cout_full = 2*P_cout_full*(1-P_cout_full)