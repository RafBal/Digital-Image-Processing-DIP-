close all
clc
clear all

H = imread('H.tif');
[mh,nh,kh] = size(H)

I = imread('I.tif');
S = imread('S.tif');

% conversão uint8 para double: 
H = double(H);
I = double(I);
S = double(S);

H = H/255;
H = H*360;
I = I/255;
S = S/255;

% Alocando espaço:
r = zeros(mh,nh);
g = zeros(mh,nh);
b = zeros(mh,nh);

for i = 1:mh
    for j = 1:nh
        if S(i,j)==0
            b(i,j) = I(i,j);
            g(i,j) = I(i,j);
            r(i,j) = I(i,j);
        else
            if H(i,j) >= 0 & H(i,j) <= 120
                b(i,j) = I(i,j)*(1-S(i,j));
                r(i,j) = I(i,j)*(1 + (S(i,j)*cosd(H(i,j))/cosd(60-H(i,j))));
                g(i,j) = 3*I(i,j) - (b(i,j)+r(i,j));
            end
            if H(i,j) > 120 & H(i,j)<=240
                H(i,j) = H(i,j)-120;
                r(i,j) = I(i,j)*(1-S(i,j));
                g(i,j) = I(i,j)*(1+(S(i,j)*cosd(H(i,j))/cosd(60-H(i,j))));
                b(i,j) = 3*I(i,j) - (r(i,j)+g(i,j));
            end
            if H(i,j) >240 & H(i,j)<=360
                H(i,j) = H(i,j)-240;
                g(i,j) = I(i,j)*(1-S(i,j));
                b(i,j) = I(i,j)*(1+(S(i,j)*cosd(H(i,j))/cosd(60-H(i,j))));
                r(i,j) = 3*I(i,j)-(g(i,j)+ b(i,j));
            end
        end
    end
end

%H = H/360;
R = r*255;
G = g*255;
B = b*255;

Saida(:,:,1) = R;
Saida(:,:,2) = G;
Saida(:,:,3) = B;

% Conversão double para uint8:
Saida = uint8(Saida);
imwrite(Saida,'Saida.tif')
% a) Há ocorrência da cor vermelha na imagem H, pois ela engloba cores
% tanto de 0º quanto de 360º, onde se encontra a cor vermelha.

