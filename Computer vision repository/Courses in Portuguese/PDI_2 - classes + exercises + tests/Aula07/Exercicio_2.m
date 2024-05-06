clc;
clear all;
% Reconstrução morfológica por erosão
% EE: elemento estruturante
% M : marcador
% I: Imagem (Mascara)
I = imread('mapa.tif' );
I = double(I);
[m,n] = size(I);
EE = [1 1 1 1 1
      1 1 1 1 1
      1 1 1 1 1 
      1 1 1 1 1
      1 1 1 1 1];
[mf,nf] = size(EE);
M = 255*ones(m,n); %exceto linha y, coluna x

% 1 representa a cor branca.
% 0 representa a cor preta.

x= 248;
y = 164;

M(y, x) = I(y, x);
% definição do EE quadrado com dimensão mf x mf
d1 = floor(mf/2);
d2 = ceil(mf/2);

maximo = 100 ;
it = 1;
while maximo > 1
    
   % R imagem de saída (erosão geodésica), S1 resultado da erosão (marcador erodido por EE)
S1 = 255*ones(m,n);
R = 255*ones(m,n);
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
S1(i,j) = min(a);
end
end
for i = 1:m
for j = 1:n
if abs( S1(i,j) - I(i,j) ) < 4 % z= 4 como critério de tolerância.
R(i,j) = max(S1(i,j),I(i,j));
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
title('Resultado da erosão')

