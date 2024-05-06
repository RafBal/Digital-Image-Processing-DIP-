% 1ª etapa: filtragem

close all
clc
clear all

c = 20;     % c = c0

u1 = imread('5_reais_verso.jpg');
u1 = double(u1)*0.75;
gradx = u1;
grady = u1;
divergent = u1;
[m,n] = size(u1);

EE = [0 1 0
      1 1 1
      0 1 0];
S1 = u1;
S2 = u1;
S3 = S2;
[me,ne] = size(EE);
d2 = ceil(me/2);
d1 = floor(ne/2);

% Erosão
for i = d2:m-d1
for j = d2:n-d1
a = zeros(1,me*ne);
ind = 1;
for k = -d1:d1
for l = -d1:d1
a(ind) = u1(i+k, j+l);
ind = ind+1;
end
end
S1(i,j) = min(a);
end
end
imagem1 = S1;
imagem1 = uint8(imagem1); % Salva em 8 bits

% Dilatação
for i = d2:m-d1
for j = d2:n-d1
a = zeros(1,me*ne);
ind = 1;
for k = -d1:d1
for l = -d1:d1
a(ind) = S1(i+k, j+l);
ind = ind+1;
end
end
S2(i,j) = max(a);
end
end

imagem2 = S2;
imagem2 = uint8(imagem2); % Salva em 8 bits

u1 = S2;

for i = 1:1:m-1
    for j = 1:1:n-1
        % Construindo o gradiente:
        gradx(i,j) = u1(i+1,j) - u1(i,j);
        gradx(i,j) = gradx(i,j)*c;
        grady(i,j) = u1(i,j+1) - u1(i,j);
        grady(i,j) = grady(i,j)*c;
    end
end

for i = 1:1:m-1
    for j = 1:1:n-1
% Construindo o divergente:
        hx(i,j) = gradx(i+1,j) - gradx(i,j);
        hy(i,j) = grady(i,j+1) - grady(i,j);
        divergent(i,j) = hx(i,j) +hy(i,j);
    end
end

%v = -divergence(gradient(u1, [x, y]), [x, y]) + u;
v01 = u1 - divergent;

v01 = uint8(v01); % Salva em 8 bits
%v0 = rgb2gray(v0);
imwrite(v01,'cinco reais filtrado.tif','compress','none')

imagesc(v01)
axis equal
colormap gray