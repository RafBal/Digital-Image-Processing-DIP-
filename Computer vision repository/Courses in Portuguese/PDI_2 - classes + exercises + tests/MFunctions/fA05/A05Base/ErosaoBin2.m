function y = ErosaoBin2(Im,EE)

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

% Im: Imagem ===========================
[m,n]= size(Im);
% Criacao da imagem base
y=zeros(m,n);

% variacao linha (iIm) e coluna (jIm) da imagem Im
for iIm = dr:m-dr2
for jIm = dc:n-dc2
    k = 1;
    % variacao linha (iEE) e coluna (jEE) do elemento estruturante EE
    for iEE = -dr1:dr2
    for jEE = -dc1:dc2
        if( (EE(dr+iEE,dc+jEE)~=0) )
          a(k) = EE( dr+iEE, dc+jEE);
          b(k) = Im(iIm+iEE,jIm+jEE);
          k = k+1;
        end
    end
    end
    if( a == b )
        y(iIm,jIm)=1;
    end
    clear a;
    clear b;
end
end
