clc;
clear all;
% MDS: Modelo Digital de Superfície
% Figura para o trabalho 1: C3ALTM
% Entrega do Trabalho 1: 20/10 
% Mosaico: TFW (usar multispec).
a = imread('C3_ALTM.tif');
E0=min(a(:,1))  % Pesquisa o valor mínimo na primeira coluna (coordenada 'x') do arquivo Lactec.txt.
Emax=max(a(:,1))    % Pesquisa o valor máximo na primeira coluna (coordenada 'x') do arquivo Lactec.txt.
Nmin=min(a(:,2))    % Pesquisa o valor mínimo na segunda coluna (coordenada 'y') do arquivo Lactec.txt.
N0 =max(a(:,2))     % Pesquisa o valor máximo na segunda coluna (coordenada 'y') do arquivo Lactec.txt.
%resolução espacial
resol = 1;
%dimensão da imagem
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
imwrite(El, 'LACTECMDS.tif', 'compress', 'none')

format long % Para obter todos os números de váriável.
E0
N0
