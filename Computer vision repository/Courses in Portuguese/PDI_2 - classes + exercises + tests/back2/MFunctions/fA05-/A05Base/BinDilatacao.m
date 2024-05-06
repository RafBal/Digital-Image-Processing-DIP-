function y = BinDilatacao(Im,EE)

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

% Im: Imagem ===========================
[m,n]= size(Im);
% Criacao da imagem base
y=zeros(m,n);

% variacao linha (iIm) e coluna (jIm) da imagem Im
for iIm = dr:m-dr2
for jIm = dc:n-dc2
      if( Im(iIm,jIm)==1 )
          for iEE = -dr1:dr2
          for jEE = -dc1:dc2
                if( EE(dr+iEE,dc+jEE)==1 )
                    y(iIm+iEE,jIm+jEE)=1;
                end
          end
          end
      end %end if
end
end
