clc;
clear all;
% Fechamento: 1º dilatação , 2º erosão
Im = imread('bin05.tif');

I1 = Im > 125;

EE = [1 1 1 1 1   
      1 1 1 1 1
      1 1 1 1 1 
      1 1 1 1 1
      1 1 1 1 1];

I2 = FechamentoBin2(I1,EE);
      
% Mostrar imagens
subplot(1,3,1);
imagesc(I);
colormap(gray);
title('Imagem');

subplot(1,3,2);
imagesc(EE);
colormap(gray);
title('Elemento Estruturante');

subplot(1,3,3);
imagesc(I2)
colormap(gray)
title('Fechamento');
