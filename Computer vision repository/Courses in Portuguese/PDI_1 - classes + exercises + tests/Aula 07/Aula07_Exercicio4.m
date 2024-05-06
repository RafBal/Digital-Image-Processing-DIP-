clc
clear all

% mapeamento inverso: sistema x,y para sitema u,v

I = imread('Brasilia.tif');
I = double(I); 
[m,n,k] = size(I);
 
   
% A: matriz com as coordenadas (homogêneas) UTM dos pontos de controle.
A = [184000 196000 196000 184000    %E equivale às colunas
    8256000 8256000 8248000 8248000 %N equivale às linhas
    1 1 1 1]; 

% B: matriz com as coordenadas (homogêneas) de imagem dos pontos de
% controle
B = [74 873 873 73    % coluna
    65 65 598 599     % linha
    1 1 1 1];

% X: matriz contendo os parâmetros da transformação.
    X = B*A'*inv(A*A');

    % Coordenadas extremas da região
    Emin = 184000;  %colunas
    Emax = 196000;
    Nmax = 8256000; %linhas
    Nmin = 8248000;
  
    %  resolução da imagem de saída: 15m
    r =15;
    deltaN = (Nmax - Nmin);
    deltaE = (Emax - Emin);
    
    %número de linhas na imagem de saída;
    nlin = ceil(deltaN/r);
    %número de colunas na imagem de saída:
    ncol = ceil(deltaE/r);
    
    S = zeros(nlin,ncol,3);
for i = 1: nlin
for j = 1: ncol
Ep = Emin + (j*r) - r;
Np = Nmax - (i*r) + r;
At = [Ep Np 1]';

  Lt = X*At; 
  
 %vizinho mais próximo
u = round(Lt(1,1)); % coluna
v = round(Lt(2,1)); % linha

if (v>= 1 & v<=m) & ( u >= 1 & u<=n)
S(i,j,1) = I(v,u,1);
S(i,j,2) = I(v,u,2);
S(i,j,3) = I(v,u,3);

end
end
end
S = uint8(S);
imagesc(S)
imwrite(S,'BSB_georef.tif')