clc; 
clear all;

I = imread('segmento HSI 1.tif');
EE1 = imread('EE_oficial.tif');
I = double(I)/255;
EE1 = double(EE1)/255;
EE1 = EE1(:,:,1);

I2 = 1 - I;
EE2 = 1 - EE1;
[me,ne] = size(EE1);
[m,n]= size(I);
me = me-1;
ne = ne-1;
  
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
S = uint8(S);
imagesc(S)
colormap(gray)
[i j] = find(S==max(max(S)))