clc;
clear all;
% fecabe = fechamento + abertura;
% Reduz regiões claras, reforça as regiões escuras.
% 1º abertura, 2º fechamento

I = imread('teclado.tif');
EE = [0 0 1 0 0
      0 0 1 0 0
      1 1 1 1 1
      0 0 1 0 0
      0 0 1 0 0];
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
imagesc(S4)
colormap(gray)
