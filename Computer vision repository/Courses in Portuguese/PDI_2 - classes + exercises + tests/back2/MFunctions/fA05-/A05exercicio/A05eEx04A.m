clc;
clear all;
% =========================================================
Im = imread('F02_esferas.tif');

EE=[
1 1 1 1 1
1 1 1 1 1
1 1 1 1 1
1 1 1 1 1
1 1 1 1 1
];

% Processo ================================================

Ia      = GrayAberturaEEB  (Im,EE); disp('Ia1');
Iabefec = GrayFechamentoEEB(Ia,EE); disp('Iabefec');

Ib      = GrayFechamentoEEB(Im,EE); disp('Ib1');
Ifecabe = GrayAberturaEEB  (Ib,EE); disp('Ifecabe');


% Mostrar Imagens =========================================

subplot(2,3,1);
imagesc(Im);
colormap(gray);
title('Imagem');

subplot(2,3,2);
imagesc(Ia);
colormap(gray);
title('Ia = GrayAberturaEEB(Im,EE)');

subplot(2,3,3);
imagesc(Iabefec);
colormap(gray);
title('Iabefec = GrayFechamentoEEB(Ia,EE)');

% ---------------------------------------------------------

subplot(2,3,4);
imagesc(EE,[0,1]);
colormap(gray);
title('EE');

subplot(2,3,5);
imagesc(Ib);
colormap(gray);
title('Ib = GrayFechamentoEEB(Im,EE)');

subplot(2,3,6);
imagesc(Ifecabe);
colormap(gray);
title('Ifecabe = GrayAberturaEEB  (Ib,EE)');

% =========================================================
