clc;
clear all;
% Acerto e Erro (Hit-or-Miss)
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

I2 = ErosaoBin2(Im,EE);

I3 = ErosaoBin2(~Im,~EE);

I4 = I2 & I3;
      
% Mostrar imagens
subplot(2,3,1);
imagesc(Im);
colormap(gray);
title('Imagem');

% Mostrar imagens
subplot(2,3,2);
imagesc(~Im);
colormap(gray);
title('~Imagem');

subplot(2,3,3);
imagesc(EE);
colormap(gray);
title('Elemento Estruturante');

subplot(2,3,4);
imagesc(I2)
colormap(gray)
title('ErosaoBin2[Im,EE]');

subplot(2,3,5);
imagesc(I3)
colormap(gray)
title('ErosaoBin2[~Im,~EE]');

subplot(2,3,6);
imagesc(I4)
colormap(gray)
title('Im (x) EE');
