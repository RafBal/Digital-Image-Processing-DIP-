clc;
clear all;

Im = imread('F02_Ferramenta5.tif');

EE = [
0 1 0
1 1 1
0 1 0
];

Sk0 = SkeletonN(Im,EE,0);
disp('Sk0: SkeletonN(Im,EE,0)');

Sk5 = SkeletonN(Im,EE,5);
disp('Sk5: SkeletonN(Im,EE,5)');

Sk10 = SkeletonN(Im,EE,10);
disp('Sk10: SkeletonN(Im,EE,10)');

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
imagesc(Sk5)
colormap(gray)
title('Sk5: SkeletonN(Im,EE,5)');

subplot(2,3,5);
imagesc(Sk10)
colormap(gray)
title('Sk10: SkeletonN(Im,EE,10)');

subplot(2,3,6);
imagesc(SkA)
colormap(gray)
title('SkA = Skeleton(Im,EE) n=16');

