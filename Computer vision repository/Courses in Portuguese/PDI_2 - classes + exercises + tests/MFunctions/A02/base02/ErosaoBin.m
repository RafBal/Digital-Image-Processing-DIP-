function y = ErosaoBin(Im,EE)

% EE: Elemento Estruturante ===========
[me,ne] = size(EE);
% me: numero de linhas
dr=ceil(me/2);
dr1=dr-1;
dr2=me-dr;
% ne: numero de colunas
dc=ceil(ne/2);
dc1=dc-1;
dc2=ne-dc;
% contagem de bits "1" no EE
nEE=0;
for iEE=1:me
  for jEE=1:ne
    if( EE(iEE,jEE)==1 )
      nEE=nEE+1;
    end
  end
end
% Im: Imagem ===========================
[m,n]= size(Im);
% Criacao da imagem base
y=zeros(m,n);

% variacao linha (iIm) e coluna (jIm) da imagem Im
for iIm = dr:m-dr2
for jIm = dc:n-dc2
    nAtivo = 0;
    for iEE = -dr1:dr2
    for jEE = -dc1:dc2
        if( (EE(dr+iEE,dc+jEE)==1) & (Im(iIm+iEE,jIm+jEE)==1) )
          nAtivo = nAtivo+1;
        end
    end
    end
    if( nAtivo == nEE )
        y(iIm,jIm)=1;
    end
end
end
