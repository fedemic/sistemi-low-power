close all;
clc;

cnt = 0;

% Scorro tutte le word
for i = 1:(length(original_set)-1)
    
    % Metto due word consecutive in una matrice
    x = [original_set(i, 1:8); original_set(i+1, 1:8)];    
    % Calcolo la distanza di hamming tra gli elementi
    hamming_d = pdist(x, 'hamming');    
    % Se è maggiore di 0.5
    if (hamming_d > 0.5)
        cnt = cnt + 1;
    end
    
end

percentage = cnt*100/(length(original_set)-1)



