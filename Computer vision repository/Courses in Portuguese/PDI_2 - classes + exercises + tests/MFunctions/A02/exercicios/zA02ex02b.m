clc;
clear all;
% Abertura: 1º erosão, 2º dilatação
Im = imread('bin05.tif');

I1 = Im > 125;

EE = [1 1 1 1 1   
      1 1 1 1 1
      1 1 1 1 1 
      1 1 1 1 1
      1 1 1 1 1];

I2 = AberturaBin2(I1,EE);

I3 = I1 - I2;
      
% Mostrar imagens
subplot(1,4,1);
imagesc(Im);
colormap(gray);
title('Imagem');

subplot(1,4,2);
imagesc(EE);
colormap(gray);
title('Elemento Estruturante');

subplot(1,4,3);
imagesc(I2)
colormap(gray)
title('Abertura 2');

subplot(1,4,4);
imagesc(I3)
colormap(gray)
title('I3 = I1 - I2');
