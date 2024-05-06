clc;
clear all;
% =========================================================
i = [1:50];
L = 127 + 80*sin(0.3*i);

A = repmat(L,20,1);

EE = [
0 0 1 0 0
0 0 1 0 0
1 1 1 1 1
0 0 1 0 0
0 0 1 0 0
];

% Processo ================================================

B1 = GrayErosaoEEB(A,EE);
C1 = GrayAberturaEEB(A,EE);
D1 = GrayTopHatAberturaEEB(A,EE);

B2 = GrayDilatacaoEEB(A,EE);
C2 = GrayFechamentoEEB(A,EE);
D2 = GrayTopHatFechamentoEEB(A,EE);


% Mostrar Imagens =========================================
figure 1;

subplot(3,3,1);
imagesc(A);
colormap(gray);
title('Imagem');

subplot(3,3,2);
imagesc(EE);
colormap(gray);
title('EE');

% ---------------------------------------------------------

subplot(3,3,4);
imagesc(B1);
colormap(gray);
title('B1 = GrayErosaoEEB(A,EE)');

subplot(3,3,5);
imagesc(C1);
colormap(gray);
title('C1 = GrayAberturaEEB(A,EE)');

subplot(3,3,6);
imagesc(D1);
colormap(gray);
title('D1 = GrayTopHatAberturaEEB(A,EE)');

% ---------------------------------------------------------

subplot(3,3,7);
imagesc(B2);
colormap(gray);
title('B2 = GrayDilatacaoEEB(A,EE)');

subplot(3,3,8);
imagesc(C2);
colormap(gray);
title('C2 = GrayFechamentoEEB(A,EE)');

subplot(3,3,9);
imagesc(D2);
colormap(gray);
title('D2 = GrayTopHatFechamentoEEB(A,EE)');

% Mostrar Imagens =========================================
figure 2;

subplot(3,1,1);
plot( i , B1(10,:) , 'b--' , 'linewidth' , 3 );
hold on;
plot( i , A(10,:) , 'r-' );
xlabel('B1 = GrayErosaoEEB(A,EE)');
grid on;

subplot(3,1,2);
plot( i  , C1(10,:) , 'b--' , 'linewidth' , 3 );
hold on;
plot( i , A(10,:) , 'r-' );
xlabel('C1 = GrayAberturaEEB(A,EE)');
grid on;

subplot(3,1,3);
plot( i  , D1(10,:) , 'b--' , 'linewidth' , 3 );
hold on;
plot( i , A(10,:) , 'r-' );
xlabel('D1 = GrayTopHatAberturaEEB(A,EE)');
grid on;

% Mostrar Imagens =========================================
figure 3;

subplot(3,1,1);
plot( i  , B2(10,:) , 'b--' , 'linewidth' , 3 );
hold on;
plot( i , A(10,:) , 'r-' );
xlabel('B2 = GrayDilatacaoEEB(A,EE)');
grid on;

subplot(3,1,2);
plot( i  , C2(10,:) , 'b--' , 'linewidth' , 3 );
hold on;
plot( i , A(10,:) , 'r-' );
xlabel('C2 = GrayFechamentoEEB(A,EE)');
grid on;

subplot(3,1,3);
plot( i  , D2(10,:) , 'b--' , 'linewidth' , 3 );
hold on;
plot( i , A(10,:) , 'r-' );
xlabel('D2 = GrayTopHatFechamentoEEB(A,EE)');
grid on;

% =========================================================
