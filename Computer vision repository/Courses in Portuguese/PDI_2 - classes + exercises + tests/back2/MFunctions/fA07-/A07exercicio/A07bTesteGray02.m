clc;
clear all;
% ==============================
% F = imagem marcador
% G = imagem (mascara)
% EE = Elemento Estruturante
% ==============================

G = imread('Mapa1a.tif');

F = zeros( size(G) );
F(5,35) = G(5,35);

EE = [
0 1 0
1 1 1
0 1 0
];

z=5

% Processamento ==============================

A = GrayDilatacaoEEPlanarH(G,EE);

DG1  = GrayDilatacaoGeo1(F   ,G,EE,z);
DG2  = GrayDilatacaoGeo1(DG1 ,G,EE,z);
DG3  = GrayDilatacaoGeo1(DG2 ,G,EE,z);
DG4  = GrayDilatacaoGeo1(DG3 ,G,EE,z);
DG5  = GrayDilatacaoGeo1(DG4 ,G,EE,z);
DG6  = GrayDilatacaoGeo1(DG5 ,G,EE,z);
DG7  = GrayDilatacaoGeo1(DG6 ,G,EE,z);
DG8  = GrayDilatacaoGeo1(DG7 ,G,EE,z);
DG9  = GrayDilatacaoGeo1(DG8 ,G,EE,z);
DG10 = GrayDilatacaoGeo1(DG9 ,G,EE,z);
DG11 = GrayDilatacaoGeo1(DG10,G,EE,z);

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
imagesc(DG1);
colormap(gray);
xlabel('DG1 = GrayDilatacaoGeo1(F ,G,EE,z)');

%--------------------------------------------

subplot(3,5,6);
imagesc(DG2);
colormap(gray);
xlabel('DG2 = GrayDilatacaoGeo1(DG1,G,EE,z)');

subplot(3,5,7);
imagesc(DG3);
colormap(gray);
xlabel('DG3 = GrayDilatacaoGeo1(DG2,G,EE,z)');

subplot(3,5,8);
imagesc(DG4);
colormap(gray);
xlabel('DG4 = GrayDilatacaoGeo1(DG3,G,EE,z)');

subplot(3,5,9);
imagesc(DG5);
colormap(gray);
xlabel('DG5 = GrayDilatacaoGeo1(DG4,G,EE,z)');

subplot(3,5,10);
imagesc(DG6);
colormap(gray);
xlabel('DG6 = GrayDilatacaoGeo1(DG5,G,EE,z)');

%--------------------------------------------

subplot(3,5,11);
imagesc(DG7);
colormap(gray);
xlabel('DG7 = GrayDilatacaoGeo1(DG6,G,EE,z)');

subplot(3,5,12);
imagesc(DG8);
colormap(gray);
xlabel('DG8 = GrayDilatacaoGeo1(DG7,G,EE,z)');

subplot(3,5,13);
imagesc(DG9);
colormap(gray);
xlabel('DG9 = GrayDilatacaoGeo1(DG8,G,EE,z)');

subplot(3,5,14);
imagesc(DG10);
colormap(gray);
xlabel('DG10 = GrayDilatacaoGeo1(DG9,G,EE,z)');

subplot(3,5,15);
imagesc(DG11);
colormap(gray);
xlabel('DG11 = GrayDilatacaoGeo1(DG10,G,EE,z)');

%--------------------------------------------
