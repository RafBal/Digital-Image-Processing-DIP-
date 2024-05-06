Im=[
0 0 0 0 0 0 0 0 0
0 0 1 0 0 0 0 0 0
0 1 1 1 1 1 1 0 0
0 0 0 1 1 1 1 1 0
0 0 0 1 1 0 1 1 0
0 0 1 1 1 1 1 0 0
0 0 0 1 1 0 0 0 0
0 0 0 0 0 0 0 0 0
];

EE = [0 1 0
      1 1 1
      0 1 0];

I2 = ErosaoBin(Im,EE);

subplot(1,3,1);
imagesc(Im);
colormap(gray);
title('Imagem [1=branco]');

subplot(1,3,2);
imagesc(EE);
colormap(gray);
title('Elemento Estruturante');

subplot(1,3,3);
imagesc(I2);
colormap(gray);
title('Erosão');
