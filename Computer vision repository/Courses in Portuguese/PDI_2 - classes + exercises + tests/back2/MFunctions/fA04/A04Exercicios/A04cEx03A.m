clc;
clear all;
% ===========================================================
Im = imread('F02_teclado.tif');


Ia1 = GradDilatacaoMN(Im,3,3);  disp('Ia1');
Ia2 = GradDilatacaoMN(Im,5,5);  disp('Ia2');

Ib1 = GradErosaoMN(Im,3,3); disp('Ib1');
Ib2 = GradErosaoMN(Im,5,5); disp('Ib2');


% Mostrar Imagens ============================================================

subplot(2,3,1);
imagesc(Im);
colormap(gray);
title('Imagem');

subplot(2,3,2);
imagesc(Ia1);
colormap(gray);
title('Ia1 = GradDilatacaoMN(Im,3,3)');


subplot(2,3,3);
imagesc(Ia2);
colormap(gray);
title('Ia2 = GradDilatacaoMN(Im,5,5)');

% --------------------------------------

subplot(2,3,5);
imagesc(Ib1);
colormap(gray);
title('Ib1 = GradErosaoMN(Im,3,3)');

subplot(2,3,6);
imagesc(Ib2);
colormap(gray);
title('Ib2 = GradErosaoMN(Im,5,5)');

% ============================================================================
