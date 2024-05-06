function y = HitOrMiss(II,EE)

% Erosao ===============================
I1 = BinErosao(II,EE);
I0 = BinErosaoZero(II,EE);

% II: Imagem ===========================
[mII,nII]= size(II);

% Criacao da imagem base
y=zeros(mII,nII);

% variacao linha (iII) e coluna (jII) da imagem II
for iII = 1:mII
for jII = 1:nII
    if( (I1(iII,jII)==1) & (I0(iII,jII)==0) )
         y(iII,jII) = 1;
    end
end
end
