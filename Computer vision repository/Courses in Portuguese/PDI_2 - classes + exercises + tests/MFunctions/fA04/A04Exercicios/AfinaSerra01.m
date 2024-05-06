clc;
clear all;
% Skeleton
II = imread('Ferramenta5.tif');

%function y = AfinaSerra01(II)

% Afinamento de Serra => 1 ciclo

%Elementos estruturantes
B1  = [ 0 0 0 ; 0 1 0 ; 1 1 1 ];
B1C = [ 1 1 1 ; 0 0 0 ; 0 0 0 ];
B2  = [ 0 0 0 ; 1 1 0 ; 1 1 0 ];
B2C = [ 0 1 1 ; 0 0 1 ; 0 0 0 ];
B3  = [ 1 0 0 ; 1 1 0 ; 1 0 0 ];
B3C = [ 0 0 1 ; 0 0 1 ; 0 0 1 ];
B4  = [ 1 1 0 ; 1 1 0 ; 0 0 0 ];
B4C = [ 0 0 0 ; 0 0 1 ; 0 1 1 ];
B5  = [ 1 1 1 ; 0 1 0 ; 0 0 0 ];
B5C = [ 0 0 0 ; 0 0 0 ; 1 1 1 ];
B6  = [ 0 1 1 ; 0 1 1 ; 0 0 0 ];
B6C = [ 0 0 0 ; 1 0 0 ; 1 1 0 ];
B7  = [ 0 0 1 ; 0 1 1 ; 0 0 1 ];
B7C = [ 1 0 0 ; 1 0 0 ; 1 0 0 ];
B8  = [ 0 0 0 ; 0 1 1 ; 0 1 1 ];
B8C = [ 1 1 0 ; 1 0 0 ; 0 0 0 ];

[m,n] = size(II);
I1 =zeros(m,n,8);
S1 = zeros(m,n);
S2 = zeros(m,n);
S = zeros(m,n);
it = 1
Filtro = 1
while it <10
  while Filtro < 9

    % escolher filtros Bi e BiC =====================================
    if Filtro == 1
       Bi = B1;
       BiC = B1C;
    elseif Filtro ==2
       Bi = B2;
       BiC = B2C;
    elseif Filtro == 3
       Bi = B3;
       BiC = B3C;
    elseif Filtro == 4
       Bi = B4;
       BiC = B4C;
    elseif Filtro == 5
       Bi = B5;
       BiC = B5C;
    elseif Filtro == 6
       Bi = B6;
       BiC = B6C;
    elseif Filtro == 7
       Bi = B7;
       BiC = B7C;
    elseif Filtro == 8
       Bi = B8;
       BiC = B8C;
    end

    % Aplicar filtros ==============================================
    for i = 2:m-1
    for j = 2:n-1
        ind = 0;
        for k = -1:1
        for l = -1:1
            if Bi(2+k, 2+l) == 1 & II(i+k,j+l) == 1
               ind = ind+1;
            end
        end
        end
        if ind == 4
            S1(i,j) = II(i,j);
        else
            S1(i,j) = 0;
        end
        ind = 0;
        for k = -1:1
        for l = -1:1
            if BiC(2+k, 2+l) ==1 & (1 - II(i+k,j+l)) ==1
               ind = ind+1;
            end
        end
        end
        if ind >= 3
            S2(i,j) = 0; %1-II(i+k,j+l) ;
        else
            S2(i,j) = 1;
        end
    end
    end
    for i = 2:m-1
    for j = 2:n-1
        if S1(i,j)== 1 & S2(i,j)== 0
            S(i,j) = 1;
        else
            S(i,j) = 0;
        end
    end
    end

    % =======================================================


    Iaux = II - S;
    I1(:,:,Filtro) = Iaux;
    II = Iaux;
    Filtro = Filtro +1;
  end
  it = it+1;
  Filtro = 1;
end


% Mostrar Imagens ============================================================

subplot(2,3,1);
imagesc(II);
colormap(gray);
title('Imagem');

subplot(2,3,2);
imagesc(I1);
colormap(gray);
title('I1');

subplot(2,3,4);
imagesc(S1);
colormap(gray);
title('S1');

subplot(2,3,5);
imagesc(S2);
colormap(gray);
title('S2');

subplot(2,3,6);
imagesc(S);
colormap(gray);
title('S');
