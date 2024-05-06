clc;
clear all;
% =========================================================
Im = imread('F03_teclado.tif');

EE=[
1 1 1 1 1
1 1 1 1 1
1 1 1 1 1
1 1 1 1 1
1 1 1 1 1
];

% Processo ================================================

If   = GrayFechamentoEEB(Im,EE);  disp('If');
Iaf  = GrayAberturaEEB  (If,EE);  disp('Iaf');
Ifaf = GrayFechamentoEEB(Iaf,EE); disp('Ifaf');

Ia   = GrayAberturaEEB  (Im ,EE); disp('Ia');
Ifa  = GrayFechamentoEEB(Ia ,EE); disp('Ifa');
Iafa = GrayAberturaEEB  (Ifa,EE); disp('Iafa');


% Mostrar Imagens =========================================

subplot(2,4,1);
imagesc(Im);
colormap(gray);
title('Imagem');

subplot(2,4,2);
imagesc(If);
colormap(gray);
title('If = GrayFechamentoEEB(Im,EE)');

subplot(2,4,3);
imagesc(Iaf);
colormap(gray);
title('Iaf = GrayAberturaEEB(If,EE)');

subplot(2,4,4);
imagesc(Ifaf);
colormap(gray);
title('Ifaf = GrayFechamentoEEB(Iaf,EE)');

% ---------------------------------------------------------

subplot(2,4,5);
imagesc(EE,[0,1]);
colormap(gray);
title('EE');

subplot(2,4,6);
imagesc(Ia);
colormap(gray);
title('Ia = GrayAberturaEEB(Im,EE)');

subplot(2,4,7);
imagesc(Ifa);
colormap(gray);
title('Ifa = GrayFechamentoEEB(Ia,EE)');


subplot(2,4,8);
imagesc(Iafa);
colormap(gray);
title('Iafa = GrayAberturaEEB(Ifa,EE)');

% =========================================================
