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


Sai(:,:,1) = round(255*r(:,:));
Sai(:,:,2) = round(255*g(:,:));
Sai(:,:,3) = round(255*b(:,:));

% Conversão double para uint8:
Sai = uint8(Sai);
imwrite(Sai,'RodaDasCores.tif', 'compress','none')
imagesc(Sai)