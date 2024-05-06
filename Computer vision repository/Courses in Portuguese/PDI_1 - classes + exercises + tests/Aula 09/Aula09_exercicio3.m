close all
clc
clear all
 
% Imagem
I = imread('B4TM_1996.tif');

% referencia
R = imread('B4TM_2006.tif');

L = 256;

[m,n] = size(I);

for i=1:L
xi(1,i) = i-1;
end
freqi = zeros(1,L);
for i = 1:m
for j = 1:n
valor = I(i,j);
freqi(1,valor+1) = freqi(1,valor+1) + 1;
end
end
% Histograma cumulativo da imagem I
fci = zeros(1,L);
for i = 1: L
if i == 1
fci(1,i) = freqi(1,i);
else
fci(1,i) = fci(1,i-1)+ freqi(1,i);
end
end
% plot(xi,fci)
% hold on


% Histograma
for i=1:L
xr(1,i) = i-1;
end
freqr= zeros(1,L);
for i = 1:m
for j = 1:n
valor = R(i,j);
freqr(1,valor+1) = freqr(1,valor+1) + 1;
end
end
% Histograma cumulativo da imagem R
fcr = zeros(1,L);
for i = 1: L
if i == 1
fcr(1,i) = freqr(1,i);
else
fcr(1,i) = fcr(1,i-1)+ freqr(1,i);
end
end
% plot(xr,fcr)
% hold on


xs=zeros(1,L);
for i = 1:L-1
if fci(i) > 0 & fci(i) <= m*n
ivalor = fci(i)
for j = 1:L-1
if j ==1 & fcr(1,j) >= ivalor
pos = j;
end
if j >1 & (fcr(1, j-1) < ivalor & fcr(1,j) >= ivalor)
pos = j;
end
end
xs(1,i) = xr(1,pos);
end
end
xs(1,L) = xr(1,pos);

% gera nova imagem
for i = 1:m
for j = 1:n
ND = I(i,j);
aux = xi(1,ND+1);
novo = xs(1,aux+1);
Imatch(i,j) = novo;
end
end
title('1996 modificada')
imagesc(Imatch)
figure
title('1996')
imagesc(I)
%figure 2