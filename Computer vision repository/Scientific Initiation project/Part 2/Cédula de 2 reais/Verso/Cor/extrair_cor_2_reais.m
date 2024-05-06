close all
clc
clear all

E = imread('2_reais_verso.jpg');
[m,n,k] = size(E);
% conversão uint8 para double
E = double(E);

R = E(:,:,1)/255;
G = E(:,:,2)/255;
B = E(:,:,3)/255;


I = zeros(m,n);
H = zeros(m,n);
S = zeros(m,n);

for i = 1:m
    for j = 1:n
if (R(i,j) == G(i,j)) & (R(i,j) == B(i,j))
S(i,j) = 0;
else
    
    % intensidade
I(i,j) = ( R(i,j) + G(i,j) + B(i,j)) / 3;

    % saturação
a = min([ R(i,j) G(i,j) B(i,j) ] );
S(i,j) = 1 - (3 * a) / ( R(i,j)+ G(i,j) + B(i,j) ) ;

    % matiz
num = ( R(i,j) - G(i,j) ) + (R(i,j) - B(i,j) ) ;
den = 2 * sqrt ( ( R(i,j) - G(i,j) )^2 + (R(i,j) - B(i,j)) * (G(i,j) - B(i,j) ) );
theta = acosd(num/den); % acosd serve para obter ângulo em graus.
% pode ser também: theta = (theta*360)/(2*pi)

if B(i,j) <= G(i,j)
H(i,j) = theta;
elseif B(i,j) > G(i,j)
H(i,j) = 360 - theta ;
end
end
    end
end

HSI(:,:,1) = H;
HSI(:,:,2) = S;
HSI(:,:,3) = I;

maiorvalorh = 0;
maiorvalors = 0;
maiorvalori = 0;
menorvalorh = 1000;
menorvalors = 1000;
menorvalori = 1000;

for l = 1:m
    for j = 1:n
        h = H(l,j);
        s = S(l,j);
        i = I(l,j);
        if maiorvalorh < h
            maiorvalor = h;
        end
        if menorvalorh > h
            menorvalor = min(h);
        end
        if maiorvalors < s
            maiorvalors = s;
        end
        if menorvalors > s
            menorvalors = s;
        end
        if maiorvalori < i
            maiorvalori = i;
        end
        if menorvalori > i
            menorvalori = i;
        end
    end
end
subplot(3,1,1)
imagesc(R)
colormap gray
axis equal
title('Matriz vermelha')
subplot(3,1,2)
imagesc(G)
colormap gray
title('Matriz verde')
axis equal
subplot(3,1,3)
imagesc(B)
colormap gray
title('Matriz azul')
axis equal

figure

subplot(3,1,1)
imagesc(H)
colormap gray
title('Matiz')
axis equal
subplot(3,1,2)
imagesc(S)
colormap gray
title('Saturação')
axis equal
subplot(3,1,3)
imagesc(I)
colormap gray
title('Intensidade')
axis equal

maiorvalorh 
menorvalorh
maiorvalors 
menorvalors
maiorvalori 
menorvalori