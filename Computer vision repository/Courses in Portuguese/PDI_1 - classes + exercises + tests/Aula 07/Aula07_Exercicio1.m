close all
clc
clear all

% mapeamento direto: coordenadas u,v de imagem para sistema x,y

I = imread('tabuleiro3.tif');


    [m,n,k] = size(I);
    d = 190;    % 190 é a maior dimensão da imagem de saída, como indicado na tabela
    % Imagem de saída S de dimensão d x d.
    S = zeros(d,d);
    
    % entrada
A = [1 1 120 120    % i   %linha/
    1 120 120 1     % j   %/coluna
    1 1 1 1];

% saída
B = [95 1 95 190    %u   %linha/
    1 95 190 95     %v   %/coluna
    1 1 1 1]; 
            

    % 3B4 = 3X3*3A4
    % 3B*A' = X*3
    
    X = B*A'*inv(A*A');
    
 
for i = 1:m
for j = 1:n
A1 = [i
      j
      1];
    
B1 = X*A1; 
%      u 
%B1 = [v]
%      1 
 %vizinho mais próximo
u = round(B1(1));  % equivale à linha
v = round(B1(2));  % equivale à coluna
 
S(u,v) = I(i,j);
end
end
figure
imagesc(S)
colormap gray
axis equal
% A imagem de saída fica com vários deslocamentos errados/irregulares de pixeis devido
% ao arredondamento. 
