clc;
clear all;
% Reconstrução morfológica por dilatação
% EE: elemento estruturante
% M : marcador
% I: Imagem (Mascara)
I = imread('imagem24.tif' );
I = double(I);
[m,n] = size(I);
EE = [1 1 1 1 1
      1 1 1 1 1
      1 1 1 1 1 
      1 1 1 1 1
      1 1 1 1 1];
[mf,nf] = size(EE);

A = zeros(m,n); %exceto linha y, coluna x
x= 319;
y = 79;
A(y, x) = I(y, x);

B = zeros(m,n); % linha z, coluna w
w = 294;
z = 104;
B(z, w) = I(z, w);

% definição do EE quadrado com dimensão mf x mf

d1 = floor(mf/2);
d2 = ceil(mf/2);

maximo = 100 ;
it = 1;
while maximo > 1
    
    % Com S1 sendo o resultado da dilatação, que é o marcador dilatado pelo EE.
    % Com R sendo o resultado da reconstrução, que é a dilatação geodésica.
S1 = zeros(m,n);
R1 = zeros(m,n);
for i = d2:m-d1
for j = d2:n-d1
ind=1;
a = zeros(1,mf*mf);
for k = -d1:d1
for l = -d1:d1
a(1,ind) = A(i+k, j+l);
ind = ind+1;
end
end
S1(i,j) = max(a);
end
end
for i = 1:m
for j = 1:n
if abs( S1(i,j) - I(i,j) ) < 21 % z= 4 como critério de tolerância.
R1(i,j) = min(S1(i,j),I(i,j));
end
end
end

Dif = abs(A - R1);
maximo = max(max(Dif));
A = R1;
it = it +1;
end
% imagesc(R1)
% colormap(gray)
% title('Resultado da reconstrução')
Partedecima = S1;

maximo = 100 ;
it = 1;
while maximo > 1
    
S2 = zeros(m,n);
R2 = zeros(m,n);
for i = d2:m-d1
for j = d2:n-d1
ind=1;
b = zeros(1,mf*mf);
for k = -d1:d1
for l = -d1:d1
b(1,ind) = B(i+k, j+l);
ind = ind+1;
end
end
S2(i,j) = max(b);
end
end
for i = 1:m
for j = 1:n
if abs( S2(i,j) - I(i,j) ) < 21 % z= 4 como critério de tolerância.
R2(i,j) = min(S2(i,j),I(i,j));
end
end
end

Dif = abs(B - R2);
maximo = max(max(Dif));
B = R2;
it = it +1;
end
% imagesc(R2)
% colormap(gray)
% title('Resultado da reconstrução')
Partedebaixo = S2;
%Total = Partedecima+Partedebaixo;
Total = R1+R2;
Total = uint8(Total);
imwrite(Total,'placa24isolada.tif','compress','none')

imagesc(Total)
colormap(gray)

