clc;
clear all;
% =============================================================
Im = imread('F02_Ferramenta5.tif');


Af2 = AfinaN(Im,2);
disp('Af2');

Af4 = AfinaN(Af2,2);
disp('Af4');

Af10 = AfinaN(Af4,6);
disp('Af10');

Af15 = AfinaN(Af10,5);
disp('Af15');

Af20 = AfinaN(Af15,5);
disp('Af20');


% Mostrar Imagens =============================================

subplot(2,3,1);
imagesc(Im);
colormap(gray);
title('Imagem');

subplot(2,3,2);
imagesc(Af2);
colormap(gray);
title('Af2 = AfinaN(Im,2)');

subplot(2,3,3);
imagesc(Af4);
colormap(gray);
title('Af4 = AfinaN(Af2,2)');

subplot(2,3,4);
imagesc(Af10);
colormap(gray);
title('Af10 = AfinaN(Af4,6)');

subplot(2,3,5);
imagesc(Af15);
colormap(gray);
title('Af15 = AfinaN(Af10,5)');



subplot(2,3,6);
imagesc(Af20);
colormap(gray);
title('Af20 = AfinaN(Af15,5)');

% =============================================================
