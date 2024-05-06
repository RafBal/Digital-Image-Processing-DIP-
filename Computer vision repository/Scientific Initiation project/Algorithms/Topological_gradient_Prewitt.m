% Operador de Prewitt 

close all
clc
clear all

I = imread('semaforo_pedestre.jpg');
I = double(I); % imagem com m linhas e n colunas 
[m,n] = size(I);

Gi = zeros(m,n); % derivada segundo linhas 
Gj= zeros(m,n);  % derivada segundo colunas 
Grad = zeros(m,n); % imagem de saída

for  i = 2:m-1 
    for  j = 2:n-1
        Gi(i,j) =  [ I(i+1,j-1) + I(i+1,j) + I(i+1,j+1) ] - [ I(i-1,j-1) + I(i-1,j) + I(i-1,j+1) ];
        Gj(i,j) = [ I(i-1,j+1) + I(i,j+1) + I(i+1,j+1) ] - [ I(i-1,j-1) + I(i,j-1) + I(i+1,j-1) ]; 
        Gradiente = round(sqrt (   Gi(i,j)^2  +  Gj(i,j) ^2  ) );
        if Gradiente > 6 % valor arbitrado 
            Grad(i,j) = 255; 
        end
    end
end

%Grad = watershed(Grad);
imagesc(Grad)
colormap gray
axis equal