close all
clc
clear all

I = imread('paisagem1.tif');
I = double(I);

[m,n] = size(I);

for i = 1:m
    for j = 1:n
                X(n*(i-1)+j) = I(i,j);
    end
end
mean(X)
%std(X)
min(X)
max(X)
% ND possíveis na imagem
% ND = 256

L = 256;
ndmax = max(max(I))
ndmin = min(min(I))
a = (L-1)/(ndmax - ndmin);
b = -a*ndmin;

Rlinear = zeros(m,n);

for i = 1:m
    for j = 1:n
        Rlinear(i,j) = round(I(i,j)*a+b);
    end
end

for i = 1:L
    ND(1,i) = i-1;
end
freq = zeros(1,L);  % Mesmo tamanho que ND.
%[m,n]: dimensão da imagem I
for i = 1:m
    for j = 1:n
        valor = I(i,j);
        freq(1,valor+1) = freq(1,valor+1) + 1; % valor+1 = posição no vetor ND.
    end
end
bar(ND,freq)
figure 
imagesc(Rlinear)
colormap gray