function y = DilatacaoGeoBinN(F,G,EE,n)

y = F;

for(i=1:n)
   % Dilatacao ===========
   y = DilatacaoBin(y,EE) & G;
end
