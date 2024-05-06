B0= imread('partitura.jpeg');

Im = B0 >= 100;
[m,n]= size(Im);

EE=[
0 1 0 
0 1 0 
0 1 0
];

EE1=[
0 0 0 
1 1 1 
0 0 0
];
      

%============ Fechamento ==============================
I2 = FechamentoBin(Im,EE);
disp('I2');

%============ Somente Horizontal ==================
I3 = (I2 - Im) == 0;
disp('I3');

I4 = DilatacaoBin(I3,EE1);
I4 = DilatacaoBin(I4,EE1);

for(i=1:50)
   I4 = ErosaoBin(I4,EE1);
end
disp('I4');

I5 = I4;
for(i=1:50)
   I5 = DilatacaoBin(I5,EE1);
end
disp('I5');
%============ Restaurar Original ==================
I6 = I2 & I5;
disp('I6');

%============ Graficos ============================
subplot(2,3,1);
imagesc(Im);
colormap(gray);
title('Imagem [1=branco]');

subplot(2,3,2);
imagesc(I2);
colormap(gray);
title('I2: Fechamento [sem horizontal]');

subplot(2,3,3);
imagesc(I3);
colormap(gray);
title('I3 = (I2 - Im) == 0: so horizontal');

subplot(2,3,4);
imagesc(I4);
colormap(gray);
title('I4 = Dilata 2x Erode 50x: so horizontal');

subplot(2,3,5);
imagesc(I5);
colormap(gray);
title('I5 = Dilata 50x : so horizontal');

subplot(2,3,6);
imagesc(I6);
colormap(gray);
title('Composição: I6 = I2 & I5');