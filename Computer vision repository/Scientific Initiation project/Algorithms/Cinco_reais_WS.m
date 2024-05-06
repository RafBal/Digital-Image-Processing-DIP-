% 2� etapa: segmenta��o
close all
clc
clear all

v0 = imread('5_reais_verso.jpg');
v0 = double(v0);
[m,n] = size(v0);


%EE = [1 0 1
 %     0 1 0
 %     1 1 1];

 EE = [1 1 1 1 1
       0 0 1 0 0
       0 0 1 0 0
       0 0 1 0 0
       1 1 1 1 1];

[me,ne] = size(EE);
d1 = ceil(me/2);
d2 = floor(ne/2);

% Calcular laplaciano morfol�gico (aplicando watershed):
% Delta = (v0 'dilata��o' E) - 2v0 + (v0 'eros�o' E)

dilv0 = v0;

% Dilata��o
for i = d1:m-d2
for j = d1:n-d2
a = zeros(1,me*ne);
ind = 1;
for k = -d2:d2
for l = -d2:d2
a(ind) = v0(i+k, j+l);
ind = ind+1;
end
end
dilv0(i,j) = max(a);
end
end

erov0 = v0;

% Eros�o
for i = d1:m-d2
for j = d1:n-d2
a = zeros(1,me*ne);
ind = 1;
for k = -d2:d2
for l = -d2:d2
a(ind) = v0(i+k, j+l);
ind = ind+1;
end
end
erov0(i,j) = min(a);
end
end
% 
 delta = dilv0 - 2*v0 + erov0;
 CB = delta; % Catchment basin (bacia de detec��o)
for i = 1:m
    for j = 1:n
        if delta(i,j) > 90
            CB(i,j) = 255;        
        else
            CB(i,j) = 0;
        end
    end
end
CBvermelho = CB(:,:,1);    % Cria��o de uma imagem bin�ria. Salvar depois.
% fazer eros�o condicional. 
% Trazer um arquivo com eros�o bin�ria para trabalhar em cima.
delta = uint8(delta); % Salva em 8 bits
CB = uint8(CB); % Salva em 8 bits
CBvermelho = uint8(CBvermelho);
imwrite(CBvermelho,'5reais WS.tif','compress','none')

CBvermelho = CBvermelho/255;
 CBfinal = CBvermelho(1:50,500:573);
 teste = CBfinal;
 [m,n] = size(CBfinal);
  for i = d1:m-d2
  for j = d1:n-d2
  if teste(i,j) == 1
  for k = -d2:d2
  for l = -d2:d2
  if EE(d1+k,d1+l)== 1
  CBfinal(i+k,j+l) = 1;
  end
  end
  end
  end
  end
  end
  EE2 = [1 0 0 0 1
         0 1 0 1 0
         0 0 1 0 0
         0 1 0 1 0
         1 0 0 0 1];
    % Eros�o
  CBfinal2 = zeros(m,n);
  for i = d1:m-d2
  for j = d1:n-d2
        ind = 0;
    for k = -d2:d2
    for l = -d2:d2
        if EE(d1+k,d1+l) == 1 & CBfinal(i+k,j+l) == 1
            ind = ind + 1;
        end
    end
    end
    if ind == 13;
        CBfinal2(i,j) = CBfinal(i,j);
    end
  end
  end
 
         [mv,nv] = size(CBfinal2);
         Negat = ones(mv,nv);
Negat = double(Negat);

Resultado = Negat - CBfinal2;



  
  CBfinal2 = uint8(CBfinal2);
figure
%imagesc(CBfinal2)
imagesc(Resultado)
colormap gray
figure
imagesc(CBfinal)
colormap gray
imwrite(CBfinal2,'cinco_reais_recriado.tif','compress','none')
% Resultados: daria para fazer um "negativo" da imagem (subtraindo uma
% matriz unit�ria de mesma dimens�o), mas ainda assim ficaria com muito
% ru�do.