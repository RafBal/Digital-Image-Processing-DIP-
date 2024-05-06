function [y,i] = BinSkeleton(Im,EE)

% A = Im  ====================================
% AkB =  A (-) kB ============================
% AkB_AkBoB = AkB - [AkB (o) B] ==============
% y = SA = Parcial ===========================

[m,n]=size(Im);
B = zeros(m,n);

AkB = Im;
i=0;

y = AkB - BinAbertura(AkB,EE);

while ( ~isequal(AkB,B) );
   AkB = BinErosao(AkB,EE);
   y = y | ( AkB - BinAbertura(AkB,EE) );
   i=i+1;
end
i
