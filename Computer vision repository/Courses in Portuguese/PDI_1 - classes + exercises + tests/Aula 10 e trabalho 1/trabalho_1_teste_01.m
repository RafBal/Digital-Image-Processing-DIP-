close all
clc
clear all

E = imread('paisagem2.tif');
[m,n,k] = size(E);
E = double(E);

R = E(:,:,1)/255;
G = E(:,:,2)/255;
B = E(:,:,3)/255;

I = zeros(m,n);
H = I;
S = H;

for i = 1:m
    for j = 1:n
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
HSI(:,:,1) = H;
HSI(:,:,2) = S;
HSI(:,:,3) = I;

E = uint8(E);
% Imagem original
subplot(2,1,1)
imagesc(E)
colormap gray
axis equal
% Intensidade
subplot(2,1,2)
imagesc(I)
colormap gray
axis equal


ndmaxE = max(max(E));
ndminE = min(min(E));
ConstrastE = (ndmaxE-ndminE)%./(ndmaxE+ndminE)
ndmaxI = max(max(I));
ndminI = min(min(I));
ContrastI = (ndmaxI-ndminI)%./(ndmaxI+ndminI)
