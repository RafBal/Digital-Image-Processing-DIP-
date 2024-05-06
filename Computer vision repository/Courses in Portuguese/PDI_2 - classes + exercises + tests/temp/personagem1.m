clc;
clear all;

I = imread('personagem.tif');
I = I/255;
[m,n]= size(I);

EE = [1 1 1 1 1   
      1 1 1 1 1
      1 1 1 1 1 
      1 1 1 1 1
      1 1 1 1 1];
[me,ne] = size(EE);


% para EE quadrado: me = ne
d1 = ceil(me/2);
d2 = floor(me/2);
d3 = ceil(ne/2);
d4 = floor(ne/2);

% S1=Erosao
S1 = zeros(m,n);

for i = d1:m-d2
for j = d3:n-d4
    ind = 1;
    for k = -d2:d2
    for l = -d4:d4
        if EE(d1+k,d3+l) ~= 0 
          a(ind) = EE(d1+k, d3+l);
          b(ind) = I(i+k, j+l);
          ind = ind+1;
        end %endif
    end
    end
    if a == b
      S1(i,j) = 1;
    end %endif
end
end

% S2=dilatacao
S2 = zeros(m,n);

for i = d1:m-d2
for j = d3:n-d4
  if I(i,j) == 1
    for k = -d2:d2
    for l = -d4:d4
        if EE(d1+k,d1+l)== 1
            S2(i+k,j+l) = 1;
        end %endif
    end
    end
  end %endif
end
end

%I = double(I);
S3 = I - S1;
S4 = S2 - I;

S5 = S3 | S4;

%=========================

subplot(2,3,1);
imagesc(I);
colormap(gray);
title('Imagem: I');

subplot(2,3,2);
imagesc(S1);
colormap(gray);
title('Erosão: S1');


subplot(2,3,3);
imagesc(S2);
colormap(gray);
title('Dilatação: S2');

subplot(2,3,4);
imagesc(S3);
colormap(gray);
title('Contorno Interno: S3=I-S1');

subplot(2,3,5);
imagesc(S4);
colormap(gray);
title('Contorno Externo: S4=S2-I');

subplot(2,3,6);
imagesc(S5);
colormap(gray);
title('Contorno Grosso: S5=S3|S4');
