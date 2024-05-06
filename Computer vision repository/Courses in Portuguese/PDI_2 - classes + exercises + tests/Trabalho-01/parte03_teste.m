clc;
clear all;
% Reconstrução morfológica por dilatação
% EE: elemento estruturante
% M : marcador
% I: Imagem (Mascara)
I = imread('C3_ALTM.tif');
I = double(I);
[m,n] = size(I);
EE = [1 1 1 1 1
      1 1 1 1 1
      1 1 1 1 1 
      1 1 1 1 1
      1 1 1 1 1];
[mf,nf] = size(EE);
M = zeros(m,n); %exceto linha y, coluna x
x= 340;
y = 50;
M(y, x) = I(y, x);
% definição do EE quadrado com dimensão mf x mf

d1 = floor(mf/2);
d2 = ceil(mf/2);

maximo = 100 ;
it = 1;
while maximo > 1
    
    % Com S1 sendo o resultado da dilatação, que é o marcador dilatado pelo EE.
    % Com R sendo o resultado da reconstrução, que é a dilatação geodésica.
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
if abs( S1(i,j) - I(i,j) ) < 2 % z = 2 como critério de tolerância.
R(i,j) = min(S1(i,j),I(i,j));
end
end
end

Dif = abs(M - R);
maximo = max(max(Dif));
M = R;
it = it +1;
end
subplot(1,2,1)
imagesc(R)
colormap(gray)
title('Resultado da reconstrução')
subplot(1,2,2)
imagesc(S1)
colormap(gray)
title('Resultado da dilatação')