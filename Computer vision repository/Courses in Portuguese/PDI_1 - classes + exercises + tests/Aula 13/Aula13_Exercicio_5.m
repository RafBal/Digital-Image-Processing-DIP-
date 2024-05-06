close all
clc
clear all

I = imread('teclado_8bits.tif');
P = imread('padrao_8bits.tif');

[m,n] = size(I);
[mp,np] = size(P);

d1 = floor(mp/2);
d2 = ceil(mp/2);
I = double(I);
P = double(P);

S = zeros(m,n); % Imagem de saída

for i = d2:m-d1
    for j = d2:n-d1
        soma = 0;
        for k = -d1:d1
            for l = -d1:d1
                % Para graus de cinza:
                soma = soma + (P(d2+k, d2+l) * I(i+k, j+l))/(P(d2+k, d2+l)^2 + I(i+k, j+l)^2);
            end
        end
        S(i,j) = round(soma);
    end
end
imagesc(S) 
colormap gray 
%Posição onde a correlação é máxima:
[i  j] = find(S == max(max(S)))
