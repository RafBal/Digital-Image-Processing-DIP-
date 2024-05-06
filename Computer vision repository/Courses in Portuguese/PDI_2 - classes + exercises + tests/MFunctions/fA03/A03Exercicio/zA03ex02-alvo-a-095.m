clc;
clear all;
% Acerto e Erro (Hit-or-Miss)
Im = imread('texto.tif');
EE = imread('alvo_a.tif');

I2 = ErosaoBinP(Im,EE,0.95);
disp('I2: ErosaoBinP(Im,EE,0.95)');
I3 = ErosaoZeroBinP(Im,EE,0.95);
disp('I3: ErosaoZeroBinP(Im,EE,0.95)');
I4 = HitOrMissP(Im,EE,0.95);
disp('I4: HitOrMissP(Im,EE,0.95)');

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
title('I2: ErosaoBinP(Im,EE,0.95)');

subplot(2,3,5);
imagesc(I3)
colormap(gray)
title('I3: ErosaoZeroBinP(Im,EE,0.95)');

subplot(2,3,6);
imagesc(I4)
colormap(gray)
title('I4: HitOrMissP(Im,EE,0.95)');
