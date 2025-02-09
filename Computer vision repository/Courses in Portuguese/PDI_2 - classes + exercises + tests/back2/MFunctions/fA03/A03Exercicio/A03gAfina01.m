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

Af1 = Im   - HitOrMiss2( Im   , B(:,:,1) , BC(:,:,1) );
Af2 = Af1 - HitOrMiss2( Af1 , B(:,:,2) , BC(:,:,2) );
Af3 = Af2 - HitOrMiss2( Af2 , B(:,:,3) , BC(:,:,3) );



% Mostrar Imagens ============================================================

subplot(1,4,1);
imagesc(Im);
colormap(gray);
title('Imagem');

subplot(1,4,2);
imagesc(Af1);
colormap(gray);
title('Af1 = Im - HitOrMiss2( Im , B(:,:,1) , BC(:,:,1) )');

subplot(1,4,3);
imagesc(Af2);
colormap(gray);
title('Af2 = Af1 - HitOrMiss2( Af1 , B(:,:,2) , BC(:,:,2) )');

subplot(1,4,4);
imagesc(Af3);
colormap(gray);
title('Af3 = Af2 - HitOrMiss2( Af2 , B(:,:,3) , BC(:,:,3) )');

% =============================================================
