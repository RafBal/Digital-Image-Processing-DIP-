clc;
clear all;
% Skeleton
A = [
1 1 1 1 1 1 1 1 1 1 1
1 1 1 1 1 1 1 1 1 0 0
1 1 1 1 1 1 1 1 1 0 0
1 1 1 1 1 1 1 1 1 0 0
1 1 1 0 0 1 1 1 1 0 0
];

%Elementos estruturantes
B (:,:,1) = [ 0 0 0 ; 0 1 0 ; 1 1 1 ];
BC(:,:,1) = [ 1 1 1 ; 0 0 0 ; 0 0 0 ];
B (:,:,2) = [ 0 0 0 ; 1 1 0 ; 1 1 0 ];
BC(:,:,2) = [ 0 1 1 ; 0 0 1 ; 0 0 0 ];
B (:,:,3) = [ 1 0 0 ; 1 1 0 ; 1 0 0 ];
BC(:,:,3) = [ 0 0 1 ; 0 0 1 ; 0 0 1 ];
B (:,:,4) = [ 1 1 0 ; 1 1 0 ; 0 0 0 ];
BC(:,:,4) = [ 0 0 0 ; 0 0 1 ; 0 1 1 ];
B (:,:,5) = [ 1 1 1 ; 0 1 0 ; 0 0 0 ];
BC(:,:,5) = [ 0 0 0 ; 0 0 0 ; 1 1 1 ];
B (:,:,6) = [ 0 1 1 ; 0 1 1 ; 0 0 0 ];
BC(:,:,6) = [ 0 0 0 ; 1 0 0 ; 1 1 0 ];
B (:,:,7) = [ 0 0 1 ; 0 1 1 ; 0 0 1 ];
BC(:,:,7) = [ 1 0 0 ; 1 0 0 ; 1 0 0 ];
B (:,:,8) = [ 0 0 0 ; 0 1 1 ; 0 1 1 ];
BC(:,:,8) = [ 1 1 0 ; 1 0 0 ; 0 0 0 ];














I2 = Im - AberturaBin2(Im,EE);
disp('I2 = Im - AberturaBin2(Im,EE)');

temp = ErosaoBin2(Im,EE);
I3 = temp - AberturaBin2(temp,EE);
disp('I3 = temp - AberturaBin2(temp,EE)');


temp1 = ErosaoBin2(temp,EE);
I4 = temp1 - AberturaBin2(temp1,EE);
disp('I4 = temp1 - AberturaBin2(temp1,EE)');

I5 = I2 | I3 | I4;

% Mostrar Imagens ============================================================

subplot(2,3,1);
imagesc(Im);
colormap(gray);
title('Imagem');

subplot(2,3,2);
imagesc(EE);
colormap(gray);
title('E. Estruturante');

subplot(2,3,3);
imagesc(I5)
colormap(gray)
title('I5 = I2 | I3 | I4');

subplot(2,3,4);
imagesc(I2)
colormap(gray)
title('I2 = Im - AberturaBin2(Im,EE)');

subplot(2,3,5);
imagesc(I3)
colormap(gray)
title('I3 = temp - AberturaBin2(temp,EE)');

subplot(2,3,6);
imagesc(I4)
colormap(gray)
title('I4 = temp1 - AberturaBin2(temp1,EE)');

