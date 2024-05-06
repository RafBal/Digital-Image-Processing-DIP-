close all
clc
clear all
I = imread('tabuleiro.tif');
    I = double(I); 
    [m,n] = size(I); % Imagem I 
    S = zeros(m,n); % imagem de saída
% definição do filtro: 
df= 3  %  dimensão do filtro 

% Especificar os valores do filtro:

d1 = floor(df/2); 
% Quantas linhas e colunas existem do centro até terminar
% a máscara (sem incluir a coluna e linha onde se encontra o centro).

d2= ceil(df/2); % Centro da máscara

M = [1/9 1/9 1/9
     1/9 1/9 1/9
     1/9 1/9 1/9];

for  i = d2:m-d1 
    for  j = d2:n-d1
        soma = 0;
        for  s = -d1:d1 
            for  t = -d1:d1
                soma = soma + M(d2 + s, d2 + t)* I(i-s, j-t); 
            end
        end
        S(i,j) = round(soma); 
    end
end

% c)
% Valores máximo e mínimo da imagem de entrada:
Imax = max(max(I))
Imin = min(min(I))
% Valores máximo e mínimo da imagem de saída:
Smax = max(max(S))
Smin = min(min(S))

imagesc(S)
colormap gray