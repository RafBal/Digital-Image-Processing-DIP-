function y = BinHitOrMiss2(II,EE)

% Erosao ===============================
I1 = BinErosao(II,EE1);
EEc = ~EE;
IIc = ~II;
I2 = BinErosao(IIc,EEc);

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
