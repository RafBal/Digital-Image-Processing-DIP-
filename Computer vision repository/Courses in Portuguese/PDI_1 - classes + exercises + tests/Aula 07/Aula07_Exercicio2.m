clc
clear all

% mapeamento inverso: sistema x,y para sitema u,v

I = imread('tabuleiro3.tif');
 [m,n,k] = size(I);
    d = 190;
    % Imagem de sa�da S de dimens�o d x d.
    S = zeros(d,d);
   

 % sa�da
B = [1 1 120 120    % i   %linha/
    1 120 120 1     % j   %/coluna
    1 1 1 1];

% entrada
A = [95 1 95 190    %u   %linha/
    1 95 190 95     %v   %/coluna
    1 1 1 1]; 

    X = B*A'*inv(A*A');

  
for i = 1: 190
for j = 1: 190
   

A1 = [i
      j
      1];

  B1 = X*A1; 
 
 % B1=  [up
 %       vp
 %       1]
 
 %vizinho mais pr�ximo
u = round(B1(1)); % linha
v = round(B1(2)); % coluna

if (v>= 1 & v<=n) & ( u >= 1 & u<=m)
% preenchimento da imagem de sa�da
S(i,j) = I(u,v);
end
end
end
figure
imagesc(S)
colormap gray
axis equal

% A imagem de sa�da fica melhor reconstru�da com mapeamento inverso, 
% por conservar melhor o preenchimento. Por�m, as linhas/colunas 
% ainda possuem falhas. 