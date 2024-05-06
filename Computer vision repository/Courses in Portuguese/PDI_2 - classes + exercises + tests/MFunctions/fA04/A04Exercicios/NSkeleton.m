function y = Skeleton(Im,EE,n)

% A = Im  ====================================
% AkB =  A (-) kB ============================
% AkB_AkBoB = AkB - [AkB (o) B] ==============
% y = SA = Parcial ===========================

AkB = Im;
y = AkB - AberturaBin2(AkB,EE);


for(k=1:n)
   AkB = ErosaoBin2(AkB,EE);
   y = y | ( AkB - AberturaBin2(AkB,EE) );
end
