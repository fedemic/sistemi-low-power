clear all;
close all;
clc

%% dati calcolati
P_inv = 0.5;
A_inv = [0.5 0.5 0.5 0.5 0.5];

P_and = 0.25;
A_and = [0.375 0.375 0.375 0.375 0.375];

P_or = 0.75;
A_or = [0.375 0.375 0.375 0.375 0.375];

P_xor = 0.5;
A_xor = [0.5 0.5 0.5 0.5 0.5];

%% dati simulati
clk_cycles = [10 100 1000 10000 100000];

tc_inv = [1 43 533 4916 49967];
tc_and = [0 40 418 3606 37384];
tc_or = [4 42 352 3784 37541];
tc_xor = [4 44 470 4876 49939]; 

A_inv_sim = tc_inv./clk_cycles;
A_and_sim = tc_and./clk_cycles;
A_or_sim = tc_or./clk_cycles;
A_xor_sim = tc_xor./clk_cycles;

%% grafici
% inverter
figure(1)
semilogx(clk_cycles, A_inv, 'linewidth', 2)
hold on
semilogx(clk_cycles, A_inv_sim, 'linewidth', 2)
scatter(clk_cycles, A_inv, 'MarkerEdgeColor',[0 0.4470 0.7410],'MarkerFaceColor', [0 0.4470 0.7410])
scatter(clk_cycles, A_inv_sim, 'MarkerEdgeColor',[0.85 0.3250 0.0980],'MarkerFaceColor', [0.85 0.3250 0.0980])
ylim([0 0.55])
xlabel('Clock cycles');
ylabel('Switching activity')
title('Attività inverter')
legend('dati calcolati', 'dati simulati', 'location', 'best')

% and
figure(2)
semilogx(clk_cycles, A_and, 'linewidth', 2)
hold on
semilogx(clk_cycles, A_and_sim, 'linewidth', 2)
scatter(clk_cycles, A_and, 'MarkerEdgeColor',[0 0.4470 0.7410],'MarkerFaceColor', [0 0.4470 0.7410])
scatter(clk_cycles, A_and_sim, 'MarkerEdgeColor',[0.85 0.3250 0.0980],'MarkerFaceColor', [0.85 0.3250 0.0980])
ylim([0 0.45])
xlabel('Clock cycles');
ylabel('Switching activity')
title('Attività AND')
legend('dati calcolati', 'dati simulati', 'location', 'best')

% or
figure(3)
semilogx(clk_cycles, A_or, 'linewidth', 2)
hold on
semilogx(clk_cycles, A_or_sim, 'linewidth', 2)
scatter(clk_cycles, A_or, 'MarkerEdgeColor',[0 0.4470 0.7410],'MarkerFaceColor', [0 0.4470 0.7410])
scatter(clk_cycles, A_or_sim, 'MarkerEdgeColor',[0.85 0.3250 0.0980],'MarkerFaceColor', [0.85 0.3250 0.0980])
ylim([0 0.45])
xlabel('Clock cycles');
ylabel('Switching activity')
title('Attività OR')
legend('dati calcolati', 'dati simulati', 'location', 'best')

% xor
figure(4)
semilogx(clk_cycles, A_xor, 'linewidth', 2)
hold on
semilogx(clk_cycles, A_xor_sim, 'linewidth', 2)
scatter(clk_cycles, A_xor, 'MarkerEdgeColor',[0 0.4470 0.7410],'MarkerFaceColor', [0 0.4470 0.7410])
scatter(clk_cycles, A_xor_sim, 'MarkerEdgeColor',[0.85 0.3250 0.0980],'MarkerFaceColor', [0.85 0.3250 0.0980])
ylim([0 0.55])
xlabel('Clock cycles');
ylabel('Switching activity')
title('Attività XOR')
legend('dati calcolati', 'dati simulati', 'location', 'best')