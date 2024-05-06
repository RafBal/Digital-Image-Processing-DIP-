clc;
clear all;
% ==============================
% F1 = imagem marcador 1
% F2 = imagem marcador 2
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

I1F1 = BinDilatacaoEE(F1,EE);
DG1F1 = I1F1 & G;

I2F1 = BinDilatacaoEE(DG1F1,EE);
DG2F1 = I2F1 & G;

I3F1 = BinDilatacaoEE(DG2F1,EE);
DG3F1 = I3F1 & G;

I4F1 = BinDilatacaoEE(DG3F1,EE);
DG4F1 = I4F1 & G;

I5F1 = BinDilatacaoEE(DG4F1,EE);
DG5F1 = I5F1 & G;

%--------------------------------------------

I1F2 = BinDilatacaoEE(F2,EE);
DG1F2 = I1F2 & G;

I2F2 = BinDilatacaoEE(DG1F2,EE);
DG2F2 = I2F2 & G;

I3F2 = BinDilatacaoEE(DG2F2,EE);
DG3F2 = I3F2 & G;

I4F2 = BinDilatacaoEE(DG3F2,EE);
DG4F2 = I4F2 & G;

I5F2 = BinDilatacaoEE(DG4F2,EE);
DG5F2 = I5F2 & G;

% Mostrar Imagens 1 ============================================================

figure(1);
%--------------------------------------------

subplot(4,6,1);
imagesc(F1,[0,1]);
colormap(gray);
xlabel('F1 = Marcador');

subplot(4,6,2);
imagesc(I1F1,[0,1]);
colormap(gray);
xlabel('I1F1 = BinDilatacaoEE(F1,EE)');

subplot(4,6,3);
imagesc(I2F1,[0,1]);
colormap(gray);
xlabel('I2F1 = BinDilatacaoEE(DG1F1,EE)');

subplot(4,6,4);
imagesc(I3F1,[0,1]);
colormap(gray);
xlabel('I3F1 = BinDilatacaoEE(DG2F1,EE)');

subplot(4,6,5);
imagesc(I4F1,[0,1]);
colormap(gray);
xlabel('I4F1 = BinDilatacaoEE(DG3F1,EE)');

subplot(4,6,6);
imagesc(I5F1,[0,1]);
colormap(gray);
xlabel('I5F1 = BinDilatacaoEE(DG4F1,EE)');

%--------------------------------------------

subplot(4,6,7);
imagesc(G,[0,1]);
colormap(gray);
xlabel('G = Mascara');

subplot(4,6,8);
imagesc(DG1F1,[0,1]);
colormap(gray);
xlabel('DG1F1 = I1F1 & G');

subplot(4,6,9);
imagesc(DG2F1,[0,1]);
colormap(gray);
xlabel('DG2F1 = I2F1 & G');

subplot(4,6,10);
imagesc(DG3F1,[0,1]);
colormap(gray);
xlabel('DG3F1 = I3F1 & G');

subplot(4,6,11);
imagesc(DG4F1,[0,1]);
colormap(gray);
xlabel('DG4F1 = I4F1 & G');

subplot(4,6,12);
imagesc(DG5F1,[0,1]);
colormap(gray);
xlabel('DG5F1 = I5F1 & G');


% Mostrar Imagens 2 ============================================================

subplot(4,6,13);
imagesc(F2,[0,1]);
colormap(gray);
xlabel('F2 = Marcador');

subplot(4,6,14);
imagesc(I1F2,[0,1]);
colormap(gray);
xlabel('I1F2 = BinDilatacaoEE(F2,EE)');

subplot(4,6,15);
imagesc(I2F2,[0,1]);
colormap(gray);
xlabel('I2F2 = BinDilatacaoEE(DG1F2,EE)');

subplot(4,6,16);
imagesc(I3F2,[0,1]);
colormap(gray);
xlabel('I3F2 = BinDilatacaoEE(DG2F2,EE)');

subplot(4,6,17);
imagesc(I4F2,[0,1]);
colormap(gray);
xlabel('I4F2 = BinDilatacaoEE(DG3F2,EE)');

subplot(4,6,18);
imagesc(I5F2,[0,1]);
colormap(gray);
xlabel('I5F2 = BinDilatacaoEE(DG4F2,EE)');

%--------------------------------------------

subplot(4,6,19);
imagesc(G,[0,1]);
colormap(gray);
xlabel('G = Mascara');

subplot(4,6,20);
imagesc(DG1F2,[0,1]);
colormap(gray);
xlabel('DG1F2 = I1F2 & G');

subplot(4,6,21);
imagesc(DG2F2,[0,1]);
colormap(gray);
xlabel('DG2F2 = I2F2 & G');

subplot(4,6,22);
imagesc(DG3F2,[0,1]);
colormap(gray);
xlabel('DG3F2 = I3F2 & G');

subplot(4,6,23);
imagesc(DG4F2,[0,1]);
colormap(gray);
xlabel('DG4F2 = I4F2 & G');

subplot(4,6,24);
imagesc(DG5F2,[0,1]);
colormap(gray);
xlabel('DG5F2 = I5F2 & G');

% ========================================================================
