clc;
clear all;
% ==============================
% F = imagem marcador
% G = imagem (mascara)
% EE = Elemento Estruturante
% ==============================

G = imread('Mapa1b.tif');

F = zeros( size(G) );
F(30,50) = G(30,50);
F(100,40) = G(100,40);

EE = [
1 1 1 1 1
1 1 1 1 1
1 1 1 1 1
1 1 1 1 1
1 1 1 1 1
];

z=5

% Processamento ==============================

A = GrayDilatacaoEEPlanarH(G,EE);

DG = GrayDilatacaoGeoN( F,G,EE,z,8 );

RD  = GrayReconstrucaoDilatacao( F,G,EE,z );


% Mostrar Imagens ==================================

subplot(2,3,1);
imagesc(G);
colormap(gray);
ylabel('G = Mascara');

subplot(2,3,2);
imagesc(F);
colormap(gray);
ylabel('Marcador F');

subplot(2,3,3);
imagesc(EE,[0,1]);
colormap(gray);
ylabel('EE');

subplot(2,3,4);
imagesc(A);
colormap(gray);
ylabel('A = GrayDilatacaoEEPlanarH(G,EE)');

subplot(2,3,5);
imagesc(DG);
colormap(gray);
ylabel('DG = GrayDilatacaoGeoN(F,G,EE,z,8)');

subplot(2,3,6);
imagesc(RD);
colormap(gray);
ylabel('RD  = GrayReconstrucaoDilatacao(F,Im,EE,z)');

%--------------------------------------------
