clc;
clear all;
% ==============================
% F1 = imagem marcador 1
% F2 = imagem marcador 2
% F3 = imagem marcador 3
% F4 = imagem marcador 4
% G = imagem (mascara)
% EE = Elemento Estruturante
% ==============================
F1 = [
0 0 0 0 0 0 0 0 0 0
0 0 0 0 0 0 0 0 0 0
0 0 1 0 0 0 0 0 0 0
0 0 0 0 0 0 0 0 0 0
0 0 0 0 0 0 0 0 0 0
0 0 0 0 0 0 0 0 0 0
0 0 0 0 0 0 0 0 0 0
0 0 0 0 0 0 0 0 0 0
0 0 0 0 0 0 0 0 0 0
0 0 0 0 0 0 0 0 0 0
];
F2 = [
0 0 0 0 0 0 0 0 0 0
0 0 0 0 0 0 0 0 0 0
0 0 0 0 0 0 0 0 0 0
0 0 0 0 0 0 0 1 0 0
0 0 0 0 0 0 0 0 0 0
0 0 0 0 0 0 0 0 0 0
0 0 0 0 0 0 0 0 0 0
0 0 0 0 0 0 0 0 0 0
0 0 0 0 0 0 0 0 0 0
0 0 0 0 0 0 0 0 0 0
];
F3 = [
0 0 0 0 0 0 0 0 0 0
0 0 0 0 0 0 0 0 0 0
0 0 0 0 0 0 0 0 0 0
0 0 0 0 0 0 0 0 0 0
0 0 0 0 0 0 0 0 0 0
0 0 0 0 0 0 0 0 0 0
0 0 0 0 0 0 0 0 0 0
0 0 0 0 0 0 0 0 0 0
0 0 0 0 0 0 0 1 0 0
0 0 0 0 0 0 0 0 0 0
];

F4 = F1 | F2 | F3;

G = [
0 0 0 0 0 0 0 0 0 0
0 0 0 0 1 1 1 1 1 0
0 0 1 0 0 0 1 0 1 0
0 0 1 1 0 0 1 1 1 0
0 1 0 1 0 0 0 1 0 0
0 0 0 1 1 1 0 0 1 0
0 0 0 1 0 1 0 0 1 0
0 0 0 1 1 1 0 0 0 0
0 0 0 0 0 0 0 0 0 0
0 0 0 0 0 0 0 0 0 0
];
EE = [
1 1 1
1 1 1
1 1 1
];

% Processamento ==============================

DG1F1 = BinDilatacaoGeoN(F1,G,EE,1);
DG2F1 = BinDilatacaoGeoN(F1,G,EE,2);
DG3F1 = BinDilatacaoGeoN(F1,G,EE,3);
DG4F1 = BinDilatacaoGeoN(F1,G,EE,4);
DG5F1 = BinDilatacaoGeoN(F1,G,EE,5);
%--------------------------------------------
DG1F2 = BinDilatacaoGeoN(F2,G,EE,1);
DG2F2 = BinDilatacaoGeoN(F2,G,EE,2);
DG3F2 = BinDilatacaoGeoN(F2,G,EE,3);
DG4F2 = BinDilatacaoGeoN(F2,G,EE,4);
DG5F2 = BinDilatacaoGeoN(F2,G,EE,5);
%--------------------------------------------
DG1F3 = BinDilatacaoGeoN(F3,G,EE,1);
DG2F3 = BinDilatacaoGeoN(F3,G,EE,2);
DG3F3 = BinDilatacaoGeoN(F3,G,EE,3);
DG4F3 = BinDilatacaoGeoN(F3,G,EE,4);
DG5F3 = BinDilatacaoGeoN(F3,G,EE,5);
%--------------------------------------------
DG1F4 = BinDilatacaoGeoN(F4,G,EE,1);
DG2F4 = BinDilatacaoGeoN(F4,G,EE,2);
DG3F4 = BinDilatacaoGeoN(F4,G,EE,3);
DG4F4 = BinDilatacaoGeoN(F4,G,EE,4);
DG5F4 = BinDilatacaoGeoN(F4,G,EE,5);

% Mostrar Imagens ======================================================

subplot(5,6,1);
imagesc(G,[0 1]);
colormap(gray);
xlabel('G = Mascara');

subplot(5,6,2);
imagesc(EE,[0 1]);
colormap(gray);
xlabel('EE = Elemento Estruturante');

