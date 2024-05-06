function y = GrayDilatacaoEEB(Im,EE)

% Im: Imagem ===========================
[m,n]= size(Im);

% EE: Elemento Estruturante ===========
[mE,nE] = size(EE);
% mE: numero de linhas
dr=ceil(mE/2);
dr1=dr-1;
dr2=mE-dr;
% nE: numero de colunas
dc=ceil(nE/2);
dc1=dc-1;
dc2=nE-dc;

% Inicializacao da imagem base
y = Im;

% variacao linha (iIm) e coluna (jIm) da imagem Im
for iIm = dr:m-dr2
for jIm = dc:n-dc2
    a = zeros(1,mE*nE);
    k = 1;
    % variacao linha (iE) e coluna (jE) do elemento estruturante EE
    for iE = -dr1:dr2
    for jE = -dc1:dc2
        if(EE(dr+iE,dc+jE) ~= 0)
           a(1,k) = Im(iIm+iE,jIm+jE);
           k = k+1;
        end
    end
    end
    y(iIm,jIm) = max(a);
end
end
