clc;
clear all;
% Para obter o contorno externo: 
% Aplica-se o fechamento: 1� dilata��o e 2� eros�o.

 I = imread('placa3.tif');
I = double(I);
I = I/255; % Deixar  a imagem bin�ria.
     
EE = [1 0 1
      0 1 0
      1 0 1]
      
      [me,ne] = size(EE)
[m,n]= size(I);
% para EE quadrado: me = ne
d1 = ceil(me/2);
d2 = floor(ne/2);

S = zeros(m,n);
for i = d1:m-d2
for j = d1:n-d2
if I(i,j) == 1
for k = -d2:d2
for l = -d2:d2
if EE(d1+k,d1+l)== 1
S(i+k,j+l) = 1;
end
end
end
end
end
end
 Externo = S - I;

imagesc(Externo)
colormap(gray)