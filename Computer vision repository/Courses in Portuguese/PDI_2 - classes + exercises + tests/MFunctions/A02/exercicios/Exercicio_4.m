clc;
clear all;

I = imread('hieroglifos5.tif');
EE1 = imread('alvo1.tif');

% complementos
I2 = 1 - I;
EE2 = 1 - EE1;
[me,ne] = size(EE1);
[m,n]= size(I);

d2 = floor(me/2);
d1 = ceil(me/2);
d4 = floor(ne/2);
d3 = ceil(ne/2);
S1 = zeros(m,n);

S1 = zeros(m,n);
for i = d1:m-d2
for j = d3:n-d4
ind = 1;
for k = -d2:d2
for l = -d4:d4
    % Eroso
if EE1(d1+k,d3+l) ~= 0
a(ind) = EE1(d1+k,d3+l);
b(ind) = I(i+k,j+l);
ind = ind+1;
end
end
end
if a == b
S1(i,j) = 1;
end
clear a;
clear b;
end
end

S2 = ones(m,n); % imagem de sada
for i = d1:m-d2
for j = d3:n-d4
ind = 1;
for k = -d2:d2
for l = -d4:d4
    % Eroso
if EE2(d1+k,d3+l) ~= 0
a(ind) = EE2(d1+k,d3+l);
b(ind) = I2(i+k,j+l);
ind = ind+1;
end
end
end
if a == b
S2(i,j) = 0;
end
clear a;
clear b;
end
end
% interseco entre S1 e S2:
S = zeros(m,n);
for i = d1:m-d2
for j = d3:n-d4
if S1(i,j)== 1 & S2(i,j)== 0
S(i,j) = 1;
end
end
end
[i j ] = find(S == max(max(S)))
imagesc(S)
colormap(gray)