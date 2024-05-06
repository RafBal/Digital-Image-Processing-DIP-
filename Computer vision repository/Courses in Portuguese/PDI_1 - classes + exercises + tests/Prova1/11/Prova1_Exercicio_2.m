close all
clc 
clear all

% Exercício de realce
I = imread('imagem1.tif');
I = double(I);

 [m,n,k] = size(I);
 L = 256;
 
 % Frequência 
 Rfreq = zeros(1,L);
for i = 1:m
    for j = 1:n
        valor = I(i,j);
        Rfreq(1,valor+1) = Rfreq(1,valor+1) + 1;
    end
end
 
 % Frequência cumulativa 
 RFreq_cum = zeros(1,L);
 for i = 1:L
     
         if i == 1
         RFreq_cum(1,i) = Rfreq(1,i);
         else
             RFreq_cum(1,i) = RFreq_cum(1,i-1)+Rfreq(1,i);
         end
     
 end
 
    
    fator = (L-1 ) / (m*n) % Normaliza os valores
    % NDs da imagem de saída:
    RNDeq = round (RFreq_cum * fator); % Equalizado
 
    
    % Gera imagem de saida 
for i = 1:m
for j = 1:n
   k = 1;
    aux = I(i,j,1);
pos_hist_origR = aux+1;
novoNDR = RNDeq(1,pos_hist_origR);
IR(i,j) = novoNDR;
end
end

 
Ieq(:,:,1) = IR;
Ieq = uint8(Ieq); % Salva em 8 bits
imwrite(Ieq,'imagem1_realçada.tif','compress','none')
imagesc(Ieq)
colormap gray