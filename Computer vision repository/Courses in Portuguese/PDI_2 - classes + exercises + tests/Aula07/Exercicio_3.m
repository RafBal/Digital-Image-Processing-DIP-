clc;
clear all;
% Reconstru��o morfol�gica por dilata��o
% EE: elemento estruturante
% M : marcador
% I: Imagem (Mascara)
I = imread('MDS_acima700m.tif' );
I = double(I);
[m,n] = size(I);
EE = [1 1 1 1 1
      1 1 1 1 1
      1 1 1 1 1 
      1 1 1 1 1
      1 1 1 1 1];
[mf,nf] = size(EE);
M = zeros(m,n); %exceto linha y, coluna x
x= 700;
y = 60;
M(y, x) = I(y, x);
% defini��o do EE quadrado com dimens�o mf x mf

d1 = floor(mf/2);
d2 = ceil(mf/2);

maximo = 100 ;
it = 1;
while maximo > 1
    
    % Com S1 sendo o resultado da dilata��o, que � o marcador dilatado pelo EE.
    % Com R sendo o resultado da reconstru��o, que � a dilata��o geod�sica.
S1 = zeros(m,n);
R = zeros(m,n);
for i = d2:m-d1
for j = d2:n-d1
ind=1;
a = zeros(1,mf*mf);
for k = -d1:d1
for l = -d1:d1
a(1,ind) = M(i+k, j+l);
ind = ind+1;
end
end
S1(i,j) = max(a);
end
end
for i = 1:m
for j = 1:n
if abs( S1(i,j) - I(i,j) ) < 4 % z= 4 como crit�rio de toler�ncia.
R(i,j) = min(S1(i,j),I(i,j));
end
end
end

Dif = abs(M - R);
maximo = max(max(Dif));
M = R;
it = it +1;
end
figure 
imagesc(R)
axis equal
colormap(gray)
title('Resultado da reconstru��o')
figure
imagesc(S1)
axis equal
colormap(gray)
title('Resultado da dilata��o')
figure
imagesc(I)
axis equal
colormap(gray)
title('Imagem original')