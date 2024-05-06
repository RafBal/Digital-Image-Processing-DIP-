clc;
clear all;
% ===============================================
Im = imread('F01_bin05.tif');

I1 = Im > 125;

EE = [
1 1 1 1 1   
1 1 1 1 1
1 1 1 1 1 
1 1 1 1 1
1 1 1 1 1
];

I2 = AberturaBin(I1,EE);
      
% Mostrar imagens ===============================
subplot(1,3,1);
imagesc(Im);
colormap(gray);
title('Imagem');

subplot(1,3,2);
imagesc(EE,[0,1]);
colormap(gray);
title('Elemento Estruturante');

subplot(1,3,3);
imagesc(I2)
colormap(gray)
title('Abertura');

% ===============================================
