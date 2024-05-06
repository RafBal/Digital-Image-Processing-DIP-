clc
clear all

% a) Calculando a matriz X.

A = [2 -1 0; 3 1 2; -1 4 5; 1 2 4];
%X = [x1; x2; x3];
B = [-1; 0; 1; 2];

X = inv(A'*A)*A'*B

B = A*X