close all
clc
clear all

% mapeamento direto: coordenadas u,v de imagem para sistema x,y

I = imread('tabuleiro3.tif');


    [m,n,k] = size(I);
    d = 190;    % 190 � a maior dimens�o da imagem de sa�da, como indicado na tabela
    % Imagem de sa�da S de dimens�o d x d.
    S = zeros(d,d);
    
    % entrada
A = [1 1 120 120    % i   %linha/
    1 120 120 1     % j   %/coluna
    1 1 1 1];

% sa�da
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
 %vizinho mais pr�ximo
u = round(B1(1));  % equivale � linha
v = round(B1(2));  % equivale � coluna
 
S(u,v) = I(i,j);
end
end
figure
imagesc(S)
colormap gray
axis equal
% A imagem de sa�da fica com v�rios deslocamentos errados/irregulares de pixeis devido
% ao arredondamento. 
