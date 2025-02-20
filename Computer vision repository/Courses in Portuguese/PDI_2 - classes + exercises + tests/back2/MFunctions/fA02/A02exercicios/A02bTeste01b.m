clc;
clear all;
% =====================================================
Im = [
0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
0 0 1 1 1 1 1 1 0 0 0 0 0 0 1 1 1 0 0
0 0 1 1 1 1 1 1 0 0 0 0 0 0 1 1 1 0 0
0 0 1 1 1 1 1 1 0 0 0 1 0 0 1 1 1 0 0
0 0 1 1 1 1 1 1 0 0 0 0 0 0 0 0 0 0 0
0 0 1 1 1 1 1 1 0 0 0 0 0 0 0 0 0 0 0
0 0 1 1 1 1 1 1 0 0 1 1 1 1 1 0 0 0 0
0 0 1 1 1 1 1 1 0 0 1 1 1 1 1 0 0 0 0
0 0 0 0 0 0 0 0 0 0 1 1 1 1 1 0 0 0 0
0 0 0 0 0 0 0 0 0 0 1 1 1 1 1 0 0 0 0
0 0 0 0 0 0 0 0 0 0 1 1 1 1 1 0 0 0 0
0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 
];

EE = [
0 0 0 0 0 0 0
0 1 1 1 1 1 0
0 1 1 1 1 1 0
0 1 1 1 1 1 0
0 1 1 1 1 1 0
0 1 1 1 1 1 0
0 0 0 0 0 0 0
];

I2 = HitOrMissBin2(Im,EE);


% Mostrar imagens =====================================  

subplot(1,3,1);
imagesc(Im);
colormap(gray);
title('Imagem');

subplot(1,3,2);
imagesc(EE,[0,1]);
colormap(gray);
title('Elemento Estruturante');

subplot(1,3,3);
imagesc(I2)
colormap(gray)
title('HitOrMissBin2[Im,EE]');

