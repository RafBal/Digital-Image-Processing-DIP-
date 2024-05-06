Im=[
0 0 0 0 0 0 0 0
0 1 1 1 0 0 0 0
0 1 1 1 0 0 0 0
0 1 1 1 1 0 0 0
0 0 0 1 1 1 1 0
0 0 0 0 1 1 1 0
0 0 0 0 1 1 1 0
0 0 0 0 0 0 0 0
];
     
EE=[
0 1 0
1 1 1
0 1 0];

% Abertura = (Erosao) + Dilatacao

I2 = ErosaoBin(Im,EE);

I3 = AberturaBin(Im,EE);

subplot(1,4,1);
imagesc(Im);
colormap(gray);
title('Imagem (1=branco)');

subplot(1,4,2);
imagesc(EE);
colormap(gray);
title('Elemento Estruturante');

subplot(1,4,3);
imagesc(I2);
colormap(gray);
title('Erosão');

subplot(1,4,4);
imagesc(I3)
colormap(gray)
title('Abertura: Erosão+Dilatação');
