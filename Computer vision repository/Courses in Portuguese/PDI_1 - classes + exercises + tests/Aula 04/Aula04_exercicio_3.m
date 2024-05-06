close all
clc
clear all

Ieq = imread('RodaDasCores.tif');

[m,n] = size(Ieq);

% Converter Ieq para o intervalo [0,1]
Ieq = double(Ieq);

I = zeros(500,500);
H = I;
S = I;
R = Ieq(:,:,1)/255;
G = Ieq(:,:,2)/255;
B = Ieq(:,:,3)/255;
% RGB -> HSI
for i = 1:m
    for j = 1:500
if (R(i,j) == G(i,j)) & (R(i,j) == B(i,j))
S(i,j) = 0;
else
    
    % intensidade
I(i,j) = ( R(i,j) + G(i,j) + B(i,j)) / 3;

    % saturação
a = min([ R(i,j) G(i,j) B(i,j) ] );
S(i,j) = 1 - (3 * a) / ( R(i,j)+ G(i,j) + B(i,j) ) ;

    % matiz
num = ( R(i,j) - G(i,j) ) + (R(i,j) - B(i,j) ) ;
den = 2 * sqrt ( ( R(i,j) - G(i,j) )^2 + (R(i,j) - B(i,j)) * (G(i,j) - B(i,j) ) );
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
H = H/360;
H = H*255;
S = 255*S;
I = 255*I;
saida(:,:,1) = H;
saida(:,:,2) = S;
saida(:,:,3) = I;

saida = uint8(saida);    
   
imwrite(saida,'RodaDasCoresHSI.tif','compress','none')
imagesc(saida)
