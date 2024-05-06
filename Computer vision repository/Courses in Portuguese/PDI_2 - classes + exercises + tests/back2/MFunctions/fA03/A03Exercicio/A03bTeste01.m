clc;
clear all;
% Skeleton
Im = [
1 1 1 1 0 0 0
1 1 1 1 0 0 0
1 1 1 1 0 0 0
1 1 1 1 1 1 1
1 1 1 1 1 1 1
1 1 1 1 1 1 1
1 1 1 1 1 1 1
];

EE = [
0 1 0
1 1 1
0 1 0
];

S0 = Im - AberturaBin2(Im,EE);
disp('S0 = Im - AberturaBin2(Im,EE)');

A_1B = ErosaoBin2(Im,EE);
S1 = A_1B - AberturaBin2(A_1B,EE);
disp('S1 = A_1B - AberturaBin2(A_1B,EE)');


A_2B = ErosaoBin2(A_1B,EE);
S2 = A_2B - AberturaBin2(A_2B,EE);
disp('S2 = A_2B - AberturaBin2(A_2B,EE)');

SA = S0 | S1 | S2;

% Mostrar Imagens ============================================================

subplot(2,3,1);
imagesc(Im);
colormap(gray);
title('Imagem');

subplot(2,3,2);
imagesc(EE,[0,1]);
colormap(gray);
title('E. Estruturante');

subplot(2,3,3);
imagesc(SA)
colormap(gray)
title('SA = S0 | S1 | S2');

subplot(2,3,4);
imagesc(S0)
colormap(gray)
title('S0 = Im - AberturaBin2(Im,EE)');

subplot(2,3,5);
imagesc(S1)
colormap(gray)
title('S1 = A_1B - AberturaBin2(A_1B,EE)');

subplot(2,3,6);
imagesc(S2)
colormap(gray)
title('S2 = A_2B - AberturaBin2(A_2B,EE)');

