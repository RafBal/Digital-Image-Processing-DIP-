% M�todos para o trabalho: realce linear de contraste, equaliza��o rgb,
% equaliza��o intensidade.


close all
clc
clear all
I = imread('tabuleiro.tif');
    I = double(I); 
    [m,n] = size(I); % Imagem I 
    S = zeros(m,n); % imagem de sa�da
% defini��o do filtro: 
df= 3;  %  dimens�o do filtro 

% especificar os valores do filtro
d1 = floor(df/2); % Quantas linhas e colunas existem do dentro at� terminar
% a m�scara (sem incluir a coluna e linha onde se encontra o centro).
d2= ceil(df/2); % Centro da m�scara

M = [-1 -1 -1
     -1  8 -1
     -1 -1 -1];
 M = M./8;

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
% b)
% Valores m�ximo e m�nimo da imagem de entrada:
Imax = max(max(I))
Imin = min(min(I))
% Valores m�ximo e m�nimo da imagem de sa�da:
Smax = max(max(S))
Smin = min(min(S))

imagesc(S)
colormap gray
% Quando a somat�ria = 0, foca nos contrastes.
% Quando a somat�ria = 1, deixa um pouco da imagem original e deixa as
% bordas em cima. Se a somat�ria for muito maior que 1, elimina a borda.