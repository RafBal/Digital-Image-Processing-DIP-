close all
clear all
clc

X = [0 1 2 2 3 4 5 6 9];
X = X';
median(X)
mode(X)

[i,j] = size(X);

ordem = sort(X);
S(i,j) = ordem(5,1);