function RD = GrayReconstrucaoDilatacao(M,Im,EE,Dz)

RD = GrayDilatacaoGeo1(M,Im,EE,Dz);

while( ~isequal( RD,M ) )
   M = RD;
   RD = GrayDilatacaoGeo1(M,Im,EE,Dz);
end
