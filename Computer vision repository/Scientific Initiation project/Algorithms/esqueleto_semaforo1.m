close all
clc
clear all
% Testar diferentes EE e recalcular os MIA dos esqueletos.
I = imread('segmento HSI 1.tif');
  I = double(I)/255;
%  EE = [0 0 0 1 0 0 0 
%        0 0 1 1 1 0 0 
%        0 1 1 1 1 1 0 
%        1 1 1 1 1 1 1
%        0 1 1 1 1 1 0
%        0 0 1 1 1 0 0
%        0 0 0 1 0 0 0];
    EE = [0 0 0 0 1 0 0 0 0 
          0 0 0 0 1 0 0 0 0
          0 0 0 0 1 0 0 0 0
          0 0 0 0 1 0 0 0 0
          1 1 1 1 1 1 1 1 1
          0 0 0 0 1 0 0 0 0
          0 0 0 0 1 0 0 0 0
          0 0 0 0 1 0 0 0 0
          0 0 0 0 1 0 0 0 0];
 Ima = I;
 it = 1;
 
 [m,n] = size(I);
 
 % S: esqueleto
 S = zeros(m,n);
 
 [me,ne] = size(EE)
 
 d1 = ceil(me/2);
 d2 = floor(ne/2);
 maximoS1 = 10 % depende do objeto e do elemento estruturante.
 while maximoS1 > 0
  % Erosão
  S1 = zeros(m,n);
  for i = d1:m-d2
  for j = d1:n-d2
        ind = 0;
    for k = -d2:d2
    for l = -d2:d2
        if EE(d1+k,d1+l) == 1 & I(i+k,j+l) == 1
            ind = ind + 1;
        end
    end
    end
    if ind == 17;
        S1(i,j) = I(i,j);
    end
  end
  end
  % Abertura
  S2 = zeros(m,n);
  for i = d1:m-d2
  for j = d1:n-d2
  if S1(i,j) == 1
  for k = -d2:d2
  for l = -d2:d2
  if EE(d1+k,d1+l)== 1
  S2(i+k,j+l) = 1;
  end
  end
  end
  end
  end
  end
 Aux = I - S2;
 
 % esqueleto:
 S = S + Aux;
 I = S1;
 it = it + 1;
 maximoS1 = max(max(S1))
 end
 S = uint8(S);
 imwrite(S,'esqueleto do semaforo.tif','compress','none')
 imagesc(S)
colormap(gray)
 
    
  

  
  
        