clc 
clear all
% Variável: NDVI    
% definir (a,b),(c,d)
a = 0;
b = 100;
c = 80;
d = 110;

% Variável: elevação
% definir (e,f),(g,h)
e = 0;
f = 2;
g = 1;
h = 4;

NDVI = imread('ndvi.tif');
NDVI = double(NDVI);
MDSn = imread('MDSn_metros.tif');
MDSn = double(MDSn);
[m,n] = size(MDSn);

Classes = zeros(m,n);
% 1 = gramado
% 2 = árvore
% 3 = solo/asfalto
% 4 =telhado

for i = 1:m
    for j = 1:n
        
        ndvi = NDVI(i,j);
        
        if ndvi < b
            ndvi_baixo = (b-ndvi)/(b-a);
        end
        if ndvi > b
            ndvi_baixo = 0;
        end
        if ndvi <= c
            ndvi_alto = 0;
        end
        if ndvi > c & ndvi <= d
            ndvi_alto = (ndvi-c)/(d-c);
        end
        if ndvi > d 
            ndvi_alto = 1;
        end
        
        
        altura = MDSn(i,j);
        
        if altura <= f
            altura_baixo = (f-altura)/(f-e);
        end
        if altura > f
            altura_baixo = 0;
        end
        if altura <= g
            altura_alto = 0;
        end
        if altura > g & altura <= h 
            altura_alto = (altura-g)/(h-g);
        end
        if altura >= h 
            altura_alto = 1;
        end
        
        % Cálculo da conclusão de cada regra
        r1 = min(altura_baixo, ndvi_alto);
        r2 = min(altura_alto, ndvi_alto);
        r3 = min(altura_baixo, ndvi_baixo);
        r4 = min(altura_alto, ndvi_baixo);
        
        % Conclusão final para o pixel(i,j)
        Classes(i,j) = round((r1*1 + r2*2 + r3*3 + r4*4)/(r1+r2+r3+r4));
    end
end
Classes = uint8(Classes);
    imwrite(Classes,'classesfuzzy.tif','compress', 'none')
    
        