function y = SkeletonN(Im,EE,N)

% A = Im  ====================================
% AkB =  A (-) kB ============================
% AkB_AkBoB = AkB - [AkB (o) B] ==============
% y = SA = Parcial ===========================

AkB = Im;
y = AkB - AberturaBin2(AkB,EE);

for(k=1:N)
   AkB = ErosaoBin2(AkB,EE);
   y = y | ( AkB - AberturaBin2(AkB,EE) );
end
