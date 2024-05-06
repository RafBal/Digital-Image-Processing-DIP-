function y = HitOrMiss3(II,EE,porcentagem)

% Erosao ===============================
I1 = ErosaoBinP(II,EE,porcentagem);
I0 = ErosaoZeroBinP(II,EE,porcentagem);

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
