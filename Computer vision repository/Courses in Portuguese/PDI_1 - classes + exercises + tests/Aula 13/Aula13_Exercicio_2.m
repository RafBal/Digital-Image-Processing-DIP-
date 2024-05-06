close all
clc
clear all

I = imread('blocos.tif');
 [m,n] = size(I); 

% 3 sementes
R = zeros(m,n);
ns = 3; % num sementes
s = [ 30 117 225] ; % valor sementes
r = [ 1 2 3] ; % identifica regiões 
s_lin = [92 13 77] % local. sementes (linhas)
s_col = [81 56 28] % local. sementes (colunas)
T = 30; % limiar T

for i = 1:ns
    R(s_lin(i),s_col(i)) = r(i);
end

it = 1;
R1 = R(2:m-1,2:n-1);
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
        R(i+k,j+l) = r(3); 
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