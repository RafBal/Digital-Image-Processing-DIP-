close all
clc
clear all
% Exercício de filtro
% Filtro da mediana usando a função sort

I = imread('imagem3.tif');
I = double(I);
[m,n] = size(I);

S = zeros(m,n);

df = 3; %tamanho do filtro
d1 = floor(df/2);       % Para df = 3, d1 = 1.
d2 = ceil(df/2);        % Para df = 3, d2 = 2.

pos =  ceil((df*df)/2); % posição da mediana
% para cada posição (i,j) da imagem I, criar vetor:
for i = d2:m-d1
   for j = d2:n-d1
     for k = -d1:d1
       for l = -d1:d1
           
        vetor(df*(d2+k-1)+(d2+l)) = I(i+k, j+l);
            end
        end
   
ordem = sort(vetor);
S(i,j) = ordem(pos);
   end
end
imagesc(S)
colormap gray