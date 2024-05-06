clc;
clear all;
% Skeleton
Im = imread('Ferramenta5.tif');

Ia = AfinaSerra01(Im);


% Mostrar Imagens ============================================================

subplot(1,2,1);
imagesc(Im);
colormap(gray);
title('Imagem');

subplot(1,2,2);
imagesc(Ia);
colormap(gray);
title('Ia = AfinaSerra01(Im)');


