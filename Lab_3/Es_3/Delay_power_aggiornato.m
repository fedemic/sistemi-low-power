close all;
clear all;
clc;

%% Dati nominali
reg_delay_nom = 2e-9;
incr_delay_nom = 40e-9;
comp_delay_nom = 84e-9;
mux_delay_nom = 14e-9;

reg_pow_nom = 0.6e-6;
incr_pow_nom = 2.55e-6;
comp_pow_nom = 2.16e-6;
mux_pow_nom = 1.67e-6;

%% Calcolo ritardi e potenze
pipeline = 1; % Attiva o disattiva la pipeline
k_parallelismo = 2; % Indica quante unità lavorano in parallelo, se la pipe è
                    % disattivata lasciare a 2
k_pipeline = 2.33;

% Calcolo del ritardo che posso aggiungere dipedentemente da parallelismo e
% pipe
if (pipeline == 1)
    T_nom = 86e-9;
    T = k_parallelismo*k_pipeline*T_nom;
    
else
    T_nom = 140e-9;                %%CAMBIATO, era 142 ns
    T = k_parallelismo*T_nom;
end

% Aggiornamento di ritardi e potenze nella condizione attuale

u = linspace(T*0.25./(T-0.75*T_nom), 1, 1000);
k_delay = 0.75*u./(u-0.25);
k_power = u.^(2);

reg_delay = k_delay*reg_delay_nom;
incr_delay = k_delay*incr_delay_nom;
comp_delay = k_delay*comp_delay_nom;
mux_delay = k_delay*mux_delay_nom;

reg_pow = k_power*reg_pow_nom;
incr_pow = k_power*incr_pow_nom;
comp_pow = k_power*comp_pow_nom;
mux_pow = k_power*mux_pow_nom;

% Calcolo di delay e potenza totale

% Pipeline attiva
if (pipeline == 1)
    tot_delay = reg_delay + comp_delay;               %%CAMBIATO, aggiunto reg_delay
    % Solo pipeline
    if (k_parallelismo == 1)
        tot_power = 7*reg_pow + 2*incr_pow + comp_pow + mux_pow;
    % Pipeline e parallel attivi  
    else
        tot_power = 7*reg_pow + 2*incr_pow + comp_pow + mux_pow + mux_pow;        
    end
% Solo parallel   
else
    tot_delay = reg_delay + incr_delay + comp_delay + mux_delay;           %%CAMBIATO, tolto +reg_delay
    tot_power = 3*reg_pow + 2*incr_pow + comp_pow + mux_pow + mux_pow;
    
end

pow_del_prod = tot_delay.*tot_power;

%% Grafici
figure(1);
plot(u, pow_del_prod, 'linewidth', 2);
xlabel('u');
ylabel('Power Delay Product');
title('Prodotto Potenza Ritardo');

figure(2);
plot(tot_power, tot_delay, 'linewidth', 2);
xlabel('Potenza');
ylabel('Ritardo');
title('Grafico Potenza Ritardo');


%% Ricerca del minimo
pos = find(pow_del_prod == min(pow_del_prod));


%% Stampa valori 
u_ottimale = u(pos)
ritardo_percorso_critico = tot_delay(pos)
potenza_nel_punto_ottimale = tot_power(pos)








