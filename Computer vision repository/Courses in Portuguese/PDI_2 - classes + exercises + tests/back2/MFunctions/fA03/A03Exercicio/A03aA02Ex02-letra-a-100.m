clc;
clear all;
% Acerto e Erro (Hit-or-Miss)
Im = imread('F01_texto.tif');
EE = imread('F01_letra_a.tif');

I2 = ErosaoBin2(Im,EE);
disp('I2: ErosaoBin2(Im,EE)');
I3 = ErosaoZeroBin2(Im,EE);
disp('I3: ErosaoZeroBin2(Im,EE)');
I4 = HitOrMiss(Im,EE);
disp('I4: HitOrMiss(Im,EE)');

% Mostrar imagens
subplot(2,3,1);
imagesc(Im);
colormap(gray);
title('Imagem');

% Mostrar imagens
subplot(2,3,2);
imagesc(EE);
colormap(gray);
title('Alvo');


subplot(2,3,4);
imagesc(I2)
colormap(gray)
title('I2: ErosaoBin2(Im,EE)');

subplot(2,3,5);
imagesc(I3)
colormap(gray)
title('I3: ErosaoZeroBin2(Im,EE)');

subplot(2,3,6);
imagesc(I4)
colormap(gray)
title('I4: HitOrMiss(Im,EE)');
