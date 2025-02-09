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

% ciclo 1
for(i=1:8)
   Af1(:,:,i) = Ia - HitOrMiss2( Ia , B(:,:,i) , BC(:,:,i) );
   Ia = Af1(:,:,i);
end

% ciclo 2
for(i=1:8)
   Af2(:,:,i) = Ia - HitOrMiss2( Ia , B(:,:,i) , BC(:,:,i) );
   Ia = Af2(:,:,i);
end


% Mostrar Imagens ============================================================

subplot(3,8,1);
imagesc(Im);
colormap(gray);
title('Im'); 

for(i=1:8)
   subplot(3,8,8+i);
   imagesc( Af1(:,:,i) );
   colormap(gray);
   titulo = cat(2,'Af1_',num2str(i));
   title(titulo);

   subplot(3,8,16+i);
   imagesc( Af2(:,:,i) );
   colormap(gray);
   titulo = cat(2,'Af2_',num2str(i));
   title(titulo);

end

% =============================================================
