function y = BinErosaoGeoN(F,G,EE,N)

y = F;

for(i=1:N)
   % Erosao ===========
   y = BinErosaoEE(y,EE) | G;
end
