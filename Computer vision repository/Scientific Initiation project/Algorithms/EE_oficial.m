close all
clc
clear all

sfinal = imread('EE2_pedestre2_oficial.jpg');
sfinal = double(sfinal);
[m,n] = size(sfinal);
for i = 1:m
    for j = 1:n
        if sfinal(i,j) < 240
            sfinal(i,j) = 0;
        else
            sfinal(i,j) = 255;
        end
    end
end
sfinal = uint8(sfinal);
imwrite(sfinal,'EE_oficial.tif','compress','none')
imagesc(sfinal)