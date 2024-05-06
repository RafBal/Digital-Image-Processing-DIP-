clc
clear all

I = [4 4 3 3
    4 4 3 3
    4 1 2 3
    0 1 2 3];
[m,n] = size(I);

for i = 1:m     % nº de linhas
    for j = 1:n     % nº de colunas
        X(n*(i-1)+j) = I(i,j);
    end
end
X;
mean(X);
var(X);
std(X);

L = 8;
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

% posição: 1 2 3 4 5 6 7 8
%    ND = [0 1 2 3 4 5 6 7]

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