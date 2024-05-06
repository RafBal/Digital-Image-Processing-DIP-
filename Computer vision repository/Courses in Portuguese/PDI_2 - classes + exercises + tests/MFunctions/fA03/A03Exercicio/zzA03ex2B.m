clc;
clear all;

Im = imread('RuasCentroPolitecnico.tif');

EE = [
1 0 1
0 1 0
1 0 1
];

I2 = NSkeleton(Im,EE,0);
disp('I2: NSkeleton(Im,EE,0)');

I3 = NSkeleton(Im,EE,1);
disp('I3: NSkeleton(Im,EE,3)');

I4 = NSkeleton(Im,EE,2);
disp('I4: NSkeleton(Im,EE,6)');

I5 = Skeleton(Im,EE);
disp('I5 = Skeleton(Im,EE)');

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
imagesc(I2)
colormap(gray)
title('I2: NSkeleton(Im,EE,0)');

subplot(2,3,4);
imagesc(I3)
colormap(gray)
title('I3: NSkeleton(Im,EE,3)');

subplot(2,3,5);
imagesc(I4)
colormap(gray)
title('I4: NSkeleton(Im,EE,6)');

subplot(2,3,6);
imagesc(I5)
colormap(gray)
title('I5 = Skeleton(Im,EE) n=9');

