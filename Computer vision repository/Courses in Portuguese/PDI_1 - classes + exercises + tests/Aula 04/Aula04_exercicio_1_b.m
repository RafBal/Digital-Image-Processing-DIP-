% b)
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

for i = 1:mh
    for j = 1:nh
        if H(i,j)>300 & S(i,j)>0.5

Saidanova(i,j) = 255;
        else
            Saidanova(i,j) = 0;
        end
    end
end

% Conversão double para uint8:
Saidanova = uint8(Saidanova);
imwrite(Saidanova,'Saidanova.tif')