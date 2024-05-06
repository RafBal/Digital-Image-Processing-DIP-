function EG = GrayErosaoGeoN(M,Im,EE,Dz,N)

for(i=1:N)
   EG = GrayErosaoGeo1(M,Im,EE,Dz);
   M = EG;
end
