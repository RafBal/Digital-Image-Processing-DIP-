% 2ª etapa: segmentação

% Separar cores verde/ciano e delimitar como 1 (branco) as formas que tem
% essas cores e como preto as formas que não as tem. Verificar tanto matiz
% quanto intensidade.

%A partir disso, formo uma imagem binária e aplico junto ao elemento
%estruturante o momento afim para comparar os valores de momento.

% Esqueletização pode ser uma aplicação; com a imagem binária, poderia
% comparar o esqueleto do elemento estruturante com o do objeto da imagem.

close all
clc
clear all

v0 = imread('100_reais_verso.jpg');
[m,n,k] = size(v0);
% conversão uint8 para double
v0 = double(v0);

R1 = v0(:,:,1)/255;
G = v0(:,:,2)/255;
B = v0(:,:,3)/255;
I = zeros(m,n);
H = zeros(m,n);
S = zeros(m,n);


for i = 1:m
    for j = 1:n
if (R1(i,j) == G(i,j)) & (R1(i,j) == B(i,j))
S(i,j) = 0;
else
    
    % intensidade
I(i,j) = ( R1(i,j) + G(i,j) + B(i,j)) / 3;

    % saturação
a = min([ R1(i,j) G(i,j) B(i,j) ] );
S(i,j) = 1 - (3 * a) / ( R1(i,j)+ G(i,j) + B(i,j) ) ;

    % matiz
num = ( R1(i,j) - G(i,j) ) + (R1(i,j) - B(i,j) ) ;
den = 2 * sqrt ( ( R1(i,j) - G(i,j) )^2 + (R1(i,j) - B(i,j)) * (G(i,j) - B(i,j) ) );
theta = acosd(num/den); % acosd serve para obter ângulo em graus.
% pode ser também: theta = (theta*360)/(2*pi)

if B(i,j) <= G(i,j)
H(i,j) = theta;
elseif B(i,j) > G(i,j)
H(i,j) = 360 - theta ;
end
end
    end
end

HSI(:,:,1) = H;
HSI(:,:,2) = S;
HSI(:,:,3) = I;
sfinal = H;

% Aplicando fechamento:  1º dilatação, 2º erosão,
EE = [1 0 0 0 1
      0 1 0 1 0
      0 0 1 0 0
      0 1 0 1 0
      1 0 0 0 1];
      [me,ne] = size(EE);
      
d2 = ceil(me/2);
d1 = floor(ne/2);
[ms,ns] = size(sfinal);
I1 = I;
I2 = I;
% Dilatação
for i = d2:m-d1
for j = d2:n-d1
a = zeros(1,me*ne);
ind = 1;
for k = -d1:d1
for l = -d1:d1
a(ind) = I(i+k, j+l);
ind = ind+1;
end
end
I1(i,j) = max(a);
end
end

% Erosão
for i = d2:m-d1
for j = d2:n-d1
a = zeros(1,me*ne);
ind = 1;
for k = -d1:d1
for l = -d1:d1
a(ind) = I1(i+k, j+l);
ind = ind+1;
end
end
I2(i,j) = min(a);
end
end


for i = 1:m
    for j = 1:n
        % Analisar a saturação, intensidade para separar o fundo do objeto.
            %if H(i,j)>= 110 & H(i,j)<190    % Região em que se encontra a cor verde e ciano.

        if I2(i,j) >= 0.90      % Valor descoberto empiricamente.

        if S(i,j) <= 0.67
        sfinal(i,j) = 255;        % Destaque em branco.
        %end
    end
else
    
    sfinal(i,j) = 0; 
end
        
    end
end

for i = 1:m
    for j = 1:n
        if sfinal(i,j) ~= 255
            sfinal(i,j) = 0;
        end
    end
end
teste = sfinal;
imwrite(sfinal,'segmento cem reais.tif','compress','none')
imagesc(teste)
colormap gray

 
 