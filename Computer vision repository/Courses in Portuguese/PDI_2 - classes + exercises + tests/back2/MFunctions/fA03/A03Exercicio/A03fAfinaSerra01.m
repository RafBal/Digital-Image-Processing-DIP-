clc;
clear all;
% =============================================================
Im = [
0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
0 0 0 1 1 1 1 1 1 1 1 1 1 1 0 0 0
0 0 0 1 1 1 1 1 1 1 1 1 0 0 0 0 0
0 0 0 1 1 1 1 1 1 1 1 1 0 0 0 0 0
0 0 0 1 1 1 1 1 1 1 1 1 0 0 0 0 0
0 0 0 1 1 1 0 0 1 1 1 1 0 0 0 0 0
0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
0 0 0 0 0 0 0 0 0 0 0 0 0 0 1 0 0
0 0 0 0 0 0 0 0 0 0 0 0 0 1 1 1 0
0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
];
Imc = ~Im;

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

% Processa ====================================================

Ia = HitOrMiss ( Im , B(:,:,1) );
Ib = HitOrMiss2( Im , B(:,:,1) , BC(:,:,1) );
Ic = cat ( 2 , B(:,:,1),BC(:,:,1)  );

I1 = ErosaoBin2(Im ,B (:,:,1));
I2 = ErosaoBin2(Imc,BC(:,:,1));
I3 = I1 & I2;

I4 = Im - I3;

% Mostrar Imagens =============================================

subplot(2,4,1);
imagesc(Im);
colormap(gray);
title('Imagem');

subplot(2,4,2);
imagesc(Ia);
colormap(gray);
title('Ia = HitOrMiss(Im,B (:,:,1))');

subplot(2,4,3);
imagesc(Ib);
colormap(gray);
title('Ib = HitOrMiss2( Im , B(:,:,1) , BC(:,:,1) )');

subplot(2,4,4);
imagesc(Ic);
colormap(gray);
title('Ic = cat( 2 , B(:,:,1),BC(:,:,1)  )');


subplot(2,4,5);
imagesc(I1);
colormap(gray);
title('I1 = ErosaoBin2(Im,B(:,:,1))');

subplot(2,4,6);
imagesc(I2);
colormap(gray);
title('I2 = ErosaoBin2(Imc,BC(:,:,1))');

subplot(2,4,7);
imagesc(I3);
colormap(gray);
title('I3 =  I1 & I2 <Hit or Miss>');

subplot(2,4,8);
imagesc(I4);
colormap(gray);
title('I4 = Im - I3 <Afinamento Serra: 1 ciclo>');

% =============================================================
