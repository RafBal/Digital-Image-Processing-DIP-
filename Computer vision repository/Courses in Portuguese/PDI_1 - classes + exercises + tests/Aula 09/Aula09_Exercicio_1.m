close all
clc 
clear all

I = imread('luar.tif');
I = double(I);

 [m,n,k] = size(I);
 L = 256;
 
 % Frequência de vermelho
 Rfreq = zeros(1,L);
for i = 1:m
    for j = 1:n
        valor = I(i,j);
        Rfreq(1,valor+1) = Rfreq(1,valor+1) + 1;
    end
end
 
 % Frequência cumulativa de vermelho
 RFreq_cum = zeros(1,L);
 for i = 1:L
     
         if i == 1
         RFreq_cum(1,i) = Rfreq(1,i);
         else
             RFreq_cum(1,i) = RFreq_cum(1,i-1)+Rfreq(1,i);
         end
     
 end
 
 % Frequência de verde
 Gfreq = zeros(1,L);
for i = 1:m
    for j = 1:n
        valor = I(i,j);
        Gfreq(1,valor+1) = Gfreq(1,valor+1) + 1;
    end
end
 
 % Frequência cumulativa de verde
 GFreq_cum = zeros(1,L);
 for i = 1:L
     
         if i == 1
         GFreq_cum(1,i) = Gfreq(1,i);
         else
             GFreq_cum(1,i) = GFreq_cum(1,i-1)+Gfreq(1,i);
         end
     
 end
 
 % Frequência de azul
 Bfreq = zeros(1,L);
for i = 1:m
    for j = 1:n
        valor = I(i,j);
        Bfreq(1,valor+1) = Bfreq(1,valor+1) + 1;
    end
end
 
 % Frequência cumulativa de azul
 BFreq_cum = zeros(1,L);
 for i = 1:L
     
         if i == 1
         BFreq_cum(1,i) = Bfreq(1,i);
         else
             BFreq_cum(1,i) = BFreq_cum(1,i-1)+Bfreq(1,i);
         end
     
 end
 
    
    fator = (L-1 ) / (m*n) % Normaliza os valores
    % NDs da imagem de saída:
    RNDeq = round (RFreq_cum * fator); % Equalizado
    GNDeq = round (GFreq_cum * fator); % Equalizado
    BNDeq = round (BFreq_cum * fator); % Equalizado

    
    % Gera imagem de saida de vermelho
for i = 1:m
for j = 1:n
   k = 1;
    aux = I(i,j,1);
pos_hist_origR = aux+1;
novoNDR = RNDeq(1,pos_hist_origR);
IR(i,j) = novoNDR;
end
end

 % Gera imagem de saida de verde
for i = 1:m
for j = 1:n
     k = 2;
    aux = I(i,j,2);
pos_hist_origG = aux+1;
   novoNDG = GNDeq(1,pos_hist_origG);
IG(i,j) = novoNDG;
end
end


% Gera imagem de saida de azul
for i = 1:m
for j = 1:n
    k = 3;
    aux = I(i,j,3);
pos_hist_origB = aux+1;
    novoNDB = BNDeq(1,pos_hist_origB);
IB(i,j) = novoNDB;
end
end
Ieq(:,:,1) = IR;
Ieq(:,:,2) = IG;
Ieq(:,:,3) = IB;
Ieq = uint8(Ieq); % Salva em 8 bits
imwrite(Ieq,'teste.tif','compress','none')
imagesc(Ieq)