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
subplot(3,3,1);
imagesc( Bin2RGB(A1) );
title('A1');

subplot(3,3,2);
imagesc( Bin2RGB(A2) );
title('A2');

subplot(3,3,3);
imagesc( Bin2RGB(A3) );
title('A3');

%------------------------------------------------------
subplot(3,3,4);
imagesc( Bin2RGB(S1) );
title('S1');

subplot(3,3,5);
imagesc( Bin2RGB(S2) );
title('S2');

subplot(3,3,6);
imagesc( Bin2RGB(S3) );
title('S3');

%------------------------------------------------------
subplot(3,3,7);
imagesc( 255*cat(3,A1,A1,A1) );
title('A1,A1,A1');

subplot(3,3,8);
imagesc( 255*cat(3,A1,A2,A2) );
title('A1,A2,A2');

subplot(3,3,9);
imagesc( 255*cat(3,A1,A3,A3) );
title('A1,A3,A3');



