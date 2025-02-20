% 2� etapa: segmenta��o

close all
clc
clear all

v0 = imread('2_reais_back.jpg');
[m,n,k] = size(v0);
% convers�o uint8 para double
v0 = double(v0);

R1 = v0(:,:,1)/255;
G = v0(:,:,2)/255;
B = v0(:,:,3)/255;
I = zeros(m,n);
H = zeros(m,n);
S = zeros(m,n);
ImagemRGB= v0;

for i = 1:m
    for j = 1:n
        
        if R1(i,j) >= 10 && R1(i,j) <= 30;
            if G(i,j) >= 30 && G(i,j) <= 45;
                if B(i,j) >= 65 && B(i,j) <= 80;
                ImagemRGB(i,j) = 255;
                
                end
            end
        else
            ImagemRGB(i,j) = 0;
        end
    end
end
for i = 1:m
    for j = 1:n
        if ImagemRGB(i,j) ~= 255
            ImagemRGB(i,j) = 0;
        end
    end
end

for i = 1:m
    for j = 1:n
if (R1(i,j) == G(i,j)) & (R1(i,j) == B(i,j))
S(i,j) = 0;
else
    
    % intensidade
I(i,j) = ( R1(i,j) + G(i,j) + B(i,j)) / 3;

    % satura��o
a = min([ R1(i,j) G(i,j) B(i,j) ] );
S(i,j) = 1 - (3 * a) / ( R1(i,j)+ G(i,j) + B(i,j) ) ;

    % matiz
num = ( R1(i,j) - G(i,j) ) + (R1(i,j) - B(i,j) ) ;
den = 2 * sqrt ( ( R1(i,j) - G(i,j) )^2 + (R1(i,j) - B(i,j)) * (G(i,j) - B(i,j) ) );
theta = acosd(num/den); % acosd serve para obter �ngulo em graus.
% pode ser tamb�m: theta = (theta*360)/(2*pi)

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

% Aplicando fechamento:  1� dilata��o, 2� eros�o,
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
% Dilata��o
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

% Eros�o
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
        % Analisar a satura��o, intensidade para separar o fundo do objeto.
            %if H(i,j)>= 110 & H(i,j)<190    % Regi�o em que se encontra a cor verde e ciano.

        if I2(i,j) >= 0.03      % Valor descoberto empiricamente.

        if S(i,j) >= 0.3
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
imwrite(sfinal,'segmento dois reais.tif','compress','none')
%imagesc(teste)
colormap gray
imagesc(sfinal)
 colormap gray
 