Im = [
0 0 0 0 0 0 0
0 0 0 0 0 0 0
0 0 1 1 0 0 0
0 0 1 1 0 0 0
0 0 1 1 0 0 0
0 0 1 1 1 0 0
0 0 0 1 1 0 0
0 0 0 0 0 0 0
0 0 0 0 0 0 0
];
     
EE = [0 1 0
      1 1 1
      0 1 0];

I2 = DilatacaoBin(Im,EE);

I3 = DilatacaoBin(I2,EE);

subplot(1,4,1);
imagesc(Im);
colormap(gray);
title('Imagem [1=branco]');

subplot(1,4,2);
imagesc(EE);
colormap(gray);
title('Elemento Estruturante');

subplot(1,4,3);
imagesc(I2)
colormap(gray)
title('I2: Dilatação 1');

subplot(1,4,4);
imagesc(I3)
colormap(gray)
title('I3: Dilatação 2');