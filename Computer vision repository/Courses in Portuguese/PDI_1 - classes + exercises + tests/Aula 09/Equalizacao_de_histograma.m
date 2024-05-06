close all
clc 
clear all

I = [0 1 2 3 4 5
     2 2 3 4 5 6
     3 3 4 5 13 14
     4 4 5 14 14 15];
 [m,n] = size(I);
 L = 16;
 freq = zeros(1,L);
 for i = 1:m
     for j = 1:n
         valor = I(i,j);
         freq(1,valor+1) = freq(1,valor+1)+1;
     end
 end
 
 % Frequência cumulativa
 Freq_cum = zeros(1,L);
 for i = 1:L
     
         if i == 1
         Freq_cum(1,i) = freq(1,i);
         else
             Freq_cum(1,i) = Freq_cum(1,i-1)+freq(1,i);
         end
     
 end
 
     for i = 1:L
    ND(1,i) = i-1;
     end
    
     bar(ND,Freq_cum,'k')
     title('Figura 1')
     xlabel('ND')
     ylabel('Frequência acumulada')
% 
%      bar(ND,freq)
    fator = (L-1 ) / (m*n) % Normaliza os valores
    % NDs da imagem de saída:
    NDeq = round (Freq_cum * fator); % Equalizado
    
    
    % Gera imagem de saida
for i = 1:m
for j = 1:n
aux = I(i,j);
pos_hist_orig = aux+1;
novoND = NDeq(1,pos_hist_orig);
Ieq(i,j) = novoND ;
end
end