clc;
clear all;

I =imread('teclado.tif');
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
S1grad = I - S1;
%imagesc(S1grad)
%colormap gray

% Dilatação
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
S2(i,j) = max(a);
end
end
S2grad = I - S2;

subplot(1,2,1);
imagesc(S1grad)
colormap gray
title('Gradiente por erosão')
subplot(1,2,2);
imagesc(S2grad)
colormap gray
title('Gradiente por dilatação')

%Imagesc(S2grad)
%colormap gray


