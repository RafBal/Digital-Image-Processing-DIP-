function y = CriarEECircular1(nEE)

% mEE = nEE: numero de linhas igual numero de colunas
dc=ceil(nEE/2);
dc1=dc-1;
dc2=nEE-dc;

% Inicializacao da imagem base
y = zeros(nEE,nEE);

% variacao linha (iEE) e coluna (jEE) do elemento estruturante EE
for iEE = -dc1:dc2
for jEE = -dc1:dc2
    if sqrt( (dc - (dc+iEE)) ^2 + (dc - (dc+jEE)) ^2 ) <= (dc1+0.4)
       y(dc+iEE,dc+jEE) = 1;
    end
end
end
