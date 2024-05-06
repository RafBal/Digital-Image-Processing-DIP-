function y = DilatacaoGeoGrayN(F,G,EE,N)

y = F;

for(i=1:N)
   y = min( DilatacaoGrayEEPlanarH(y,EE) , G );
end


