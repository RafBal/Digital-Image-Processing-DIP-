clc;
clear all;
focada24binaria = imread('placa24fechada.tif');
focada24binaria = im2bw(focada24binaria, 0.3);
    imwrite(focada24binaria,'focada24binaria.tif','compress', 'none')