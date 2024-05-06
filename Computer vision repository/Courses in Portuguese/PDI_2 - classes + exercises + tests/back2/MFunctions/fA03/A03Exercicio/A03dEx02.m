clc;
clear all;
% ==================================================================
Im = imread('F03_RuasCentroPolitecnico.tif');

EE = [
0 1 0
1 1 1
0 1 0
];

Sk0 = SkeletonN(Im,EE,0);
disp('Sk0: SkeletonN(Im,EE,0)');

Sk3 = SkeletonN(Im,EE,3);
disp('Sk3: SkeletonN(Im,EE,3)');

Sk6 = SkeletonN(Im,EE,6);
disp('Sk6: SkeletonN(Im,EE,6)');

SkA = Skeleton(Im,EE);
disp('SkA = Skeleton(Im,EE)');

% Mostrar imagens =================================================
subplot(2,3,1);
imagesc(Im);
colormap(gray);
title('Imagem');

subplot(2,3,2);
imagesc(EE);
colormap(gray);
title('E. Estruturante');

subplot(2,3,3);
imagesc(Sk0)
colormap(gray)
title('Sk0: SkeletonN(Im,EE,0)');

subplot(2,3,4);
imagesc(Sk3)
colormap(gray)
title('Sk3: SkeletonN(Im,EE,3)');

subplot(2,3,5);
imagesc(Sk6)
colormap(gray)
title('Sk6: SkeletonN(Im,EE,6)');

subplot(2,3,6);
imagesc(SkA)
colormap(gray)
title('SkA = Skeleton(Im,EE) n=9');

