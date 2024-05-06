clc;
clear all;
% =====================================================
Im = imread('F02_personagem.tif');

I1 = Im > 125;

EE = [1 1 1 1 1   
      1 1 1 1 1
      1 1 1 1 1 
      1 1 1 1 1
      1 1 1 1 1];

I2 = DilatacaoBin(I1,EE);
I3 = I2 - I1;

I4 = ErosaoBin(I1,EE);
I5 = I1 - I4;

I6 = I2 - I4;

% Mostrar imagens =====================================

subplot(2,4,1);
imagesc(Im);
colormap(gray);
title('Imagem');

subplot(2,4,2);
imagesc(EE,[0,1]);
colormap(gray);
title('Elemento Estruturante');

subplot(2,4,3);
imagesc(I2)
colormap(gray)
title('I2 = DilatacaoBin(I1,EE)');

subplot(2,4,4);
imagesc(I4)
colormap(gray)
title('I4 = ErosaoBin(I1,EE)');

% -----------------------------------------

subplot(2,4,6);
imagesc(I3)
colormap(gray)
title('I3 = I2-I1 (contorno externo)');

subplot(2,4,7);
imagesc(I5)
colormap(gray)
title('I5 = I1-I4 (contorno interno)');

subplot(2,4,8);
imagesc(I6)
colormap(gray)
title('I6 = I2-I4 (contorno forte)');

% =====================================================
