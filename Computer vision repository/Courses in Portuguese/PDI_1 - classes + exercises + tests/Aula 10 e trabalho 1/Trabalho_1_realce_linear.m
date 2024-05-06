close all
clc
clear all

I = imread('paisagem2.tif');
[m,n,k] = size(I);

R(:,:) = I(:,:,1);
G(:,:) = I(:,:,2);
B(:,:) = I(:,:,3);

L = 256;

for i = 1:L
    ND(1,i) = i-1;   % Valores possíveis a serem encontrados (de 0 até 255)
end

% posição: 1 2 3 4 5 6 7 8 ... 255 256
%    ND = [0 1 2 3 4 5 6 7 ... 254 255]

Rfreq = zeros(1,L);
for i = 1:m
    for j = 1:n
        valor = R(i,j);
        Rfreq(1,valor+1) = Rfreq(1,valor+1) + 1;
    end
end
plot(ND, Rfreq,'r')
hold on

Gfreq = zeros(1,L);
for i = 1:m
    for j = 1:n
        valor = G(i,j);
        Gfreq(1,valor+1) = Gfreq(1,valor+1) + 1;
    end
end
plot(ND, Gfreq, 'g')
hold on
        
Bfreq = zeros(1,L);
for i = 1:m
    for j = 1:n
        valor = B(i,j);
        Bfreq(1,valor+1) = Bfreq(1,valor+1) + 1;
    end
end
plot(ND, Bfreq, 'b')
hold on
legend('Vermelho', 'Verde', 'Azul')

% Para a banda R
ndmax = max(max(R))
ndmin = min(min(R))
a = (L-1) / (ndmax - ndmin);
b = -a * ndmin;
Rrl = zeros(m,n);
for i = 1:m
for j = 1:n
RRlinear(i,j) = round( R(i,j)*a + b);
end
end

% Para a banda G
ndmax = max(max(G))
ndmin = min(min(G))
a = (L-1) / (ndmax - ndmin);
b = -a * ndmin;
Grl = zeros(m,n);
for i = 1:m
for j = 1:n
GRlinear(i,j) = round( G(i,j)*a + b);
end
end

% Para a banda B
ndmax = max(max(B))
ndmin = min(min(B))
a = (L-1) / (ndmax - ndmin);
b = -a * ndmin;
Brl = zeros(m,n);
for i = 1:m
for j = 1:n
BRlinear(i,j) = round( B(i,j)*a + b);
end
end

% composição colorida da imagem
% com realce linear
Irl(:,:,1) = RRlinear(:,:);
Irl(:,:,2) = GRlinear(:,:);
Irl(:,:,3) = BRlinear(:,:);
% salvar a imagem Irl
imwrite(Irl,'realcepaisagem2.tif')

ndmaxIrl = max(max(Irl));
ndminIrl = min(min(Irl));
ConstrastIrl = (ndmaxIrl-ndminIrl)./(ndmaxIrl+ndminIrl)
ndmaxI = max(max(I));
ndminI = min(min(I));
ContrastI = (ndmaxI-ndminI)./(ndmaxI+ndminI)

% Realce linear não é muito eficiente.