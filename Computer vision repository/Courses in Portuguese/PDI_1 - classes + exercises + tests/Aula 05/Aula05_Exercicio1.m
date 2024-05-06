clc
clear all

% mapeamento direto: coordenadas u,v de imagem para sistema x,y

I = imread('Elis.tif');

% Folha A4:  (linha,coluna)
%(0,0) == (209,23); 
%(210,0) == (652,169)
%(210,297) == (440,778)
%(0,297) == (7,630)


B = [ 0 0 297 297;0 210 210 0; 1 1 1 1];        % dimensão da folha
A = [23 169 778 630; 209 652 440 7; 1 1 1 1];   % coordenada de imagem referente aos cantos da folha (Multispec)
    %coluna/        /linha

    % 3B4 = 3X3*3A4
    % 3B*A' = X*3
    
    X = B*A'*inv(A*A')


% Livro:   (linha,coluna)
        %v  %u
%Pt5 = (153,534)
%Pt6 = (470,565)
%Pt7 = (501,283)
%Pt8 = (179,252)
 
LivroB = [ 534 565 283 252;153 470 501 179; 1 1 1 1]; % Coordenadas do multispec
            % coluna       % linha
LivroA = X*LivroB

% LivroA =
%       Pt5      Pt6       Pt7       Pt8
%   232.8416  199.7989   71.6112  105.3894  (coluna calculada) 
%    49.7679  190.6962  162.7225   19.6430  (linha calculada)
%     1.0000    1.0000    1.0000    1.0000


Largura = sqrt((19.6430-49.7679)^2+(105.3894-232.8416)^2) % pt8 e pt5 (x8-x5);(y8-y5) 
Altura = sqrt((190.6962-49.7679)^2+(199.7989-232.8416)^2) % pt6 e pt5 (x6-x5);(y6-y5)
