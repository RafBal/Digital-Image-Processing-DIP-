clc;
clear all;
% abefecabe = abertura + (fechamento + abertura);
% 1º abertura, 2º fechamento, 3º abertura

I = imread('flamingos.tif');
EE = [1 1 1 
      1 1 1 
      1 1 1 ];
  [m,n] = size(I);
  [me,ne] = size(EE);
  d2 = ceil(me/2);
  d1 = floor(me/2);
  S1 = zeros(m,n);
  % Abertura = erosão + dilatação;
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
S2 = zeros(m,n);
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

% Fechamento = dilatação + erosão;
% Dilatação:
S3 = zeros(m,n);
for  i = d2:m-d1
  for  j = d2:n-d1
     a = zeros(1,me*me);
     ind = 1;
     for k = -d1:d1
              for l = -d1:d1
                  a(1,ind) =  S2(i+k, j+l) ;
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

% Abertura = erosão + dilatação;
  % Erosão:
  S5 = zeros(m,n);
for i = d2:m-d1
    for j = d2:n-d1
        a = zeros(1,me*ne);
        ind = 1;
        for k = -d1:d1
            for l = -d1:d1
            a(1, ind) = S4(i+k, j+l) - EE(d2+k,d2+l);
            ind = ind+1;
        end
    end
    S5(i,j) = min(a);
end
end

% Dilatação:
S6 = zeros(m,n);
for  i = d2:m-d1
  for  j = d2:n-d1
     a = zeros(1,me*me);
     ind = 1;
     for k = -d1:d1
              for l = -d1:d1
                  a(1,ind) =  S5(i+k, j+l) ;
                  ind = ind+1;
              end
     end
     S6(i,j) = max(a);
  end
end

% Efeito: Reduz regiões claras; reforça regiões escuras.
subplot(1,2,1)
imagesc(I)
axis equal
colormap(gray)
title('Imagem com chuvisco')
subplot(1,2,2)
imagesc(S6)
axis equal
colormap(gray)
title('Imagem corrigida')

