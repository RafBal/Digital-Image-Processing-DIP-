function DG = GrayDilatacaoGeoN(M,Im,EE,Dz,N)

for(i=1:N)
   DG = GrayDilatacaoGeo1(M,Im,EE,Dz);
   M = DG;
end


