function y = ReconstrucaoGrayDilatacao(M,Im,EE,Dz)

[m,n] = size(F);

ya=zeros(m,n);
y = F;
k=0
maximo=100;

while( maximo > 1 )
   S = DilatacaoGrayEEPlanar2(y,EE);

   R=zeros(m,n);
   for(i=1:m)
   for(j=1:n)
      if( abs( S(i,j)-G(i,j) ) < z )
         R(i,j) = min( S(i,j) , G(i,j) );
      end
   end
   end

   dif = abs(y-R);
   maximo = max( max( dif ) );
   y = R;
   k=k+1
end
k
