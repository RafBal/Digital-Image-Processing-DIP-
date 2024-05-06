close all
clc
clear all

% Exercício de segmentação
I = imread('imagem2.tif');
 [m,n] = size(I); 
I = double(I);
I = I/255;

% 1 semente
R = zeros(m,n);
ns = 1; % num sementes
% s(:,:,1) = R;
% s(:,:,2) = G;
% s(:,:,3) = B;
s = 255;
r = 1 ; % identifica regiões 
s_lin = 312; % local. sementes (linhas)
s_col = 288; % local. sementes (colunas)
T = 30; % limiar T

for i = 1:ns
    R(s_lin,s_col) = r;
end

it = 1;
R1 = R(2:m-1,2:n-1);
while it<100
%while min(min(R)) == 0
 
for i = 2:m-1
    for j = 2:n-1
        for k = -1:1 
            for l = -1:1
                % conectividade 8
if R(i,j) ~= 0 & R(i+k,j+l) == 0
    if R(i,j) == r & ( abs( s - I(i+k,j+l) ) <= T )
        R(i+k,j+l) = r(1); 
    end
end
end %end l
        end %end k 
    end
end
%Para a próxima iteração: 
it = it +1 
end
%end
imagesc(R)
colormap gray