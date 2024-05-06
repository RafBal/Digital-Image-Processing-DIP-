function y = HitOrMiss2(II,EE1,EE2)

% Erosao ===============================
I1 = ErosaoBin2(II,EE1);
IIc = ~II;
I2 = ErosaoBin2(IIc,EE2);

% II: Imagem ===========================
[mII,nII]= size(II);

% Criacao da imagem base
y=zeros(mII,nII);

% variacao linha (iII) e coluna (jII) da imagem II
for iII = 1:mII
for jII = 1:nII
    y(iII,jII) = I1(iII,jII) & I2(iII,jII);
end
end
