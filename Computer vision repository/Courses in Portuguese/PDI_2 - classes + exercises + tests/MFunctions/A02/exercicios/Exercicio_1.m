clc;
clear all;
% Abertura: 1º erosão, 2º dilatação
I = imread('bin05.tif');
     I = I/255;
EE = [1 1 1 1 1   
      1 1 1 1 1
      1 1 1 1 1 
      1 1 1 1 1
      1 1 1 1 1];
      
      [me,ne] = size(EE);
[m,n]= size(I);
% para EE quadrado: me = ne
d1 = ceil(me/2);
d2 = floor(ne/2);
d3 = ceil(ne/2);
d4 = floor(ne/2);

S1 = zeros(m,n);
for i = d1:m-d2
for j = d3:n-d4
ind = 1;
for k = -d2:d2
for l = -d4:d4
    % Erosão 
if EE(d1+k,d3+l) ~= 0 
    a(ind) = EE(d1+k, d3+l);
    b(ind) = I(i+k, j+l);
    ind = ind+1;
end
end
end
if a == b
S1(i,j) = 1;
end
end
end
S2 = zeros(m,n);
for i = d1:m-d2
for j = d3:n-d4
if S1(i,j) == 1
for k = -d2:d2
for l = -d4:d4
    % Dilatação
if EE(d1+k,d1+l)== 1
S2(i+k,j+l) = 1;
end
end
end
end
end
end

imagesc(S2)
colormap(gray)