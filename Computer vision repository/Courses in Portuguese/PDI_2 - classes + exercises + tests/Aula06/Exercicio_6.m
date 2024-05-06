clc;
clear all;


I = imread('Mapa.tif');
[m,n] = size(I);
S1 = zeros(m,n); % resultado da erosão
S2 = S1;    % resultado da dilatação
G = zeros(m,n);
EE = [0 1 0 
      1 1 1 
      0 1 0];
    [me,ne] = size(EE);
d2 = ceil(me/2);
  d1 = floor(me/2);

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
                  a(1,ind) =  I(i+k, j+l) ;
                  ind = ind+1;
              end
     end
     S2(i,j) = max(a);
  end
end

for i = d1:m-d2
    for j = d1:n-d2
        if(I(i,j) - S1(i,j)) < (S2(i,j) - I(i,j))
            G(i,j) = S1(i,j);
        else
            G(i,j) = S2(i,j);
        end
    end
end
imagesc(G)  % Realça as partes claras e escuras da imagem I.
colormap(gray)

