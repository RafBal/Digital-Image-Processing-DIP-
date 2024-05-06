function EE = CriarEECircular1(nEE)

% mEE = nEE: numero de linhas igual numero de colunas
dc=ceil(nEE/2);
dc1=dc-1;
dc2=nEE-dc;

% Inicializacao da imagem base
EE = zeros(nEE,nEE);

% variacao linha (iE) e coluna (jE) do elemento estruturante EE
for iE = -dc1:dc2
for jE = -dc1:dc2
    if sqrt( (dc - (dc+iE)) ^2 + (dc - (dc+jE)) ^2 ) <= (dc1+0.4)
       EE(dc+iE,dc+jE) = 1;
    end
end
end
