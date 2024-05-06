clc
clear all

% mapeamento inverso: sistema x,y para sitema u,v com o interpolador bilinear

I = imread('tabuleiro3.tif');
 [m,n,k] = size(I);
    d = 190;
    % Imagem de saída S de dimensão d x d.
    S = zeros(d,d);
   

 % saída
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
 
 %vizinho mais próximo
v = B1(2,1); % coluna
u = B1(1,1); % linha

if (u>= 1 & u<=(m-1)) & ( v >= 2 & v<=(n-1))

    a = u - floor(u);   % floor arredonda para baixo
    b = v - floor(v);   % ceil arredonda para cima
    aux1 = a*I( floor(u), ceil(v)) + (1-a)* I(floor(u), floor(v));
    aux2 = a*I( ceil(u), ceil(v)) + (1-a)* I(ceil(u), floor(v));
    valor = b* aux2 + (1-b)*aux1;
S(i,j) = round(valor);
end
end
end
figure
imagesc(S)
colormap gray
axis equal
 
% Apesar dos contornos terem ficado mais borrados, as linhas ficaram mais
% completas.