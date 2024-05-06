clc;
clear all;
% ===================================================================
Im = imread('F01_MDS_70cm.tif');

EE = [
0 1 0
1 1 1
0 1 0
];

% Processo ==========================================================

I1 = GrayFechamentoEEB(Im,EE); disp('I1');

Ia1 = GrayDilatacaoEEB(I1,EE); disp('Ia1');
Ib1 = Ia1 - I1; disp('Ib1');

Ia2 = GrayErosaoEEB(I1,EE); disp('Ia2');
Ib2 = I1 - Ia2; disp('Ib2');

Ic = max(Ib1,Ib2); disp('Ic');
Id = 255 - Ic; disp('Id');


% Mostrar Figura 1 ================================================
figure 1;

subplot(2,4,1);
imagesc(Im);
colormap(gray);
title('Imagem');

subplot(2,4,5);
imagesc(I1);
colormap(gray);
title('I1 = GrayFechamentoEEB(Im,EE) => Preencher MDS');


subplot(2,4,2);
imagesc(Ia1);
colormap(gray);
title('Ia1 = GrayDilatacaoEEB(I1,EE)');

subplot(2,4,3);
imagesc(Ib1);
colormap(gray);
title('Ib1 = Ia1 - I1');

subplot(2,4,4);
imagesc(Ic);
colormap(gray);
title('Ic = max(Ib1,Ib2)');

% ---------------------------------------------------------

subplot(2,4,6);
imagesc(Ia2);
colormap(gray);
title('Ia2 = GrayErosaoEEB(I1,EE)');

subplot(2,4,7);
imagesc(Ib2);
colormap(gray);
title('Ib2 = I1 - Ia2');

subplot(2,4,8);
imagesc(Id);
colormap(gray);
title('Id = 255 - Ic');

% Mostrar Figura 2 a 5 ==============================================
figure 2;
imagesc(Ib1);
colormap(gray);
title('Ib1: Contorno Externo');

figure 3;
imagesc(Ib2);
colormap(gray);
title('Ib2: Contorno Interno');

figure 4;
imagesc(Ic);
colormap(gray);
title('Ic = maximo(C.Interno,C.Externo)');

figure 5;
imagesc(Id);
colormap(gray);
title('Id = 255 - Ic');

% ===================================================================


