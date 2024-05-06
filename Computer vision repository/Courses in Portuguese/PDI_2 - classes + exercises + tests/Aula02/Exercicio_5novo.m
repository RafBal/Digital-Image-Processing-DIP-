clc; 
clear all;

I = imread('palavras.tif');
EE1 = imread('letra_a.tif');

I2 = 1 - I;
EE2 = 1 - EE1;
[me,ne] = size(EE1);
[m,n]= size(I);

  
  d1 = ceil(me/2);
  d2 = floor(me/2);
  d3 = ceil(ne/2);  
  d4 = floor(ne/2);
  
  % Erosão:
 ind = me*ne;
S1 = zeros(m,n);
for i = d1:m-d2
for j = d3:n-d4
cont=0;
for k = -d2:d2
for l = -d4:d4
if EE1(d1+k,d3+l) == I(i+k,j+l);
cont = cont+1;
end
end
end
if (cont/(ind)) >= 0.95
S1(i,j) = 1;
end
end
end
 
ind = me*ne;
for i = d1:m-d2
for j = d3:n-d4
cont=0;
for k = -d2:d2
for l = -d4:d4
if EE2(d1+k,d3+l) == I2(i+k,j+l);
cont = cont+1;
end
end
end
if (cont/(ind)) >= 0.95
S2(i,j) = 0;
end
end
end

% intersecção entre S1 e S2:
S = zeros(m,n);
for i = d1:m-d2
for j = d3:n-d4
if S1(i,j)== 1 & S2(i,j)== 0
S(i,j) = 1;
end
end
end
imagesc(S)
colormap(gray)
[i j] = find(S==max(max(S)))