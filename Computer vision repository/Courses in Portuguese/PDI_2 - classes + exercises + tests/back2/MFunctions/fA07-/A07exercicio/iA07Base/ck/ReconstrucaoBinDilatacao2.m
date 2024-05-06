function [y,k] = ReconstrucaoBinDilatacao2(F,G,EE)

ya=zeros( size(F) );
y = F;
k=-1;

while( ~isequal(y,ya) )
   ya = y;
   % Dilatacao & G ===========
   y = DilatacaoBin(y,EE) & G;
   k=k+1;
end
