% Segmentação do elemento estruturante (2)
% Aplicar filtro da moda
close all
clc
clear all

v0 = imread('pedestre 2 filtrado.tif');
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
% Aplicando abertura: 1º erosão, 2º dilatação

EE = [0 1 0  
      1 1 1 
      0 1 0 ];
      [me,ne] = size(EE);
      
d1 = ceil(me/2);
d2 = floor(ne/2);
[ms,ns] = size(sfinal);

% Aplicando dilatação binária

R2 = zeros(ms,ns);
for i = d1:ms-d2
for j = d1:ns-d2
if sfinal(i,j) == 255
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
% Filtro da moda

nclasses = 2;   % número de classes
df = 3;  % tamanho do filtro
d1 = floor(df/2);       % Para df = 3, d1 = 1.
d2 = ceil(df/2);        % Para df = 3, d2 = 2.
S2 = zeros(m,n);

for i = d2:m-d1
    for j = d2:n-d1
% para cada posição do filtro efetuar contagem em vetor:
vetor = zeros(nclasses,1);

        for k = -d1:d1
           for l = -d1:d1
               valor = R2(i+k, j+l)/255; 
               vetor(valor+1,1) =  vetor(valor+1,1)+1; 
           end
        end
    
        % encontrar a posição do maior valor 
        posicao = find(vetor == max(vetor));
        S2(i,j) = posicao(1,1)-1;    
    end
end

% Erosão
EEA = [0 1 0
       1 1 1
       0 1 0];
   
[me,ne] = size(EEA)
 
 d1 = ceil(me/2);
 d2 = floor(ne/2);
 
  S3 = zeros(m,n);
  for i = d1:m-d2
  for j = d1:n-d2
        ind = 0;
    for k = -d2:d2
    for l = -d2:d2
        if EEA(d1+k,d1+l) == 1 & S2(i+k,j+l) == 1
            ind = ind + 1;
        end
    end
    end
    if ind == 5;
        S3(i,j) = S2(i,j);
    end
  end
  end

S3 = uint8(S3);
imwrite(S3,'EE2 segmentado.tif','compress','none')
 imagesc(S3)
 colormap gray
 axis equal
 
 