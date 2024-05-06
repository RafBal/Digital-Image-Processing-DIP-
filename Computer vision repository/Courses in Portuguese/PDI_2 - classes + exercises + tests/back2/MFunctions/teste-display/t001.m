clc;
clear all;
A1 = [
1 1 0 0 0
0 1 1 0 0
0 0 0 1 1
1 1 0 1 0
0 0 1 0 0
];

A2 = [
0 0 1 1 0
1 0 1 0 1
0 1 0 1 0
1 0 1 0 0
0 1 0 1 0
];

A3 = ~A1';
A4 = ~A2';

% Mostrar imagens =================================
subplot(2,2,1);
imagesc(A1);
title('A1');

% Mostrar imagens
subplot(2,2,2);
imagesc(A2);
title('A2');


subplot(2,2,3);
imagesc(A3);
title('A3 = (~A1)^t');

subplot(2,2,4);
imagesc(A4)
title('A4 = (~A2)^t');
colormap(gray);
