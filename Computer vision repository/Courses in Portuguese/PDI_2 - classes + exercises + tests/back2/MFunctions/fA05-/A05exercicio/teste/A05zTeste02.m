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

plot( i , B1(10,:) , 'k--' , 'linewidth' , 3 );
hold on;
plot( i , B2(10,:) , 'b--' , 'linewidth' , 3 );
plot( i , A(10,:) , 'r-' );
xlabel('B1=GrayErosaoEEB(A,EE)  B2=GrayDilatacaoEEB(A,EE)');
legend('B1','B2','A');
grid on;

% Mostrar Imagens =========================================
figure 2;

plot( i , C1(10,:) , 'k--' , 'linewidth' , 3 );
hold on;
plot( i , C2(10,:) , 'b--' , 'linewidth' , 3 );
plot( i , A(10,:) , 'r-' );
xlabel('C1=GrayAberturaEEB(A,EE)  C2=GrayFechamentoEEB(A,EE)');
legend('C1','C2','A');
grid on;

% Mostrar Imagens =========================================
figure 3;

plot( i , D1(10,:) , 'k--' , 'linewidth' , 3 );
hold on;
plot( i , D2(10,:) , 'b--' , 'linewidth' , 3 );
plot( i , A(10,:) , 'r-' );
xlabel('D1=GrayTopHatAberturaEEB(A,EE)  D2=GrayTopHatFechamentoEEB(A,EE)');
legend('D1','D2','A');
grid on;

% =========================================================
