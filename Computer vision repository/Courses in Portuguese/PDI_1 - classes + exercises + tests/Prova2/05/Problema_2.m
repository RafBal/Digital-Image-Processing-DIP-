close all
clc
clear all

I = imread('bin05_new.tif');
P = imread('alvo05_new.tif');

[m,n] = size(I);
[mp,np] = size(P);

d1 = floor(mp/2);
d2 = ceil(mp/2);
I = double(I);
P = double(P);

S = zeros(m,n); % Imagem de sa�da

for i = d2:m-d1
    for j = d2:n-d1
        soma = 0;
        for k = - d1:d1
            for l = -d1:d1
                % Para preto & branco:
                soma = soma+ P(d2+k, d2+l) * I(i+k, j+l);
            end
        end
        S(i,j) = round(soma);
    end
end
imagesc(S) 
colormap gray 
%Posi��o onde a correla��o � m�xima:
[i  j] = find(S == max(max(S)))
