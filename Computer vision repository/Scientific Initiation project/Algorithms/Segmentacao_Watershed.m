% 2ª etapa: segmentação
close all
clc
clear all

v0 = imread('imagem filtrada.tif');
v0 = double(v0);
[m,n] = size(v0);


EE = [0 1 0
      1 1 1
      0 1 0];

[me,ne] = size(EE);
d1 = ceil(me/2);
d2 = floor(ne/2);

% Calcular laplaciano morfológico (aplicando watershed):
% Delta = (v0 'dilatação' E) - 2v0 + (v0 'erosão' E)

dilv0 = v0;

% Dilatação
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

% Erosão
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
 CB = delta; % Catchment basin (bacia de detecção)
for i = 1:m
    for j = 1:n
        if delta(i,j) > 253
            CB(i,j) = 255;        
        else
            CB(i,j) = 0;
        end
    end
end
CBverde = CB(:,:,2);    % Criação de uma imagem binária. Salvar depois.
% fazer erosão condicional. 
% Trazer um arquivo com erosão binária para trabalhar em cima.
delta = uint8(delta); % Salva em 8 bits
CB = uint8(CB); % Salva em 8 bits
CBverde = uint8(CBverde);
imwrite(CBverde,'imagem segmentada.tif','compress','none')

% Aplicando erosão binária

d1 = ceil(me/2);
d2 = floor(ne/2);
[mv,nv] = size(CBverde);

for i = d1:mv-d2
for j = d1:nv-d2
ind = 0;
for k = -d2:d2
for l = -d2:d2
if EE(d1+k,d1+l) == 1 & CBverde(i+k,j+l) == 255
ind = ind+1;
end
end
end
if ind >= 3
S1(i,j) = CBverde(i,j);
end
end
end
[mv,nv] = size(S1);
Negat = ones(mv,nv);
Negat = Negat*255;
Negat = double(Negat);
S1 = double(S1);
Resultado = Negat - S1;
imagesc(Resultado)
colormap(gray)

% imagesc(CBverde)
% colormap gray


% Resultados: daria para fazer um "negativo" da imagem (subtraindo uma
% matriz unitária de mesma dimensão), mas ainda assim ficaria com muito
% ruído.