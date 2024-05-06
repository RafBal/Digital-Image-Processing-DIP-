clc;
clear all;
% Para obter o contorno interno: 
% Aplica-se o fechamento: 1º erosão e 2ºdilatação .

I = imread('personagem.tif');
I = double(I);
I = I/255;
EE = [0 1 0   
      1 1 1 
      0 1 0 ];
  
  [me,ne] = size(EE);
  [m,n] = size(I);
  
  d1 = ceil(me/2);
  d2 = floor(me/2);
  d3 = ceil(ne/2);  
  d4 = floor(ne/2);
  % Erosão:
 S1 = zeros(m,n);
 for i = d1:m-d2;
 for j = d3:n-d4;
     ind = 1;
 for k = -d2:d2;
 for l = -d4:d4;
 if EE(d1+k,d3+l) ~= 0
     a(ind) = EE(d1+k,d3+l);
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
 
  Interno = I-S1;
  
 imagesc(Interno)
 colormap(gray);
 
      