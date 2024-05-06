clc;
clear all;
% MDS: Modelo Digital de Superf�cie
% Figura para o trabalho 1: C3ALTM
% Entrega do Trabalho 1: 20/10 
% Mosaico: TFW (usar multispec).

% D�vidas:
% 1) Como criar MDS a partir de um arquivo tipo .tif?
% 2) Tenho que fazer alguma altera��o na imagem antes de criar o MDS? Se
% sim, como?
% 3) Como delimitar 




a = imread('C3_ALTM.tif');
E0=min(a(:,1))  % Pesquisa o valor m�nimo na primeira coluna (coordenada 'x') do arquivo.
Emax=max(a(:,1))    % Pesquisa o valor m�ximo na primeira coluna (coordenada 'x') do arquivo.
Nmin=min(a(:,2))    % Pesquisa o valor m�nimo na segunda coluna (coordenada 'y') do arquivo.
N0 =max(a(:,2))     % Pesquisa o valor m�ximo na segunda coluna (coordenada 'y') do arquivo.
%resolu��o espacial
resol = 1;
%dimens�o da imagem
m=ceil((N0 -Nmin)/resol)
n=ceil((Emax-E0)/resol)
El=zeros(m,n);
[ma, na] = size(a);

for i=1:ma
c = ( (a(i,1)-E0)/resol ) + 1;
l = ( (N0-a(i,2))/resol ) + 1;
col= round(c);  % Arredondamento.
lin= round(l);
if (lin>0 & lin<=m) & (col > 0 & col <=n)
if El(lin,col) == 0
El(lin,col)=round(a(i,3));
end
if El(lin,col) > 0
aux = round(a(i,3));
if aux > El(lin,col)
El(lin,col) = aux;
end
end
end
end
El = El-700;

imagesc(El)
colormap gray
axis equal
El=uint8(El);
imwrite(El, 'C3ALTM.tif', 'compress', 'none')

format long % Para obter todos os n�meros de v�ri�vel.
E0
N0
