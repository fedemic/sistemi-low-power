close all;
clear all;
clc;

%% Generation

% Matrice per il nuovo set di valori
new_set = zeros(10001, 8);
% Prima word/indirizzo
new_set(1,:) = [0 1 0 0 1 0 0 1];


for i = 2:10001
    
    flag = 0;
    % Genera una word a caso finchè non trova una distanza
    % di hamming > 0.5 rispetto a quella precedente
    while (flag == 0)        
        rand = randi([0 1], 1, 8);    
        if (pdist2(new_set(i-1, :), rand, 'hamming') > 0.5)
            new_set(i, :) = rand;
            flag = 1;
        end
    end   
    
end


%% Check

cnt = 0;

% Scorro tutte le word
for i = 1:(length(new_set)-1)
    
    % Metto due word consecutive in una matrice
    x = [new_set(i, :); new_set(i+1, :)];    
    % Calcolo la distanza di hamming tra gli elementi
    hamming_d = pdist(x, 'hamming');    
    % Se è maggiore di 0.5
    if (hamming_d > 0.5)
        cnt = cnt + 1;
    end
    
end

percentage = cnt*100/(length(new_set)-1)