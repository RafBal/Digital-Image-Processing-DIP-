clc;
clear all;
% Dilatacao
Im = [
20 23 26 28 32 25 25 17
17 19 19 35 28 34 33 28
34 36 27 33 37 44 40 41
32 27 18 16 21 26 28 32
34 27 25 23 24 35 37 29
];

EE = [
1 2 1
2 3 2
1 2 1
];


Ia = DilatacaoEEGray1(Im,EE);
Ib = ErosaoEEGray1(Im,EE);


% Mostrar Imagens ============================================================

subplot(1,3,1);
imagesc(Im);
colormap(gray);
title('Imagem');

subplot(1,3,2);
imagesc(Ia);
colormap(gray);
title('Ia = DilatacaoEEGray1(Im,EE)');

subplot(1,3,3);
imagesc(Ib);
colormap(gray);
title('Ib = ErosaoEEGray1(Im,EE)');
