clc;
clear all;
% =========================================================
Im = imread('F04_MDS_acima700m.tif');

EE = BinEECircular(13);

% Processo ================================================

Ia1 = GrayAberturaEEB(Im,EE);   disp('Ia1');
Ia2 = GrayFechamentoEEB(Im,EE); disp('Ia2');

Ib1 = GrayTopHatAberturaEEB (Im ,EE); disp('Ib1');
Ib2 = GrayTopHatFechamentoEEB(Im,EE); disp('Ib2');

Ic1 = GrayFechamentoEEB(Ia1,EE); disp('Ic1');
Ic2 = GrayAberturaEEB(Ia2,EE);   disp('Ic2');


% Mostrar Imagens =========================================

subplot(4,2,1);
imagesc(Im);
colormap(gray);
title('Imagem');

subplot(4,2,2);
imagesc(EE,[0,1]);
colormap(gray);
title('EE');

% ---------------------------------------------------------
subplot(4,2,3);
imagesc(Ia1);
colormap(gray);
title('Ia1 = GrayAberturaEEB(Im,EE)');

subplot(4,2,4);
imagesc(Ia2);
colormap(gray);
title('Ia2 = GrayFechamentoEEB(Im,EE)');

% ---------------------------------------------------------
subplot(4,2,5);
imagesc(Ib1);
colormap(gray);
title('Ib1 = GrayTopHatAberturaEEB(Im,EE)');

subplot(4,2,6);
imagesc(Ib2);
colormap(gray);
title('Ib2 = GrayTopHatFechamentoEEB(Im,EE)');
% ---------------------------------------------------------
subplot(4,2,7);
imagesc(Ic1);
colormap(gray);
title('Ic1 = GrayFechamentoEEB [GrayAberturaEEB(Im,EE)]');

subplot(4,2,8);
imagesc(Ic2);
colormap(gray);
title('Ic2 = GrayAberturaEEB [GrayFechamentoEEB(Im,EE)]');

% =========================================================
