close all
clc
clear all

% mapeamento inverso: sistema x,y para sitema u,v

Quadro = imread('Friedrich.tif');
Moldura = imread('moldura1.tif');

% "moldura1.tif" foi invertida por motivos estéticos.

% Moldura (linha,coluna):
% Ponto 1: (460,38)         (canto inferior esquerdo)
% Ponto 2: (460,339)        (canto inferior direito)
% Ponto 3: (40,38)          (canto superior esquerdo)
% Ponto 4: (40,339)         (canto superior direito)

M = [460 460 40 40; 38 339 38 339; 1 1 1 1];    % M equivale à matriz A

% Quadro (linha,coluna):
% Ponto 1: (833,244)        ("canto inferior esquerdo")
% Ponto 2: (661,712)        ("canto inferior direito")
% Ponto 3: (172,1)          ("canto superior esquerdo")
% Ponto 4: (1,470)          ("canto superior direito")

Q = [833 661 172 1; 244 712 1 470; 1 1 1 1];    % Q equivale à matriz B

X = Q*M'*inv(M*M');         % Destacar do código e o resultado 'X'.

 resol = 1;
 
 Ymax = 339;
 Ymin = 38;
 Xmax = 460;
 Xmin = 40;
 
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