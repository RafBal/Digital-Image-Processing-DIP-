clc;
clear all;

I = imread('RuasCentroPolitecnico.tif')
 I = double(I);
 EE = [1 1 1
       1 1 1
       1 1 1]
   
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
    if ind == 9
        S1(i,j) = I(i,j);
    end
  end
  end
  % Abertura(erosão anterior mais dilatação posterior)
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
 
 EE1 = [1 1 1 1 0 0 0 
        1 1 1 1 0 0 0
        0 0 1 1 0 0 0 
        0 0 1 1 1 1 1
        0 0 1 1 1 1 1]
    
    [me,ne] = size(EE1);
    d1 = ceil(me/2);
    d2 = floor(me/2);
    d3 = ceil(ne/2);  
  d4 = floor(ne/2);
    
    
  % Dilatação
  S3 = zeros(m,n);
  for i = d1:m-d2
  for j = d3:n-d4
  if S(i,j) == 1
  for k = -d2:d2
  for l = -d4:d4
  if EE1(d1+k,d3+l)== 1
  S3(i+k,j+l) = 1;
  end
  end
  end
  end
  end
  end
  % Fechamento (dilatação anterior mais erosão posterior)
  S4 = zeros(m,n);
  for i = d1:m-d2
  for j = d3:n-d4
        ind = 0;
    for k = -d2:d2
    for l = -d4:d4
        if EE1(d1+k,d3+l) == 1 & S3(i+k,j+l) == 1
            ind = ind + 1;
        end
    end
    end
    if ind == 16
        S4(i,j) = S3(i,j);
    end
  end
  end
 imagesc(S4)
colormap(gray)
 
    
  

  
  
        