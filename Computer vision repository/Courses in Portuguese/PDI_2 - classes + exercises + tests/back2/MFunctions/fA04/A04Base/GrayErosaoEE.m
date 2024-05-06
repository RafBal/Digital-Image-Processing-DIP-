function y = GrayErosaoEE(Im,EE)

% Im: Imagem ===========================
[m,n]= size(Im);

% EE: Elemento Estruturante ===========
[mEE,nEE] = size(EE);
% mEE: numero de linhas de EE
dr=ceil(mEE/2);
dr1=dr-1;
dr2=mEE-dr;
% nEE: numero de colunas de EE
dc=ceil(nEE/2);
dc1=dc-1;
dc2=nEE-dc;

% Inicializacao da imagem base
y = Im;

% variacao linha (iIm) e coluna (jIm) da imagem Im
for iIm = dr:m-dr2
for jIm = dc:n-dc2
    a = zeros(1,mEE*nEE);
    k = 1;
    % variacao linha (iEE) e coluna (jEE) do elemento estruturante EE
    for iEE = -dr1:dr2
    for jEE = -dc1:dc2
        a(1,k) = Im(iIm+iEE,jIm+jEE) - EE(dr+iEE,dc+jEE) ;
        k = k+1;
    end
    end
    y(iIm,jIm) = min(a);
end
end
