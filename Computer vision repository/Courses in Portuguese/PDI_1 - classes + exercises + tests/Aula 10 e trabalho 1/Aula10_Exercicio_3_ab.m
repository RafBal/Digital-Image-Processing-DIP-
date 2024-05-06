% Métodos para o trabalho: realce linear de contraste, equalização rgb,
% equalização intensidade.


close all
clc
clear all
I = imread('tabuleiro.tif');
    I = double(I); 
    [m,n] = size(I); % Imagem I 
    S = zeros(m,n); % imagem de saída
% definição do filtro: 
df= 3;  %  dimensão do filtro 

% especificar os valores do filtro
d1 = floor(df/2); % Quantas linhas e colunas existem do dentro até terminar
% a máscara (sem incluir a coluna e linha onde se encontra o centro).
d2= ceil(df/2); % Centro da máscara

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
% Valores máximo e mínimo da imagem de entrada:
Imax = max(max(I))
Imin = min(min(I))
% Valores máximo e mínimo da imagem de saída:
Smax = max(max(S))
Smin = min(min(S))

imagesc(S)
colormap gray
% Quando a somatória = 0, foca nos contrastes.
% Quando a somatória = 1, deixa um pouco da imagem original e deixa as
% bordas em cima. Se a somatória for muito maior que 1, elimina a borda.