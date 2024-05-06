clc;
clear all;
% Dilatacao
Im = imread('MDS_70cm.tif');

EE = [
0 1 0
1 1 1
0 1 0
];

II = FechamentoEEGray1(Im,EE);

Ia1 = DilatacaoEEGray1(II,EE);
Ib1 = Ia1 - II;

Ia2 = ErosaoEEGray1(II,EE);
Ib2 = II - Ia2;

Ic = max(Ib1,Ib2);
Id = 255 - Ic;


% Mostrar Imagens ============================================================

subplot(2,4,1);
imagesc(Im);
colormap(gray);
title('Imagem');

subplot(2,4,5);
imagesc(II);
colormap(gray);
title('II = FechamentoEEGray1(Im,EE)');


subplot(2,4,2);
imagesc(Ia1);
colormap(gray);
title('Ia1 = DilatacaoEEGray1(II,EE)');

subplot(2,4,3);
imagesc(Ib1);
colormap(gray);
title('Ib1 = Ia1 - II');

subplot(2,4,4);
imagesc(Ic);
colormap(gray);
title('Ic = max(Ib1,Ib2)');



subplot(2,4,6);
imagesc(Ia2);
colormap(gray);
title('Ia2 = ErosaoEEGray1(II,EE)');

subplot(2,4,7);
imagesc(Ib2);
colormap(gray);
title('Ib2 = II - Ia2');

subplot(2,4,8);
imagesc(Id);
colormap(gray);
title('Id = 255 - Ic');