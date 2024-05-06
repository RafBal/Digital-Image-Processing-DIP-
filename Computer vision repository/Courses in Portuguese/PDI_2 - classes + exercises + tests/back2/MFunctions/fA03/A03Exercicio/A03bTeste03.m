clc;
clear all;
% Skeleton
Im = [
1 1 1 1 0 0 0
1 1 1 1 0 0 0
1 1 1 1 0 0 0
1 1 1 1 1 1 1
1 1 1 1 1 1 1
1 1 1 1 1 1 1
1 1 1 1 1 1 1
];

EE = [
0 1 0
1 1 1
0 1 0
];

Sk0 = SkeletonN(Im,EE,0);
disp('Sk0: SkeletonN(Im,EE,0)');

Sk1 = SkeletonN(Im,EE,1);
disp('Sk1: SkeletonN(Im,EE,1)');

Sk2 = SkeletonN(Im,EE,2);
disp('Sk2: SkeletonN(Im,EE,2)');

SkA = Skeleton(Im,EE);
disp('SkA = Skeleton(Im,EE)');

% Mostrar imagens =================================================
subplot(2,3,1);
imagesc(Im);
colormap(gray);
title('Imagem');

subplot(2,3,2);
imagesc(EE,[0,1]);
colormap(gray);
title('E. Estruturante');

subplot(2,3,3);
imagesc(Sk0)
colormap(gray)
title('Sk0: SkeletonN(Im,EE,0)');

subplot(2,3,4);
imagesc(Sk1)
colormap(gray)
title('Sk1: SkeletonN(Im,EE,1)');

subplot(2,3,5);
imagesc(Sk2)
colormap(gray)
title('Sk2: SkeletonN(Im,EE,2)');

subplot(2,3,6);
imagesc(SkA)
colormap(gray)
title('SkA = Skeleton(Im,EE)');

