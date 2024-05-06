close all
clc 
clear all

E = imread('paisagem2.tif');

[m,n,k] = size(E);
E = double(E);

R = E(:,:,1)/255;
G = E(:,:,2)/255;
B = E(:,:,3)/255;
I = zeros(m,n);
H = I;
S = I;

for i = 1:m
    for j = 1:n
if (R(i,j) == G(i,j)) & (R(i,j) == B(i,j))
S(i,j) = 0;
else
    
    % intensidade
I(i,j) = ( R(i,j) + G(i,j) + B(i,j)) / 3;

    % saturação
a = min([ R(i,j) G(i,j) B(i,j) ] );
S(i,j) = 1 - (3 * a) / ( R(i,j)+ G(i,j) + B(i,j) ) ;

    % matiz
num = ( R(i,j) - G(i,j) ) + (R(i,j) - B(i,j) ) ;
den = 2 * sqrt ( ( R(i,j) - G(i,j) )^2 + (R(i,j) - B(i,j)) * (G(i,j) - B(i,j) ) );
theta = acosd(num/den); % acosd serve para obter ângulo em graus.
% pode ser também: theta = (theta*360)/(2*pi)

if B(i,j) <= G(i,j)
H(i,j) = theta;
elseif B(i,j) > G(i,j)
H(i,j) = 360 - theta ;
end
end
    end
end
I = double(I);
% Converter I para 8 bits
I = I*255;
I = uint8(I);
 [m,n,k] = size(I);
 L = 256;
 
 % Frequência em escala de cinza
 freq = zeros(1,L);
for i = 1:m
    for j = 1:n
        valor = I(i,j);
        freq(1,valor+1) = freq(1,valor+1) + 1;
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
 
    
    fator = (L-1 ) / (m*n) % Normaliza os valores
    % NDs da imagem de saída:
    NDeq = round (Freq_cum * fator); % Equalizado
    
    
    % Gera imagem de saida
for i = 1:m
for j = 1:n
   k = 1;
    aux = I(i,j,1);
pos_hist_origR = aux+1;
novoNDR = NDeq(1,pos_hist_origR);
IR(i,j) = novoNDR;
end
end

Ieq(:,:) = IR;
Ieq = uint8(Ieq); % Salva em 8 bits

% Converter Ieq para o intervalo [0,1]
Ieq = double(Ieq);
Ieq = Ieq/255;

for i = 1:m
    for j = 1:n
if S(i,j) == 0 
    b(i,j) = Ieq(i,j); 
    g(i,j) = Ieq(i,j);   
    r(i,j) = Ieq(i,j); 
else
    if H(i,j) >= 0 & H(i,j) <= 120 
        b(i,j) =  Ieq(i,j) * (1 - S(i,j)); 
        r(i,j) =  Ieq(i,j)  * ( 1 + ( S(i,j)* cosd(H(i,j)) / cosd(60 -H(i,j)) ) ) ; 
        g(i,j) =  3*Ieq(i,j)  - ( b(i,j) + r(i,j) ) ; 
    end 
    if H(i,j) > 120 & H(i,j) <= 240 
        H(i,j) = H(i,j) - 120; 
        r(i,j) = Ieq(i,j) * (1 - S(i,j));
        g(i,j) = Ieq(i,j) * ( 1 + ( S(i,j)* cosd(H(i,j) ) / cosd(60 -H(i,j)) )  );
        b(i,j) = 3*Ieq(i,j) - (r(i,j) + g(i,j) );
    end
    if H(i,j) > 240 & H(i,j) <= 360 
        H(i,j) = H(i,j) - 240; 
        g(i,j) = Ieq(i,j) * (1 - S(i,j)); 
        b(i,j) = Ieq(i,j) * ( 1 + ( S(i,j)* cosd(H(i,j) ) / cosd(60 -H(i,j)) )  ); 
        r(i,j) = 3*Ieq(i,j) - ( g(i,j) + b(i,j) );
    end
end
    end
end
R = 255*r;
G = 255*g;
B = 255*b;
saida(:,:,1) = R;
saida(:,:,2) = G;
saida(:,:,3) = B;

saida = uint8(saida);    
   
imwrite(saida,'realce3paisagem2.tif','compress','none')
imagesc(saida)
