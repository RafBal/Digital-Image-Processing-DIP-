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

I2 = AberturaBin(I1,EE);
      
I3 = AberturaBin2(I1,EE);
      
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
title('Abertura');

subplot(1,4,4);
imagesc(I3)
colormap(gray)
title('Abertura 2');
