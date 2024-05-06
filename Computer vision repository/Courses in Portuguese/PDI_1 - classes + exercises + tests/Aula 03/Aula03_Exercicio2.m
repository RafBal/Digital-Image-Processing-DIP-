clc
clear all

E = imread('lapisdecor.tif');
[m,n,k] = size(E);
% convers�o uint8 para double
E = double(E);

R = E(:,:,1)/255;
G = E(:,:,2)/255;
B = E(:,:,3)/255;
I = zeros(m,n);
H = zeros(m,n);
S = zeros(m,n);

for i = 1:m
    for j = 1:n
if (R(i,j) == G(i,j)) & (R(i,j) == B(i,j))
S(i,j) = 0;
else
    
    % intensidade
I(i,j) = ( R(i,j) + G(i,j) + B(i,j)) / 3;

    % satura��o
a = min([ R(i,j) G(i,j) B(i,j) ] );
S(i,j) = 1 - (3 * a) / ( R(i,j)+ G(i,j) + B(i,j) ) ;

    % matiz
num = ( R(i,j) - G(i,j) ) + (R(i,j) - B(i,j) ) ;
den = 2 * sqrt ( ( R(i,j) - G(i,j) )^2 + (R(i,j) - B(i,j)) * (G(i,j) - B(i,j) ) );
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

HSI2(:,:,1) = H;
HSI2(:,:,2) = S;
HSI2(:,:,3) = I;

subplot(2,1,1)
imagesc(H)      % Matiz
colormap gray
subplot(2,1,2)
imagesc(S)
colormap gray

% a) Nem todas as cores s�o saturadas (as menos saturadas s�o as cores perto da cor magenta).
% b) Sim, do mais escuro (vermelho, 0�) at� o mais claro (magenta, ~300� at� 359�)
