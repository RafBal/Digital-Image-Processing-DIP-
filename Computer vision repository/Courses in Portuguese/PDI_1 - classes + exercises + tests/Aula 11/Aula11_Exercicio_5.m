close all
clc
clear all

I = imread('MDS8bits.tif');
I = double(I);
[m,n] = size(I);
resol = 0.7;
% Gerar imagens de saída: 
Dec = zeros(m,n);  % Declividade
Asp = zeros(m,n);  % Aspecto
for  i = 2:m-1 
    for  j = 2:n-1
        b = ( I(i-1,j+1) + 2*I(i,j+1) + I(i+1,j+1)  - I(i-1,j-1) - 2*I(i,j-1) - I(i+1,j-1) ) / (8*resol); 
        c =  ( I(i-1,j-1) + 2*I(i-1,j) + I(i-1,j+1)  - I(i+1,j-1) - 2*I(i+1,j) - I(i+1,j+1) ) / (8*resol); 
        Dec(i,j) = round(atand(sqrt( b^2 + c^2 ))); if c ~= 0 Asp(i,j) = round(atand(b /c)) ; 
            if c > 0 
                Asp(i,j) = 180 + Asp(i,j);
            elseif c < 0 & b > 0 
                Asp(i,j) = 360 + Asp(i,j);
            end
        end
    end
end
for i = 2:m-1
    for j = 2:n-1
        if Asp(i,j) >=22.5 & Asp(i,j) < 67.5
        Asp(i,j) = 100;
        elseif Asp(i,j) >= 292.5 & Asp(i,j) <337.5
            Asp(i,j) = 100;
        else
            Asp(i,j) = 200;
        end
    end
end
        
subplot(2,1,1)
imagesc(Dec)
colormap gray
axis equal
subplot(2,1,2)
imagesc(Asp)
colormap gray
axis equal