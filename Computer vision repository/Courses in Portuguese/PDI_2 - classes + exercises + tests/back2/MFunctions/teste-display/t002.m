clc;
clear all;
% Leitura das Imagens ================================
Im = imread('a1.tif');
A1=Im>100;

Im = imread('a2.tif');
A2=Im>100;

Im = imread('a3.tif');
A3=Im>100;

S1=abs(A1-A1);
S2=abs(A1-A2);
S3=abs(A1-A3);

% Mostrar imagens =====================================
subplot(2,3,1);
imagesc(A1);
title('A1');

subplot(2,3,2);
imagesc(A2);
title('A2');

subplot(2,3,3);
imagesc(A3);
title('A3');

subplot(2,3,4);
imagesc(S1);
title('S1');

subplot(2,3,5);
imagesc(S2);
title('S2');

subplot(2,3,6);
imagesc(S3);
title('S3');

colormap(gray);
