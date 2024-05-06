clc;
clear all;
% ==============================
% F = imagem marcador
% G = imagem (mascara)
% EE = Elemento Estruturante
% ==============================

G = imread('Mapa1a.tif');

F = zeros( size(G) );
F(10,25) = G(10,25);
F(5,35) = G(5,35);
F(45,35) = G(45,35);

EE = [
0 1 0
1 1 1
0 1 0
];

z=6

% Processamento ==============================

A = GrayDilatacaoEEPlanarH(G,EE);

R1  = GrayDilatacaoGeoN(F  ,G,EE,z,2);
R2  = GrayDilatacaoGeoN(R1 ,G,EE,z,5);
R3  = GrayDilatacaoGeoN(R2 ,G,EE,z,5);
R4  = GrayDilatacaoGeoN(R3 ,G,EE,z,5);
R5  = GrayDilatacaoGeoN(R4 ,G,EE,z,5);
R6  = GrayDilatacaoGeoN(R5 ,G,EE,z,5);
R7  = GrayDilatacaoGeoN(R6 ,G,EE,z,5);
R8  = GrayDilatacaoGeoN(R7 ,G,EE,z,5);
R9  = GrayDilatacaoGeoN(R8 ,G,EE,z,5);
R10 = GrayDilatacaoGeoN(R9 ,G,EE,z,5);
R11 = GrayDilatacaoGeoN(R10,G,EE,z,5);

% Mostrar Imagens ==================================

subplot(3,5,1);
imagesc(G);
colormap(gray);
xlabel('G = Mascara');

subplot(3,5,2);
imagesc(F);
colormap(gray);
xlabel('Marcador F');

subplot(3,5,3);
imagesc(EE,[0,1]);
colormap(gray);
xlabel('EE');

subplot(3,5,4);
imagesc(A);
colormap(gray);
xlabel('A = GrayDilatacaoEEPlanarH(G,EE)');

subplot(3,5,5);
imagesc(R1);
colormap(gray);
xlabel('R1 = GrayDilatacaoGeo1(F/R1 ,G,EE,z)');

%--------------------------------------------

subplot(3,5,6);
imagesc(R2);
colormap(gray);
xlabel('R2 = GrayDilatacaoGeo1(R1/R2,G,EE,z)');

subplot(3,5,7);
imagesc(R3);
colormap(gray);
xlabel('R3 = GrayDilatacaoGeo1(R2/R3,G,EE,z)');

subplot(3,5,8);
imagesc(R4);
colormap(gray);
xlabel('R4 = GrayDilatacaoGeo1(R3/R4,G,EE,z)');

subplot(3,5,9);
imagesc(R5);
colormap(gray);
xlabel('R5 = GrayDilatacaoGeo1(R4/R5,G,EE,z)');

subplot(3,5,10);
imagesc(R6);
colormap(gray);
xlabel('R6 = GrayDilatacaoGeo1(R5/R6,G,EE,z)');

%--------------------------------------------

subplot(3,5,11);
imagesc(R7);
colormap(gray);
xlabel('R7 = GrayDilatacaoGeo1(R6/R7,G,EE,z)');

subplot(3,5,12);
imagesc(R8);
colormap(gray);
xlabel('R8 = GrayDilatacaoGeo1(R7/R8,G,EE,z)');

subplot(3,5,13);
imagesc(R9);
colormap(gray);
xlabel('R9 = GrayDilatacaoGeo1(R8/R9,G,EE,z)');

subplot(3,5,14);
imagesc(R10);
colormap(gray);
xlabel('R10 = GrayDilatacaoGeo1(R9/R10,G,EE,z)');

subplot(3,5,15);
imagesc(R11);
colormap(gray);
xlabel('R11 = GrayDilatacaoGeo1(R10/R11,G,EE,z)');

%--------------------------------------------
