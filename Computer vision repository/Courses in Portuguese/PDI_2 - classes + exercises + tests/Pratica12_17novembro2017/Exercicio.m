clear all
clc
NDVI = imread('ndvi.tif');
MDS = imread('MDSn_metros.tif');
[m,n] = size(MDS)
Classe = zeros(m,n);

% 1 = gramado
% 2 = arvore
% 3 = solo, asfalto
% 4 = telhado

for i = 1: m
    for j = 1:n
        if MDS(i,j)<2 & NDVI(i,j)>90
            Classe(i,j) = 1;
        elseif MDS(i,j)>2 & NDVI(i,j)>90
            Classe(i,j) = 2;
        elseif MDS(i,j)<2 & NDVI(i,j)<90
            Classe(i,j) = 3;
        elseif MDS(i,j)>2 & NDVI(i,j)<90
            Classe(i,j) = 4;
        end
    end
end

    Classe = uint8(Classe);
    imwrite(Classe,'classes.tif','compress', 'none')
    
                               
                              