function y = DilatacaoGrayEEPlanarH(Im,EE)

% Im: Imagem ===========================
[m,n]= size(Im);

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

% Inicializacao da imagem base
y = zeros(m,n);

% variacao linha (iIm) e coluna (jIm) da imagem Im
for iIm = dr:m-dr2
for jIm = dc:n-dc2
    k = 1;
    a = zeros(1,mEE*nEE);
    % variacao linha (iEE) e coluna (jEE) do elemento estruturante EE
    for iEE = -dr1:dr2
    for jEE = -dc1:dc2
        if( EE(dr+iEE,dc+jEE) == 1 )
            a(1,k) = Im(iIm+iEE,jIm+jEE);
            k = k+1;
        end
    end
    end
    y(iIm,jIm) = max(a);
end
end
