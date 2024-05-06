I = [0 0 0 0 0 0 0
     0 1 1 1 0 1 0
     0 1 0 1 0 0 0
     0 1 1 1 0 1 0
     0 0 0 0 0 0 0
     0 1 1 1 1 0 0
     0 0 0 0 0 0 0
     ]
     
EE = [0 1 0
      1 1 1
      0 1 0]
      
      [me,ne] = size(EE)
[m,n]= size(I);
% para EE quadrado: me = ne
d1 = ceil(me/2);  % DELIMITA O CENTRO DO EE
d2 = floor(ne/2);  % DELIMITA A QUANTIDADE DE LINHAS E COLUNAS QUE SERÃO PERCORRIDAS A PARTIR DO CENTRO
%DILATAÇÃO
S1 = zeros(m,n);
for i = d1:m-d2 % FAZ COM QUE O CENTRO DO EE NÃO PERCORRA EXTREMA ESQUERDA OU DIREITA
for j = d1:n-d2  % FAZ COM QUE O CENTRO DO EE NÃO PERCORRA PARA PRIMEIRO E PARA ÚLTIMO
if I(i,j) == 1
for k = -d2:d2
for l = -d2:d2
if EE(d1+k,d1+l)== 1  
    S1(i+k,j+l) = 1;
end
end
end
end
end
end
%EROSÃO
S2 = zeros(m,n);
for i = d1:m-d2
for j = d1:n-d2
ind = 0;
for k = -d2:d2
for l = -d2:d2
    if EE(d1+k,d1+l) == 1 & S1(i+k,j+l) == 1
ind = ind+1;
end
end
end
if ind == 5
    S2(i,j) = S1(i,j);
end
end
end

imagesc(S2)
colormap(gray)