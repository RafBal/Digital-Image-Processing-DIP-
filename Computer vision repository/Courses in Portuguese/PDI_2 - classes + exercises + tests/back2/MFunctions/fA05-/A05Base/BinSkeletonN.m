function y = BinSkeletonN(Im,EE,N)

% A = Im  ====================================
% AkB =  A (-) kB ============================
% AkB_AkBoB = AkB - [AkB (o) B] ==============
% y = SA = Parcial ===========================

AkB = Im;
y = AkB - BinAbertura(AkB,EE);

for(k=1:N)
   AkB = BinErosao(AkB,EE);
   y = y | ( AkB - BinAbertura(AkB,EE) );
end
