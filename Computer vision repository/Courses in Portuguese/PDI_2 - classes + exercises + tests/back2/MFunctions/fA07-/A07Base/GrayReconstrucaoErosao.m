function RE = GrayReconstrucaoErosao(M,Im,EE,Dz)

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

maximo = 100;

while(maximo>1)
%============================================================================

% Inicializacao das imagens base
RE = 255*ones(m,n);
S  = 255*ones(m,n);

% variacao linha (iIm) e coluna (jIm) da imagem Im
for i = dr:m-dr2
for j = dc:n-dc2
    k = 1;
    a = 255*ones(1,mEE*nEE);
    % variacao linha (iEE) e coluna (jEE) do elemento estruturante EE
    for iE = -dr1:dr2
    for jE = -dc1:dc2
        if( EE(dr+iE,dc+jE) == 1 )
           a(1,k) = M(i+iE,j+jE);
           k = k+1;
        end
    end
    end
    % Dilatacao: It (S) does not need a vector
    S(i,j) = min(a);
    % Dilatacao Geodesica
    %if( abs( S(i,j)-Im(i,j) ) < Dz )
    %    EG(i,j) = max( S(i,j) , Im(i,j) );
    %end
end
end

for i = 1:m
for j = 1:n
    if( abs( S(i,j)-Im(i,j) ) < Dz )
        RE(i,j) = max( S(i,j) , Im(i,j) );
    end
end
end

Dif = abs(M - RE);
maximo = max(max(Dif));
M = RE;

%============================================================================
end
