I = imread('AeroportoBacacheri.tif');
    I = double(I);
[m,n] = size(I);
% definição do filtro F com dimensão 
%  mf x mf (quadrado) 
mf= 3;
% especificação do elemento estruturante 

E =[0 1 0
    1 1 1
    0 1 0];


d1 = floor(mf/2);
d2 =ceil(mf/2); 
% imagem de saída 
S1 = zeros(m,n);
for  i = d2:m-d1 
    for  j = d2:n-d1
a = 255*ones(1,mf*mf);
ind = 1; 
for k = -d1:d1
    for l = -d1:d1 
        if  E(d2+k,d2+l) == 1 
            a(1,ind) =  I(i+k, j+l);
            ind = ind+1; 
        end
    end
end
S1(i,j) = min(a');
    end
end
imagesc(S1)
colormap gray