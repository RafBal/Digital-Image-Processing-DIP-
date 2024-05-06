close all
clc
clear all

% mapeamento direto: coordenadas u,v de imagem para sistema x,y

C = imread('cubo.tif');
PB = imread('planoB255.tif');
PR = imread('planoR255.tif');
% Cubo:        PlanoB225:  
    %(linha,coluna)
%(155,155) == (1,1); 
%(155,423) == (1,255)
%(423,423) == (255,255)
%(423,155) == (255,1)
    
B = [155 155 423 423; 155 423 423 155; 1 1 1 1]; % cubo para o plano B
A = [1 1 255 255; 1 255 255 1; 1 1 1 1];    % plano B e R
    %linha/        /coluna

    
    % 3B4 = 3X3*3A4
    % 3B*A' = X*3
   
    X = B*A'*inv(A*A');
    
% Cubo:   (linha,coluna)
%Pt1 = (155,155)
%Pt2 = (155,423)
%Pt3 = (423,423)
%Pt4 = (423,155)
 
 % Cubo:        PlanoR225:  
    %(linha,coluna)
    %(68,66) == (1,1); 
    %(154,151) == (1,255)
    %(420,151) == (255,255)
    %(335,66) == (255,1)

    R = [68 154 420 335; 66 151 151 66; 1 1 1 1]; % cubo para o plano R
   Y = R*A'*inv(A*A');
    
    [m,n,k] = size(PB);
for i = 1:m
for j = 1:n
    % (i,j) corresponde a (Xp,Yp)
A1 = [i
      j
      1];
  
R1 = Y*A1;  
B1 = X*A1; 
    %vizinho mais próximo
v = round(B1(1));  % equivale à linha
u = round(B1(2));  % equivale à coluna
 
% preenchimento da imagem de saída
C(v, u, 1) = PB(i,j,1);
C(v, u, 2) = PB(i,j,2);
C(v, u, 3) = PB(i,j,3);

v = round(R1(1));  % equivale à linha
u = round(R1(2));  % equivale à coluna
 
% preenchimento da imagem de saída
C(v, u, 1) = PR(i,j,1);
C(v, u, 2) = PR(i,j,2);
C(v, u, 3) = PR(i,j,3);

end
end
imagesc(C)
% Mapeamento direto apresenta falha.