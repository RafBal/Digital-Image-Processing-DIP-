function y = Skeleton(Im,EE)

% A = Im  ====================================
% AkB =  A (-) kB ============================
% AkB_AkBoB = AkB - [AkB (o) B] ==============
% y = SA = Parcial ===========================

[m,n]=size(Im);
B = zeros(m,n);

AkB = Im;
i=0;

y = AkB - AberturaBin2(AkB,EE);

while ( ~isequal(AkB,B) );
   AkB = ErosaoBin2(AkB,EE);
   y = y | ( AkB - AberturaBin2(AkB,EE) );
   i=i+1;
end
i
