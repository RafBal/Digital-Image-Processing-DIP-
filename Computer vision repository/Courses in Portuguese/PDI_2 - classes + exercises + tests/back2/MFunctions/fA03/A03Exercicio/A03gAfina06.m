clc;
clear all;
% =============================================================
Im = imread('F02_Ferramenta5.tif');
disp('Im lido.');

[Afina,N] = Afina(Im);
disp('[Afina,N]');

Ib=Im + Afina;


% Mostrar Imagens ==============================================

subplot(1,3,1);
imagesc(Im);
colormap(gray);
title('Imagem');

subplot(1,3,2);
imagesc(Afina);
colormap(gray);
titulo=cat(2,'[Afina,N] = Afina(Im)  N=',num2str(N));
title(titulo);

subplot(1,3,3);
imagesc(Ib);
title('Ib=Im + Afina');

% =============================================================
