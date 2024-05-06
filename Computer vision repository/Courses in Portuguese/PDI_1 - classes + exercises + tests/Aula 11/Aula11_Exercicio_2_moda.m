close all
clc
clear all

I = imread('Rio_classes.tif');
[m,n] = size(I);

% Filtro da moda

nclasses = 5;   % número de classes
df = 3;  % tamanho do filtro
d1 = floor(df/2);       % Para df = 3, d1 = 1.
d2 = ceil(df/2);        % Para df = 3, d2 = 2.
S = zeros(m,n);

for i = d2:m-d1
    for j = d2:n-d1
% para cada posição do filtro efetuar contagem em vetor:
vetor = zeros(nclasses,1);

        for k = -d1:d1
           for l = -d1:d1
               valor = I(i+k, j+l); 
               vetor(valor,1) =  vetor(valor,1)+1; 
           end
        end
    
        % encontrar a posição do maior valor 
        posicao = find(vetor == max(vetor));
        S(i,j) = posicao(1,1);    
    end
end

        
        imagesc(S);
        colormap gray
        imwrite(S,'Rio_classes_moda.tif','compress', 'none')