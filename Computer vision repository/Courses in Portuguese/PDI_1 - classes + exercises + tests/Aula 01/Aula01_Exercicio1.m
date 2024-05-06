clear all
clc

X = [200 100 100; 0 10 50; 50 250 120]
Y = [100 220 230; 45 95 120; 205 100 0]

% Dadas as matrizes acima, correspondentes a trechos 3x3 de imagens de 256
% tons de cinza, convertê-las para o formato uint8, adicioná-la e informar:
X = uint8(X);
Y = uint8(Y);
% a) Resultado da soma:
Soma1 = X + Y

% b) Resultado correto da soma:
X = double(X);
Y = double(Y);
Soma2 = X + Y

% c) Explicar a diferença entre os resultados.
% O formato "uint8" (inteiro sem sinal) tem limitação de 255, enquanto o
% formato "double" possui um limite superior de 65535.
