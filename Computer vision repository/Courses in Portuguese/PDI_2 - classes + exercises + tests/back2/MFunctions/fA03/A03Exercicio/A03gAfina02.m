clc;
clear all;
% =============================================================
Im = [
0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
0 0 1 1 1 1 1 1 1 1 1 1 1 0 0
0 0 1 1 1 1 1 1 1 1 1 0 0 0 0
0 0 1 1 1 1 1 1 1 1 1 0 0 0 0
0 0 1 1 1 1 1 1 1 1 1 0 0 0 0
0 0 1 1 1 0 0 1 1 1 1 0 0 0 0
0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
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

Ia=Im;

for(i=1:8)
   Af(:,:,i) = Ia - HitOrMiss2( Ia , B(:,:,i) , BC(:,:,i) );
   Ia = Af(:,:,i);
end


% Mostrar Imagens ============================================================

subplot(3,4,1);
imagesc(Im);
colormap(gray);
title('Im'); 

for(i=1:8)
   subplot(3,4, 4+i );
   imagesc( Af(:,:,i) );
   colormap(gray);

   titulo = cat(2,'Af',num2str(i));
   title(titulo);
end


