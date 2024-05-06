clc;
clear all;
% =========================================================
Im = imread('F01_MDS_70cm.tif');

EE = [
0 1 0
1 1 1
0 1 0
];

% Processo ================================================

I1 = GrayFechamentoEEB(Im,EE); disp('I1');

Ia1 = GrayDilatacaoEEB(I1,EE); disp('Ia1');
Ib1 = Ia1 - I1; disp('Ib1');

Ia2 = GrayErosaoEEB(I1,EE); disp('Ia2');
Ib2 = I1 - Ia2; disp('Ib2');

Ic = max(Ib1,Ib2); disp('Ic');

% reforçar contorno -------------
[m,n] = size(Ic)
Id1 = zeros(m,n);
Id2 = zeros(m,n);

for(i=1:m)
for(j=1:n)
   if( Ic(i,j)>=2 )
     Id1(i,j)=255;
   end

   if( Ic(i,j)>=4 )
     Id2(i,j)=255;
   end
end
end

 disp('Id1 e Id2');
% -------------------------------

Ie1 = 255 - Id1; disp('Ie1');
Ie2 = 255 - Id2; disp('Ie2');

% Mostrar Imagens =========================================
figure 1;

subplot(2,4,1);
imagesc(Im);
colormap(gray);
title('Imagem');

subplot(2,4,2);
imagesc(EE,[0,1]);
colormap(gray);
title('EE');

subplot(2,4,3);
imagesc(I1);
colormap(gray);
title('I1 = GrayFechamentoBinEE(Im,EE)');

subplot(2,4,4);
imagesc(Ic);
colormap(gray);
title('Ic = max(Ib1,Ib2) => contorno');

% ---------------------------------------------------------

subplot(2,4,5);
imagesc(Id1);
colormap(gray);
title('Id1 => se(px>2) px=255');

subplot(2,4,6);
imagesc(Id2);
colormap(gray);
title('Id2 => se(px>4) px=255');

subplot(2,4,7);
imagesc(Ie1);
colormap(gray);
title('Ie1 = 255 - Id1');

subplot(2,4,8);
imagesc(Ie2);
colormap(gray);
title('Ie2 = 255 - Id2');

% Mostrar Outras Imagens ==================================
figure 2;
imagesc(Ic);
colormap(gray);
title('Ic = max(Ib1,Ib2) => contorno');

figure 3;
imagesc(Id1);
colormap(gray);
title('Id1 => se(px>2) px=255');

figure 4;
imagesc(Id2);
colormap(gray);
title('Id2 => se(px>4) px=255');

figure 5;
imagesc(Ie1);
colormap(gray);
title('Ie1 = 255 - Id1');

figure 6;
imagesc(Ie2);
colormap(gray);
title('Ie2 = 255 - Id2');

% ===================================================================
