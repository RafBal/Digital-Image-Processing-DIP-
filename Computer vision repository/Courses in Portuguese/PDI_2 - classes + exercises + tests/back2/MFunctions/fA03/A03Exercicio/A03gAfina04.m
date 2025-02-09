clc;
clear all;
% =============================================================
Im = [
0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
0 0 1 1 1 1 1 1 1 1 1 1 1 0 0
0 0 1 1 1 1 1 1 1 1 1 0 0 0 0
0 0 1 1 1 1 1 1 1 1 1 0 0 0 0
0 0 1 1 1 1 1 1 1 1 1 0 0 0 0
0 0 1 1 1 0 0 1 1 1 1 0 0 0 0
0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
];

% Processa ====================================================

Af1 = Afina1(Im);
Af2 = Afina1(Af1);


% Mostrar Imagens ============================================================

subplot(1,3,1);
imagesc(Im);
colormap(gray);
title('Imagem');

subplot(1,3,2);
imagesc(Af1);
colormap(gray);
title('Af1 = Afina1(Im)');

subplot(1,3,3);
imagesc(Af2);
colormap(gray);
title('Af2 = Afina1(Af1)');

% =============================================================
