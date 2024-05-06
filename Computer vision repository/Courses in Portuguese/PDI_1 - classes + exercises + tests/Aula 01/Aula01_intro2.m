clear all
clc

% Size retorna um vetor que contém dois valores, o número de linhas e o
% número de colunas:
B = [5 1 2; 3 8 4; 7 6 10]
[m,n] = size(B)
m
n
% ndims retorna o número de dimensões da matriz:
ndims(B)