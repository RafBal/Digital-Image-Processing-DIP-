close all
clc
clear all

I = [1 1 9 9 9
     1 1 9 9 9
     5 1 1 9 9
     5 5 5 4 9
     6 6 6 6 4];
 
 s1 = I(2,2);
 s2 = I(2,4);
 s3 = I(4,2);
 
 [m,n] = size(I); 
 R = zeros(m,n); %inicialização da imagem de saída
 ns = 3; % num sementes 
 s = [ 1  9  5] ; % valor sementes 
 s_lin =  [2  2  4] % local. sementes (linhas) 
 s_col = [2  4  2] % local. sementes (colunas) 
 r = [ 1  2  3] ; % identifica região 
 T = 2; % limiar T 
 % atribuindo em R o valor (identificação) de cada região 
 for i = 1:ns 
     R(s_lin(i), s_col(i)) = r(i) 
 end
 
 it = 1; %Para a primeira iteração:
 while min(min(R)) == 0
 
for i = 2:m-1
    for j = 2:n-1
        for k = -1:1 
            for l = -1:1
                % conectividade 8
if R(i,j) ~= 0 & R(i+k,j+l) == 0
    if R(i,j) == r(1) & ( abs( s(1) - I(i+k,j+l) ) <= T )
        R(i+k,j+l) = r(1); 
    end
    if R(i,j) == r(2) & ( abs( s(2) - I(i+k,j+l) ) <= T )
        R(i+k,j+l) = r(2); 
    end
    if R(i,j) == r(3) & ( abs( s(3) - I(i+k,j+l) ) <= T )
        R(i+k,j+l) = r(3) 
    end
end
end %end l
        end %end k 
    end
end
%Para a próxima iteração: 
it = it +1 
 end
imagesc(R)
colormap gray