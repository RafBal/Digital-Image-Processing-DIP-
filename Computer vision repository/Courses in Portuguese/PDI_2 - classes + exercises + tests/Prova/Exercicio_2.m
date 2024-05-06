clc;
clear all;
% abefec = abertura + fechamento;
% Reduz regiões escuras reforça as regiões claras.
% 1º fechamento, 2º abertura
I = imread('CP_acima700m.tif');
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
        a = zeros(1,me*ne);
        ind = 1;
        for k = -d1:d1
            for l = -d1:d1
            a(1, ind) = S1(i+k, j+l) - EE(d2+k,d2+l);
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
        a = zeros (1,me*ne);
        ind = 1;
        for k = -d1:d1
            for l = -d1:d1
                a(1, ind) = S2(i+k, j+l) - EE(d2+k,d2+l);
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
subplot(1,2,1)
imagesc(I)
colormap(gray)

subplot(1,2,2)
 imagesc(S4)
 colormap(gray)



%         subplot(1,5,1)
% imagesc(I)
% axis equal
%   colormap(gray)
% subplot(1,5,2)
% imagesc(S1)
% axis equal
%   colormap(gray)
% subplot(1,5,3)
% imagesc(S2)
% axis equal
%   colormap(gray)
%   subplot(1,5,4)
% imagesc(S3)
% axis equal
%   colormap(gray)
% subplot(1,5,5)
% imagesc(S4)
% axis equal
%   colormap(gray)
% 
