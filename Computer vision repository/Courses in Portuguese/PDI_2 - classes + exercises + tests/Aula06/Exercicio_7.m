clc;
clear all;


I = imread('paisagem.tif');
I = double(I);
[m,n] = size(I);
S1 = zeros(m,n); 
S2 = S1;    
S3 = S2;
G = zeros(m,n);
EE = [0 1 0 
      1 1 1 
      0 1 0];
    [me,ne] = size(EE);
d2 = ceil(me/2);
  d1 = floor(me/2);
% Top hat de abertura:
% Erosão:
for i = d2:m-d1
    for j = d2:n-d1
        a = zeros(1,me*ne);
        ind = 1;
        for k = -d1:d1
            for l = -d1:d1
            a(1, ind) = I(i+k, j+l) - EE(d2+k,d2+l);
            ind = ind+1;
        end
    end
    S1(i,j) = min(a);
end
end

% Dilatação:
for  i = d2:m-d1
  for  j = d2:n-d1
     a = zeros(1,me*me);
     ind = 1;
     for k = -d1:d1
              for l = -d1:d1
                  a(1,ind) =  S1(i+k, j+l) ;
                  ind = ind+1;
              end
     end
     S2(i,j) = max(a);
  end
end
Cartola = I - S2;

% Top hat de fechamento ou botton hat: 
% Dilatação:
  for  i = d2:m-d1
  for  j = d2:n-d1
     a = zeros(1,me*me);
     ind = 1;
     for k = -d1:d1
              for l = -d1:d1
                  a(1,ind) =  I(i+k, j+l) ;
                  ind = ind+1;
              end
     end
     S3(i,j) = max(a);
  end
  end
  
% Erosão:
S4 = zeros(m,n);
for i = d2:m-d1
    for j = d2:n-d1
        a = zeros(1,me*ne);
        ind = 1;
        for k = -d1:d1
            for l = -d1:d1
            a(1, ind) = S3(i+k, j+l) - EE(d2+k,d2+l);
            ind = ind+1;
        end
    end
    S4(i,j) = min(a);
end
end
Descartola = S4 - I;
G = I + Cartola - Descartola;
subplot(1,2,1)
imagesc(G)  % Realça os detalhes.
title('Imagem realçada')
colormap(gray)
subplot(1,2,2)
imagesc(I)
title('imagem original')
colormap(gray)

% conversão da imagem g para inteiro de 8 bits:
minimo = min(min(G));
maximo = max(max(G));
if minimo < 0
G = G+abs(minimo);
end
p = round(G/2);
p = uint8(p);   
imwrite(p,'paisagem_realce8bits.tif','compress','none')
