clc;
clear all;

f = imread('cores2.tif');

R(:,:) = f(:,:,1);
max(max(R))
% negativo do vermelho = CIANO
NR = 255-R; 
NF(:,:,1) = NR(:,:);    % matriz da cor vermelha recebe sua matriz negativa

G(:,:) = f(:,:,2);
max(max(G))
% negativo do verde = ROSA/MAGENTA
NG = 255-G;   
NF(:,:,2) = NG(:,:);     % matriz da cor verde recebe sua matriz negativa 

B(:,:) = f(:,:,3);
max(max(B))
% negativo do azul = AMARELO
NB = 255-B;
NF(:,:,3) = NB(:,:);     % matriz da cor azul recebe sua matriz negativa

imagesc(NF)
