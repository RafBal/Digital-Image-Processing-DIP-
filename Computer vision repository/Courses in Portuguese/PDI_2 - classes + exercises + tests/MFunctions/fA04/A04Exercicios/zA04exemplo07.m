clc;
clear all;
% Dilatacao
Im = imread('Bacacheri.tif');

Ia = AberturaGray(Im,5,5);
Ib = FechamentoGray(Im,5,5);


% Mostrar Imagens ============================================================

subplot(1,3,1);
imagesc(Im);
colormap(gray);
title('Imagem');

subplot(1,3,2);
imagesc(Ia);
colormap(gray);
title('Ia = AberturaGray(Im,5,5)');

subplot(1,3,3);
imagesc(Ib);
colormap(gray);
title('Ib = FechamentoGray(Im,5,5)');
