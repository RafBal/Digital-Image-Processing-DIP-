close all
clc
clear all

% Filtro da mediana

I = imread('Rio_classes.tif');
S = I;

[m,n] = size(I);
df = 3; %tamanho do filtro
d1 = floor(df/2);
d2 = ceil(df/2);

% para cada posição (i,j) da imagem I, criar vetor:
for i = d2:m-d1
   for j = d2:n-d1
     for k = -d1:d1
       for l = -d1:d1
           
        vetor(df*(d2+k-1)+(d2+l)) = I(i+k, j+1);
            end
        end
    end
end
S(i,j) = median(vetor);
imagesc(S)
colormap gray