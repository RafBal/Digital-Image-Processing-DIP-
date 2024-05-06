clc
clear all

% a) Calculando a matriz X.

A = [1 2 3; 4 5 6; 7 8 0];
%X = [x1; x2; x3];
B = [366; 804; 351];

X = inv(A)*B

B = A*X