%--------------------------------------------
subplot(5,6,7);
imagesc(F1,[0 1]);
colormap(gray);
xlabel('Marcador F1');

subplot(5,6,8);
imagesc(DG1F1,[0 1]);
colormap(gray);
xlabel('DG1F1 = BinDilatacaoGeoN(F1,G,EE,1)');

subplot(5,6,9);
imagesc(DG2F1,[0 1]);
colormap(gray);
xlabel('DG2F1 = BinDilatacaoGeoN(F1,G,EE,2)');

subplot(5,6,10);
imagesc(DG3F1,[0 1]);
colormap(gray);
xlabel('DG3F1 = BinDilatacaoGeoN(F1,G,EE,3)');

subplot(5,6,11);
imagesc(DG4F1,[0 1]);
colormap(gray);
xlabel('DG4F1 = BinDilatacaoGeoN(F1,G,EE,4)');

subplot(5,6,12);
imagesc(DG5F1,[0 1]);
colormap(gray);
xlabel('DG5F1 = BinDilatacaoGeoN(F1,G,EE,5)');
%--------------------------------------------
subplot(5,6,13);
imagesc(F2,[0 1]);
colormap(gray);
xlabel('Marcador F2');

subplot(5,6,14);
imagesc(DG1F2,[0 1]);
colormap(gray);
xlabel('DG1F2 = BinDilatacaoGeoN(F2,G,EE,1)');

subplot(5,6,15);
imagesc(DG2F2,[0 1]);
colormap(gray);
xlabel('DG2F2 = BinDilatacaoGeoN(F2,G,EE,2)');

subplot(5,6,16);
imagesc(DG3F2,[0 1]);
colormap(gray);
xlabel('DG3F2 = BinDilatacaoGeoN(F2,G,EE,3)');

subplot(5,6,17);
imagesc(DG4F2,[0 1]);
colormap(gray);
xlabel('DG4F2 = BinDilatacaoGeoN(F2,G,EE,4)');

subplot(5,6,18);
imagesc(DG5F2,[0 1]);
colormap(gray);
xlabel('DG5F2 = BinDilatacaoGeoN(F2,G,EE,5)');
%--------------------------------------------
subplot(5,6,19);
imagesc(F3,[0 1]);
colormap(gray);
xlabel('Marcador F3');

subplot(5,6,20);
imagesc(DG1F3,[0 1]);
colormap(gray);
xlabel('DG1F3 = BinDilatacaoGeoN(F3,G,EE,1)');

subplot(5,6,21);
imagesc(DG2F3,[0 1]);
colormap(gray);
xlabel('DG2F3 = BinDilatacaoGeoN(F3,G,EE,2)');

subplot(5,6,22);
imagesc(DG3F3,[0 1]);
colormap(gray);
xlabel('DG3F3 = BinDilatacaoGeoN(F3,G,EE,3)');

subplot(5,6,23);
imagesc(DG4F3,[0 1]);
colormap(gray);
xlabel('DG4F3 = BinDilatacaoGeoN(F3,G,EE,4)');

subplot(5,6,24);
imagesc(DG5F3,[0 1]);
colormap(gray);
xlabel('DG5F3 = BinDilatacaoGeoN(F3,G,EE,5)');
%--------------------------------------------
subplot(5,6,25);
imagesc(F4,[0 1]);
colormap(gray);
xlabel('Marcador F4');

subplot(5,6,26);
imagesc(DG1F4,[0 1]);
colormap(gray);
xlabel('DG1F4 = BinDilatacaoGeoN(F4,G,EE,1)');

subplot(5,6,27);
imagesc(DG2F4,[0 1]);
colormap(gray);
xlabel('DG2F4 = BinDilatacaoGeoN(F4,G,EE,2)');

subplot(5,6,28);
imagesc(DG3F4,[0 1]);
colormap(gray);
xlabel('DG3F4 = BinDilatacaoGeoN(F4,G,EE,3)');

subplot(5,6,29);
imagesc(DG4F4,[0 1]);
colormap(gray);
xlabel('DG4F4 = BinDilatacaoGeoN(F4,G,EE,4)');

subplot(5,6,30);
imagesc(DG5F4,[0 1]);
colormap(gray);
xlabel('DG5F4 = BinDilatacaoGeoN(F4,G,EE,5)');
%--------------------------------------------

