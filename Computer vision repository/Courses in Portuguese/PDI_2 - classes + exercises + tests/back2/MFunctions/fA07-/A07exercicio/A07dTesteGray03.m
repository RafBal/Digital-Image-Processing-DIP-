clc;
clear all;
% ==============================
% M = imagem marcador Low
% G = imagem (mascara)
% EE = Elemento Estruturante
% ==============================

G = imread('Mapa1b.tif');
G = double(G);

M = 255*ones( size(G) );
M(100,125) = G(100,125);

EE = [
0 1 0
1 1 1
0 1 0
];

z=6

% Processamento ==============================

A = GrayErosaoEEPlanarH(G,EE);

B = G-A;

[EG1,S1]  = GrayErosaoGeo1(M   ,G,EE,z);
[EG2,S2]  = GrayErosaoGeo1(EG1 ,G,EE,z);
[EG3,S3]  = GrayErosaoGeo1(EG2 ,G,EE,z);
[EG4,S4]  = GrayErosaoGeo1(EG3 ,G,EE,z);

EG5  = GrayErosaoGeoN(EG4 ,G,EE,z,40);

RE = GrayReconstrucaoErosao(M,G,EE,z);

% Mostrar Imagens ==================================

subplot(3,5,1);
imagesc(G);
colormap(gray);
xlabel('G = Mascara');

subplot(3,5,2);
imagesc(M);
colormap(gray);
xlabel('Marcador M');

subplot(3,5,3);
imagesc(EE,[0,1]);
colormap(gray);
xlabel('EE');

subplot(3,5,4);
imagesc(A);
colormap(gray);
xlabel('A = GrayErosaoEEPlanarH(G,EE)');

subplot(3,5,5);
imagesc(B);
colormap(gray);
xlabel('B = G-A');

%--------------------------------------------

subplot(3,5,6);
imagesc(EG1);
colormap(gray);
xlabel('EG1 = GrayErosaoGeo1(F ,G,EE,z)');

subplot(3,5,7);
imagesc(EG2);
colormap(gray);
xlabel('EG2 = GrayErosaoGeo1(EG1,G,EE,z)');

subplot(3,5,8);
imagesc(EG3);
colormap(gray);
xlabel('EG3 = GrayErosaoGeo1(EG2,G,EE,z)');

subplot(3,5,9);
imagesc(EG4);
colormap(gray);
xlabel('EG4 = GrayErosaoGeo1(EG3,G,EE,z)');

subplot(3,5,10);
imagesc(EG5);
colormap(gray);
xlabel('EG5  = GrayErosaoGeoN(EG4 ,G,EE,z,20)');

%--------------------------------------------

subplot(3,5,11);
imagesc(S1);
colormap(gray);
xlabel('S1');

subplot(3,5,12);
imagesc(S2);
colormap(gray);
xlabel('S2');

subplot(3,5,13);
imagesc(S3);
colormap(gray);
xlabel('S3');

subplot(3,5,14);
imagesc(S4);
colormap(gray);
xlabel('S4');

subplot(3,5,15);
imagesc(RE);
colormap(gray);
xlabel('RE = GrayReconstrucaoErosao(M,G,EE,z)');


%--------------------------------------------
