B0= imread('partitura.jpeg');

Im = B0 >= 100;
[m,n]= size(Im);

EE = [0 1 0 
      0 1 0 
      0 1 0];

%============ Dilatacao ===========================
I2 = DilatacaoBin(Im,EE);

%============ Erosao ==============================
I3 = ErosaoBin(I2,EE);

%============ Somente Horizontal ==================
I4 = (I3 - Im) == 0;

%============ Restaurar Original ==================
I5 = I3 & I4;


%============ Graficos ============================
subplot(2,3,1);
imagesc(Im);
colormap(gray);
title('Imagem [1=branco]');

subplot(2,3,2);
imagesc(EE);
colormap(gray);
title('Elemento Estruturante');

subplot(2,3,3);
imagesc(I2);
colormap(gray);
title('1-Dilatação');

subplot(2,3,4);
imagesc(I3);
colormap(gray);
title('I3 = ErosaoBin(I2,EE): sem horizontal');

subplot(2,3,5);
imagesc(I4);
colormap(gray);
title('I4 = (I3 - Im) == 0 : so horizontal');

subplot(2,3,6);
imagesc(I5);
colormap(gray);
title('Composição: I5 = I3 & I4');
