clc;
clear all;
% Dilatacao
Im = imread('teclado.tif');


Ia = DilatacaoGray(Im,3,3);
Ib = ErosaoGray(Im,3,3);


% Mostrar Imagens ============================================================

subplot(1,3,1);
imagesc(Im);
colormap(gray);
title('Imagem');

subplot(1,3,2);
imagesc(Ia);
colormap(gray);
title('Ia = DilatacaoGray(Im,3,3)');

subplot(1,3,3);
imagesc(Ib);
colormap(gray);
title('Ib = ErosaoGray(Im,3,3)');
