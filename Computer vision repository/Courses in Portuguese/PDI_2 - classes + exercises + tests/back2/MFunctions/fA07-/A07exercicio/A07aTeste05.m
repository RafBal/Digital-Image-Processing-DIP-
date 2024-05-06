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
EE1 = [
1 1 1
1 1 1
1 1 1
];
EE2 = [
0 1 0
1 1 1
0 1 0
];

% Processamento ==============================

RDGF1EE1 = BinReconstrucaoDilatacao(F1,G,EE1);
RDGF2EE1 = BinReconstrucaoDilatacao(F2,G,EE1);
RDGF3EE1 = BinReconstrucaoDilatacao(F3,G,EE1);
RDGF4EE1 = BinReconstrucaoDilatacao(F4,G,EE1);

%--------------------------------------------

RDGF1EE2 = BinReconstrucaoDilatacao(F1,G,EE2);
RDGF2EE2 = BinReconstrucaoDilatacao(F2,G,EE2);
RDGF3EE2 = BinReconstrucaoDilatacao(F3,G,EE2);
RDGF4EE2 = BinReconstrucaoDilatacao(F4,G,EE2);


% Mostrar Imagens ======================================================

subplot(3,5,1);
imagesc(G,[0 1]);
colormap(gray);
xlabel('G = Mascara');

subplot(3,5,2);
imagesc(F1,[0 1]);
colormap(gray);
xlabel('Marcador F1');

subplot(3,5,3);
imagesc(F2,[0 1]);
colormap(gray);
xlabel('Marcador F2');

subplot(3,5,4);
imagesc(F3,[0 1]);
colormap(gray);
xlabel('Marcador F3');

subplot(3,5,5);
imagesc(F4,[0 1]);
colormap(gray);
xlabel('Marcador F4');

%--------------------------------------------

subplot(3,5,6);
imagesc(EE1,[0 1]);
colormap(gray);
xlabel('EE1 = Elemento Estruturante 1');

subplot(3,5,7);
imagesc(RDGF1EE1,[0 1]);
colormap(gray);
xlabel('RDGF1EE1 = BinReconstrucaoDilatacao(F1,G,EE1)');

subplot(3,5,8);
imagesc(RDGF2EE1,[0 1]);
colormap(gray);
xlabel('RDGF2EE1 = BinReconstrucaoDilatacao(F2,G,EE1)');

subplot(3,5,9);
imagesc(RDGF3EE1,[0 1]);
colormap(gray);
xlabel('RDGF3EE1 = BinReconstrucaoDilatacao(F3,G,EE1)');

subplot(3,5,10);
imagesc(RDGF4EE1,[0 1]);
colormap(gray);
xlabel('RDGF4EE1 = BinReconstrucaoDilatacao(F4,G,EE1)');

%--------------------------------------------

subplot(3,5,11);
imagesc(EE2,[0 1]);
colormap(gray);
xlabel('EE2 = Elemento Estruturante 2');

subplot(3,5,12);
imagesc(RDGF1EE2,[0 1]);
colormap(gray);
xlabel('RDGF1EE2 = BinReconstrucaoDilatacao(F1,G,EE2)');

subplot(3,5,13);
imagesc(RDGF2EE2,[0 1]);
colormap(gray);
xlabel('RDGF2EE2 = BinReconstrucaoDilatacao(F2,G,EE2)');

subplot(3,5,14);
imagesc(RDGF3EE2,[0 1]);
colormap(gray);
xlabel('RDGF3EE2 = BinReconstrucaoDilatacao(F3,G,EE2)');

subplot(3,5,15);
imagesc(RDGF4EE2,[0 1]);
colormap(gray);
xlabel('RDGF4EE2 = BinReconstrucaoDilatacao(F4,G,EE2)');

%--------------------------------------------

