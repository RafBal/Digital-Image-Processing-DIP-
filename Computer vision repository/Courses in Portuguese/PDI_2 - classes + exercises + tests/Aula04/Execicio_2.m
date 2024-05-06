clc;
clear all;
% Abertura.
I = imread('Bacacheri.tif');
I = double(I);
EE = [0 1 0
      1 1 1
      0 1 0];
S1 = I;
S2 = I;
[m,n] = size(I);
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
a(ind) = I(i+k, j+l);
ind = ind+1;
end
end
S1(i,j) = min(a);
end
end


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

imagesc(S2)
colormap(gray)
% Assim os detalhes em branco são retirados.