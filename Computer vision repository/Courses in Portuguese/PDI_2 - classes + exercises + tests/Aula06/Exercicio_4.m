clc;
clear all;
I = imread('Setor_Cbiologicas.tif' );

I = double(I);
[m,n] = size(I);
S1 = zeros(m,n);
it = 1
me = 3;
d2 = ceil(me/2);
  d1 = floor(me/2);
while it < 3
    % Fechamento = dilatação + erosão;
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
     S1(i,j) = max(a);
  end
  end
  
% Erosão:
S2 = zeros(m,n);
for i = d2:m-d1
    for j = d2:n-d1
        a = zeros(1,me*me);
        ind = 1;
        for k = -d1:d1
            for l = -d1:d1
            a(1, ind) = S1(i+k, j+l); % Elimina-se o EE para não alterar altura.
            ind = ind+1;
        end
    end
    S2(i,j) = min(a);
end
end

% Abertura = erosão + dilatação;
% Erosão:
S3 = zeros(m,n);
for i = d2:m-d1
    for j = d2:n-d1
        a = zeros (1,me*me);
        ind = 1;
        for k = -d1:d1
            for l = -d1:d1
                a(1, ind) = S2(i+k, j+l);
                ind = ind+1;
            end
        end
        S3(i,j) = min(a);
    end
end

% Dilatação: 
S4 = zeros(m,n);
for i = d2:m-d1
    for j = d2:n-d1
        a = zeros(1,me*me);
        ind = 1;
        for k = -d1:d1
            for l = -d1:d1
            a(1, ind) = S3(i+k, j+l);
            ind = ind+1;
        end
    end
S4(i,j) = max(a);   
    end
end
it = it+1;
me = me+2;
end

imagesc(S4)
colormap(gray)