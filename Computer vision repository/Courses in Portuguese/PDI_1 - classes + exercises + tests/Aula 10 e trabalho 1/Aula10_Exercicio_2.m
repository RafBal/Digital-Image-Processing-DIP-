% Métodos para o trabalho: realce linear de contraste, equalização rgb,
% equalização intensidade.


close all
clc
clear all
I = imread('Sal_e_pimenta.tif');
    I = double(I); 
    [m,n] = size(I); % Imagem I 
    S = zeros(m,n); % imagem de saída
% definição do filtro: 
df= 7;  %  dimensão do filtro 

% especificar os valores do filtro
d1 = floor(df/2); % Quantas linhas e colunas existem do dentro até terminar
% a máscara (sem incluir a coluna e linha onde se encontra o centro).
d2= ceil(df/2); % Centro da máscara

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
imagesc(S)
colormap gray

% O filtro passa-baixa não é o mais adequado, pois ele embaça muito a
% imagem ao retirar o ruído.