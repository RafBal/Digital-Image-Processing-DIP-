function y = AfinaSerra1ciclo(Im)

% Afinamento de Serra => 1 ciclo

%Elementos estruturantes
B1  = [ 0 0 0 ; 0 1 0 ; 1 1 1 ];
B1C = [ 1 1 1 ; 0 0 0 ; 0 0 0 ];
B2  = [ 0 0 0 ; 1 1 0 ; 1 1 0 ];
B2C = [ 0 1 1 ; 0 0 1 ; 0 0 0 ];
B3  = [ 1 0 0 ; 1 1 0 ; 1 0 0 ];
B3C = [ 0 0 1 ; 0 0 1 ; 0 0 1 ];
B4  = [ 1 1 0 ; 1 1 0 ; 0 0 0 ];
B4C = [ 0 0 0 ; 0 0 1 ; 0 1 1 ];
B5  = [ 1 1 1 ; 0 1 0 ; 0 0 0 ];
B5C = [ 0 0 0 ; 0 0 0 ; 1 1 1 ];
B6  = [ 0 1 1 ; 0 1 1 ; 0 0 0 ];
B6C = [ 0 0 0 ; 1 0 0 ; 1 1 0 ];
B7  = [ 0 0 1 ; 0 1 1 ; 0 0 1 ];
B7C = [ 1 0 0 ; 1 0 0 ; 1 0 0 ];
B8  = [ 0 0 0 ; 0 1 1 ; 0 1 1 ];
B8C = [ 1 1 0 ; 1 0 0 ; 0 0 0 ];


filtro=1;

while(filtro<9)



end

for(i=1:8)
   Ib(:,:,i) = y - HitOrMiss2( y , B(:,:,i) , BC(:,:,i) );
   y = Ib(:,:,i);
end

