function y = BinDilatacaoGeoN(F,G,EE,n)

y = F;

for(i=1:n)
   % Dilatacao ===========
   y = BinDilatacaoEE(y,EE) & G;
end
