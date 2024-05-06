clc;
clear all;
% ===========================================================
Im = imread('F02_teclado.tif');


Ia1 = GrayDilatacaoMN(Im,3,3);
Ia2 = GrayDilatacaoMN(Im,5,5);

Ib1 = GrayErosaoMN(Im,3,3);
Ib2 = GrayErosaoMN(Im,5,5);


% Mostrar Imagens ============================================================

subplot(2,3,1);
imagesc(Im);
colormap(gray);
title('Imagem');

subplot(2,3,2);
imagesc(Ia1);
colormap(gray);
title('Ia1 = GrayDilatacaoMN(Im,3,3)');


subplot(2,3,3);
imagesc(Ia2);
colormap(gray);
title('Ia2 = GrayDilatacaoMN(Im,5,5)');

% --------------------------------------

subplot(2,3,5);
imagesc(Ib1);
colormap(gray);
title('Ib1 = GrayErosaoMN(Im,3,3)');

subplot(2,3,6);
imagesc(Ib2);
colormap(gray);
title('Ib2 = GrayErosaoMN(Im,5,5)');

% ============================================================================
