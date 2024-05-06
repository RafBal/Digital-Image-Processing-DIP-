clc;
clear all;
% Dilatacao
Im = imread('teclado.tif');

EE = [
-1 0 1
-2 0 2
-1 0 1
];


Ia = DilatacaoEEGray1(Im,EE);
Ib = ErosaoEEGray1(Im,EE);

I1 = Ia - Im;
I2 = Im - Ib;

% Mostrar Imagens ============================================================

subplot(2,3,1);
imagesc(Im);
colormap(gray);
title('Imagem');

subplot(2,3,2);
imagesc(Ia);
colormap(gray);
title('Ia = DilatacaoEEGray1(Im,EE)');

subplot(2,3,3);
imagesc(Ib);
colormap(gray);
title('Ib = ErosaoEEGray1(Im,EE)');

subplot(2,3,4);
imagesc(EE);
colormap(gray);
title('EE');

subplot(2,3,5);
imagesc(I1);
colormap(gray);
title('I1 = Ia - Im');

subplot(2,3,6);
imagesc(I2);
colormap(gray);
title('I2 = Im - Ib');
