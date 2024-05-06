clc;
clear all;

Im = [
0 0 0 0 0 0 0 0
0 0 0 0 0 0 0 0
0 0 1 1 1 1 0 0 
0 0 1 1 0 0 0 0   
0 0 1 0 0 0 0 0 
0 0 0 0 0 0 0 0
0 0 0 0 0 0 0 0
];

EE = [
0 0 0   
0 1 0
0 1 0
];

I2 = ErosaoBin2(Im,EE);

I3 = DilatacaoBin(Im,EE);
      
% Mostrar imagens
subplot(2,2,1);
imagesc(Im);
colormap(gray);
title('Imagem');
[m n]=size(Im);
%text(1,m+1,'Imagem');

subplot(2,2,2);
imagesc(EE);
colormap(gray);
title('Elemento Estruturante');
[m n]=size(EE);

subplot(2,2,3);
imagesc(I2)
colormap(gray)
title('Erosao');

subplot(2,2,4);
imagesc(I3)
colormap(gray)
title('Dilatacao');
