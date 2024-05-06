function DG = DilatacaoGeoGray1(M,Im,EE,Dz)

% Im: Imagem ===================================
[m,n]= size(Im);

% EE: Elemento Estruturante ====================
[mEE,nEE] = size(EE);
% mEE: numero de linhas
dr=ceil(mEE/2);
dr1=dr-1;
dr2=mEE-dr;
% nEE: numero de colunas
dc=ceil(nEE/2);
dc1=dc-1;
dc2=nEE-dc;

% Inicializacao das imagens base
%S = zeros(m,n);
DG = zeros(m,n);

% variacao linha (iIm) e coluna (jIm) da imagem Im
for i = dr:m-dr2
for j = dc:n-dc2
    k = 1;
    a = zeros(1,mEE*nEE);
    % variacao linha (iEE) e coluna (jEE) do elemento estruturante EE
    for iE = -dr1:dr2
    for jE = -dc1:dc2
        if( EE(dr+iE,dc+jE) == 1 )
           a(1,k) = M(i+iE,j+jE);
           k = k+1;
        end
    end
    end
    % Dilatacao
    S = max(a);
    % Dilatacao Geodesica
    if( abs( S-Im(i,j) ) < Dz )
        DG(i,j)=min( S , Im(i,j) );
    end
end
end
