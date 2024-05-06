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
F(25,48) = G(25,48);

EE = [
0 1 0
1 1 1
0 1 0
];

z=6

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
