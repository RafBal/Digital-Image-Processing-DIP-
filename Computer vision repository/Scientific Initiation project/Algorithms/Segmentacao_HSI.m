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

v0 = imread('semaforo andando.jpg');
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

for i = 1:m
    for j = 1:n
        % Analisar a saturação, intensidade para separar o fundo do objeto.
            if H(i,j)>= 110 & H(i,j)<190    % Região em que se encontra a cor verde e ciano.

        if I(i,j) >0.4  & I(i,j)< 0.7      % Valor descoberto empiricamente.

       % if S(i,j) >0.9
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
% Aplicando abertura: 1º erosão, 2º dilatação
% Aplicando erosão binária
EE = [1 0 0 0 1
      0 1 0 1 0
      0 0 1 0 0
      0 1 0 1 0
      1 0 0 0 1];
      [me,ne] = size(EE);
      
d1 = ceil(me/2);
d2 = floor(ne/2);
[ms,ns] = size(sfinal);

for i = d1:ms-d2
for j = d1:ns-d2
ind = 0;
for k = -d2:d2
for l = -d2:d2
if EE(d1+k,d1+l) == 1 & sfinal(i+k,j+l) == 255
ind = ind+1;
end
end
end
if ind >= 9
R1(i,j) = sfinal(i,j);
end
end
end

% Aplicando dilatação binária

R2 = zeros(ms,ns);
for i = d1:ms-d2
for j = d1:ns-d2
if R1(i,j) == 255
for k = -d2:d2
for l = -d2:d2
if EE(d1+k,d1+l)== 1
R2(i+k,j+l) = 255;
end
end
end
end
end
end
imwrite(R2,'segmento HSI 1.tif','compress','none')
imagesc(R2)
colormap gray

 
 