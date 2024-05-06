close all
clc
clear all

% mapeamento inverso: sistema x,y para sitema u,v

I = imread('Elis.tif');

% Folha A4:  (linha,coluna)
%(0,0) == (209,23); 
%(210,0) == (652,169)
%(210,297) == (440,778)
%(0,297) == (7,630)

A = [ 0 210 210 0; 0 0 297 297; 1 1 1 1];   % Folha
     %linha/         /coluna

B = [ 209 652 440 7; 23 169 778 630; 1 1 1 1];  % Livro
       %linha/         /coluna

    X = B*A'*inv(A*A');

    
    resol = 0.5;
    
    Ymax = 297;
    Ymin = 0; 
    Xmax = 210;
    Xmin = 0;
    
    % Relação da imagem com o terreno:
    nlin = ceil((Ymax-Ymin)/resol)
    ncol = ceil((Xmax-Xmin)/resol)


[m,n,k] = size(I);


for i = 1: nlin
for j = 1: ncol
    % (i,j) corresponde a (Xp,Yp)

Xp = Xmin + (j -1 ) * resol;
Yp = Ymax - (i -1 ) * resol;
A1 = [Xp
      Yp
      1];
 B1 = X*A1; 
 
 % B1=  [up
 %       vp
 %       1]
 
 %vizinho mais próximo
u = round(B1(1));    % linha
v = round(B1(2));    % coluna

if (v>= 1 & v<=n) & ( u >= 1 & u<=m)
% preenchimento da imagem de saída
Saida(i, j, 1) = I(u,v,1);
Saida(i, j, 2) = I(u,v,2);
Saida(i, j, 3) = I(u,v,3);

end
end
end
Xp
Yp
imagesc(Saida)
axis equal

imwrite(Saida,'Elis_novo.tif')