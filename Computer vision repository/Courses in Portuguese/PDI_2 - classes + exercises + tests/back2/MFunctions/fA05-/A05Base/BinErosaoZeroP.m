function y = BinErosaoZeroP(II,EE,porcentagem)

% EE: Elemento Estruturante ===========
[mEE,nEE] = size(EE);
% mEE: numero de linhas
dr=ceil(mEE/2);
dr1=dr-1;
dr2=mEE-dr;
% nEE: numero de colunas
dc=ceil(nEE/2);
dc1=dc-1;
dc2=nEE-dc;
% maximo bits "1" em EE
nMax = mEE*nEE;

% II: Imagem ===========================
[mII,nII]= size(II);
% Criacao da imagem base
y=ones(mII,nII);

% variacao linha (iII) e coluna (jII) da imagem II
for iII = dr:mII-dr2
for jII = dc:nII-dc2
    nIgual = 0;
    for iEE = -dr1:dr2
    for jEE = -dc1:dc2
        if( EE(dr+iEE,dc+jEE) == II(iII+iEE,jII+jEE) )
          nIgual = nIgual+1;
        end
    end
    end
    if( nIgual/nMax >= porcentagem )
        y(iII,jII)=0;
    end
end
end
