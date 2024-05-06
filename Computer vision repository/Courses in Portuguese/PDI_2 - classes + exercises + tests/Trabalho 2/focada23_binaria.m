clc;
clear all;
focada23binaria = imread('placa23isolada.tif');
focada23binaria = im2bw(focada23binaria, 0.5);
    imwrite(focada23binaria,'focada23binaria.tif','compress', 'none')