clc;
clear all;
% =========================================================
Im = imread('F02_esferas.tif');

EE = [
1 1 1
1 1 1
1 1 1
];

% Processo ================================================

Ia1 = GrayAberturaEEB(Im,EE);       disp('Ia1');
Ib1 = GrayTopHatAberturaEEB(Im,EE); disp('Ib1');

Ia2 = GrayFechamentoEEB(Im,EE);       disp('Ia2');
Ib2 = GrayTopHatFechamentoEEB(Im,EE); disp('Ib2');


% Mostrar Imagens =========================================

subplot(2,3,1);
imagesc(Im);
colormap(gray);
title('Imagem');

subplot(2,3,2);
imagesc(Ia1);
colormap(gray);
title('Ia1 = GrayAberturaEEB(Im,EE)');

subplot(2,3,3);
imagesc(Ib1);
colormap(gray);
title('Ib1 = GrayTopHatAberturaEEB(Im,EE)');

% ---------------------------------------------------------

subplot(2,3,4);
imagesc(EE,[0,1]);
colormap(gray);
title('EE');

subplot(2,3,5);
imagesc(Ia2);
colormap(gray);
title('Ia2 = GrayFechamentoEEB(Im,EE)');

subplot(2,3,6);
imagesc(Ib2);
colormap(gray);
title('Ib2 = GrayTopHatFechamentoEEB(Im,EE)');

% =========================================================
