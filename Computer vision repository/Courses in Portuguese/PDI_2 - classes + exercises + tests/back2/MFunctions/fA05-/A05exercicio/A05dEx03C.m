clc;
clear all;
% =========================================================
Im = imread('F02_esferas.tif');

EEa = BinEECircular(13);
EEb = BinEECircular(15);

EEc=[
1 1 1 1 1
1 1 1 1 1
1 1 1 1 1
1 1 1 1 1
1 1 1 1 1
];

% Processo ================================================

Ia1 = GrayAberturaEEB(Im,EEa);       disp('Ia1');
Ia2 = GrayTopHatAberturaEEB(Im,EEa); disp('Ia2');

Ib1 = GrayAberturaEEB(Im,EEb);       disp('Ib1');
Ib2 = GrayTopHatAberturaEEB(Im,EEb); disp('Ib2');

Ic = Ib2 - Ia2; disp('Ic');
Id = GrayAberturaEEB(Ib2 - Ia2,EEc); disp('Id');

% Mostrar Imagens =========================================
figure 1;

subplot(2,4,1);
imagesc(EEa,[0,1]);
colormap(gray);
title('EEa');

subplot(2,4,2);
imagesc(Ia2);
colormap(gray);
title('Ia2 = GrayTopHatAberturaEEB(Im,EEa)');

subplot(2,4,3);
imagesc(Ic);
colormap(gray);
title('Ic = Ib2 - Ia2');

subplot(2,4,4);
imagesc(Im);
colormap(gray);
title('Imagem');

% ---------------------------------------------------------

subplot(2,4,5);
imagesc(EEb,[0,1]);
colormap(gray);
title('EEb');

subplot(2,4,6);
imagesc(Ib2);
colormap(gray);
title('Ib2 = GrayTopHatAberturaEEB(Im,EEb)');


subplot(2,4,7);
imagesc(Id);
colormap(gray);
title('Id = GrayAberturaEEB(Ib2 - Ia2,EEc)');


subplot(2,4,8);
imagesc(EEc,[0,1]);
colormap(gray);
title('EEc');

% Mostrar Imagens =========================================
figure 2;

imagesc(Ic);
colormap(gray);
title('Ic = Ib2 - Ia2');

% Mostrar Imagens =========================================
figure 3;

imagesc(Id);
colormap(gray);
title('Id = GrayAberturaEEB(Ib2 - Ia2,EEc)');

% =========================================================
