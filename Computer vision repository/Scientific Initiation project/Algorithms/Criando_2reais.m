close all
clc
clear all

CBfinal2 = imread('dois_reais_recriado.tif');
CBfinal2 = double(CBfinal2);
[m,n] = size(CBfinal2);
teste = CBfinal2;

    for j = 1:n
for i = 1:m
        if CBfinal2(i,j) == 1
            je = j;
        end
    end
    end
chave = 1;
  
        for i = 2:m
      for j = 2:je
%if chave == 1
          if CBfinal2(i,j-1) == 1 & CBfinal2(i,j) == 0 & chave == 1
               if CBfinal2(i,j) == 0 & chave == 1
        
               if CBfinal2(i,j) == 0 & CBfinal2(i,j+1) ==1
                   chave = 0;
               end
               CBfinal2(i,j) = 1;       
               
               end
          end
%end

      
      end
  chave = 1;
        end
        EE = [0 1 0  
              1 1 1 
              0 1 0 ];
                    [me,ne] = size(EE);
it = 1;
teste = CBfinal2;
          d1 = ceil(me/2); 
          d2 = floor(ne/2); 
  S = zeros(m,n);
  maximoS1 = 10 % depende do objeto e do elemento estruturante.
 while maximoS1 > 0
  % Erosão
  S1 = zeros(m,n);
  for i = d1:m-d2
  for j = d1:n-d2
        ind = 0;
    for k = -d2:d2
    for l = -d2:d2
        if EE(d1+k,d1+l) == 1 & CBfinal2(i+k,j+l) == 1
            ind = ind + 1;
        end
    end
    end
    if ind == 5
        S1(i,j) = CBfinal2(i,j);
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
 Aux = CBfinal2 - S2;
 
 % esqueleto:
 S = S + Aux;
 CBfinal2 = S1;
 it = it + 1;
 maximoS1 = max(max(S1))
 end

  
  figure
imagesc(CBfinal2)
colormap gray
figure 
imagesc(S)
colormap gray
