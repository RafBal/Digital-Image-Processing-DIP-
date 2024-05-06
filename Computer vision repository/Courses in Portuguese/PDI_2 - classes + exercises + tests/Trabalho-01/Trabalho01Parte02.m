clc;
clear all;
I=imread('C3_ALTM.tif');

EE = [
1 1 1
1 1 1
1 1 1 
];
[m,n] = size(I);
[me,ne] = size(EE);
d2 = ceil(me/2);
d1 = floor(me/2);
% Fechamento
% Primeiro vem a dilatação e depois vem a erosão.
% Dilatação:
S1 = zeros(m,n);
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
               a(1,ind) = S1(i+k, j+l) - EE(d2+k,d2+l);
               ind = ind+1;
           end
        end
S2(i,j) = min(a); % Resultado final do fechamento.
    end
end

% Tampando os "buracos" do MDS:
for i = 1:m
    for j = 1:n
        if i > 1
            if j > 1
        if S2(i,j) == 0 || S2(i,j) == -1
            S2(i,j) = S2(i,j-1);
        end
            end
        end
    end
end
% Inicia-se o processo de erosão de gradiente para encontrar a borda;
% I logo após o fechamento - erosão(I logo após o fechamento)= S4
% Ou: S2 - S3, S3=Eros(S2)
S3 = zeros(m,n);
% Criando a erosão do S2:
for i = d2:m-d1
    for j = d2:n-d1
        a = zeros(1,me*me);
        ind = 1;
        for k = -d1:d1
           for l = -d1:d1
               a(1,ind) = S2(i+k, j+l) - EE(d2+k,d2+l);
               ind = ind+1;
           end
        end
S3(i,j) = min(a);
    end
end
S4= S2-S3;
% trocando de color
%=======================
% if S4(i,j) >= 2 o valor e 2 por que se considera o valor de alturas
% arvores de apro 2 metros


for i = 1:m
     for j = 1:n
         if S4(i,j) >= 2.5 % Considerando árvores de 2.5 metros para cima.
            S4(i,j) = 0;
         else
            S4(i,j) = 255;
         end
     end
end
subplot(1,2,1)
imagesc(S2)
colormap(gray)
title('MDS')
axis equal
S2 = uint8(S2);
imwrite(S2,'MDS.tif')

subplot(1,2,2)
imagesc(S4)
colormap(gray)
title('Traçado')
axis equal
   
S4 = uint8(S4);
imwrite(S4,'TRACADO.tif')

    