clc;
clear all;
% ===========================================================
Im = imread('F02_teclado.tif');

% EE com Operador Sobel
EE1=[
-1 0 1
-2 0 2
-1 0 1
];

EE2=[
-1 -2 -1
 0  0  0
 1  2  1
];


% Processo ==================================================

Ia1 = GradDilatacaoEE(Im,EE1);  disp('Ia1');
Ia2 = GradDilatacaoEE(Im,EE2);  disp('Ia2');

Ib1 = GradErosaoEE(Im,EE1); disp('Ib1');
Ib2 = GradErosaoEE(Im,EE2); disp('Ib2');


% Mostrar Imagens ============================================================

subplot(2,3,1);
imagesc(Im);
colormap(gray);
title('Imagem');

subplot(2,3,2);
imagesc(Ia1);
colormap(gray);
title('Ia1 = GradDilatacaoEE(Im,EE1)');


subplot(2,3,3);
imagesc(Ib1);
colormap(gray);
title('Ib1 = GradErosaoEE(Im,EE1)');

% --------------------------------------

subplot(2,3,4);
imagesc( cat(1,EE1,EE2) );
colormap(gray);
title('Operador Sobel: cat(1,EE1,EE2) ');

subplot(2,3,5);
imagesc(Ia2);
colormap(gray);
title('Ia2 = GradDilatacaoEE(Im,EE2)');

subplot(2,3,6);
imagesc(Ib2);
colormap(gray);
title('Ib2 = GradErosaoEE(Im,EE2)');

% ============================================================================
