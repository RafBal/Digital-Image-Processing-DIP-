close all
clc
clear all

% mapeamento inverso: sistema x,y para sitema u,v

Quadro = imread('Esmanhoto.tif');
Moldura = imread('moldura.tif');


% Moldura (linha,coluna):
% Ponto 1: (172,111)         (canto inferior esquerdo)
% Ponto 2: (172,321)        (canto inferior direito)
% Ponto 3: (126,111)          (canto superior esquerdo)
% Ponto 4: (126,321)         (canto superior direito)

M = [172 172 126 126; 111 321 111 321; 1 1 1 1];    % M equivale à matriz A

% Quadro (linha,coluna):
% Ponto 1: (110,2)        ("canto inferior esquerdo")
% Ponto 2: (143,386)        ("canto inferior direito")
% Ponto 3: (1,11)          ("canto superior esquerdo")
% Ponto 4: (35,395)          ("canto superior direito")

Q = [110 143 1 35; 2 386 11 395; 1 1 1 1];    % Q equivale à matriz B

X = Q*M'*inv(M*M');         % Destacar do código e o resultado 'X'.

 resol = 1;
 
 Ymax = 321;
 Ymin = 111;
 Xmax = 172;
 Xmin = 126;
 
 [m,n,k] = size(Quadro);
 Saida = Moldura;
 for i = Xmin:Xmax
for j = Ymin:Ymax
   
A1 = [i     % linha
      j     % coluna
      1];
 B1 = X*A1;           % Destacar do código.
 
 % B1=  [up linha 
 %       vp coluna
 %       1]
 
 %vizinho mais próximo
u = round(B1(1));
v = round(B1(2));

if (u>= 1 & u<=m) & ( v >= 1 & v<=n)
% preenchimento da imagem de saída
Saida(i, j, 1) = Quadro(u,v,1);
Saida(i, j, 2) = Quadro(u,v,2);
Saida(i, j, 3) = Quadro(u,v,3);
end
end
end
 imagesc(Saida)
 imwrite(Saida, 'obra.tif', 'compress', 'none')