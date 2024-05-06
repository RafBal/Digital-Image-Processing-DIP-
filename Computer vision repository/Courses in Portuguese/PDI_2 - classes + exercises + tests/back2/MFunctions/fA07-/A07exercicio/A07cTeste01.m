clc;
clear all;
% ==============================
% F = imagem marcador
% G = imagem (mascara)
% EE = Elemento Estruturante
% ==============================
F = [
0 0 0 0 0 0 0 0 0 0
0 1 1 1 1 1 0 0 0 0
0 1 1 1 1 1 1 0 0 0
0 1 1 1 1 1 1 0 0 0
0 0 0 0 1 1 1 0 0 0
0 0 0 0 0 0 0 0 0 0
0 0 0 0 0 0 0 0 0 0
0 0 0 0 0 0 0 0 0 0
0 0 0 0 0 0 0 0 0 0
0 0 0 0 0 0 0 0 0 0
];

G = [
0 0 0 0 0 0 0 0 0 0
0 0 0 0 0 0 0 0 0 0
0 0 1 0 0 0 0 0 0 0
0 0 1 1 0 0 0 0 0 0
0 1 0 1 0 0 0 0 0 0
0 0 0 1 1 1 0 0 0 0
0 0 0 1 0 1 0 0 0 0
0 0 0 1 1 1 0 0 0 0
0 0 0 0 0 0 0 0 0 0
0 0 0 0 0 0 0 0 0 0
];

GC = ~G;

EE = [
1 1 1
1 1 1
1 1 1
];

% Processamento ==============================

I1F = BinErosaoEE(F,EE);

EG1F = I1F | G;
I3F = BinErosaoEE(EG1F,EE);
EG3F = I3F | G;

EG2F = I1F | GC;
I4F = BinErosaoEE(EG2F,EE);
EG4F = I4F | GC;


% Mostrar Imagens 1 ============================================================

figure(1);
%--------------------------------------------

subplot(3,4,1);
imagesc(F,[0,1]);
colormap(gray);
xlabel('F = Marcador');

subplot(3,4,2);
imagesc(G,[0,1]);
colormap(gray);
xlabel('G = Imagem 1');

subplot(3,4,3);
imagesc(GC,[0,1]);
colormap(gray);
xlabel('GC = Imagem 2');

subplot(3,4,4);
imagesc(EE,[0,1]);
colormap(gray);
xlabel('EE = Elemento Estruturante');

%--------------------------------------------

subplot(3,4,5);
imagesc(I1F,[0,1]);
colormap(gray);
xlabel('I1F = BinErosaoEE(F,EE)');

subplot(3,4,6);
imagesc(EG1F,[0,1]);
colormap(gray);
xlabel('EG1F = I1F | G');

subplot(3,4,7);
imagesc(I3F,[0,1]);
colormap(gray);
xlabel('I3F = BinErosaoEE(EG1F,EE)');

subplot(3,4,8);
imagesc(EG3F,[0,1]);
colormap(gray);
xlabel('EG3F = I3F | G');

%--------------------------------------------

subplot(3,4,9);
imagesc(I1F,[0,1]);
colormap(gray);
xlabel('I1F = BinErosaoEE(F,EE)');

subplot(3,4,10);
imagesc(EG2F,[0,1]);
colormap(gray);
xlabel('EG2F = I1F | GC');

subplot(3,4,11);
imagesc(I4F,[0,1]);
colormap(gray);
xlabel('I4F = BinErosaoEE(EG2F,EE)');

subplot(3,4,12);
imagesc(EG4F,[0,1]);
colormap(gray);
xlabel('EG4F = I4F | GC');


% ========================================================================
