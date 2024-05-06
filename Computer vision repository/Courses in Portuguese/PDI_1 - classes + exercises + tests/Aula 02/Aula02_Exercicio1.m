clc;
clear all;

f = imread('cores1.tif');

% a) Verificar a dimensão da imagem (número de linhas , de colunas e de bandas) 
[m,n,k] = size(f);
% Linhas
m
% Colunas
n
% Camadas
k

% for i = 1:m
%     for j = 1:n
%         R(i,j) = f(i,j,1); 
%         G(i,j) = f(i,j,2);
%         B(i,j) = f(i,j,3);
%     end
% end

% ou:

R(:,:) = f(:,:,1);  % Camada ou banda = 1 representa a cor vermelha para arquivo .tif.
G(:,:) = f(:,:,2);  % Camada ou banda = 2 representa a cor verde para arquivo .tif.
B(:,:) = f(:,:,3);  % Camada ou banda = 3 representa a cor azul para arquivo .tif.

imagesc(R)      
% Palavras que aparecem: "vermelho" com resquício de "azul".

figure      % para criar mais uma janela

imagesc(G)      
% Palavras que aparecem: "verde" com resquício de "azul".

figure      % para criar mais uma janela

imagesc(B)
% Palavras que aparecem: "azul" com resquício de "verde".

% Explicação: 
% Isso significa que a cor das palavras não é pura, pois são misturas de duas cores.