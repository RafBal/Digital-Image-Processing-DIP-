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
df= 7;  %  dimens�o do filtro 

% especificar os valores do filtro
d1 = floor(df/2); % Quantas linhas e colunas existem do dentro at� terminar
% a m�scara (sem incluir a coluna e linha onde se encontra o centro).
d2= ceil(df/2); % Centro da m�scara

M = ones(df,df);
M=M/(df*df);

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
% Valores m�ximo e m�nimo da imagem de entrada:
Imax = max(max(I))
Imin = min(min(I))
% Valores m�ximo e m�nimo da imagem de sa�da:
Smax = max(max(S))
Smin = min(min(S))

imagesc(S)
colormap gray
