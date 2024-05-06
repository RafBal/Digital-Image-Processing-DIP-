clc;
clear all;

I = [0 1 1 1 0 0 0 0 0
     0 1 1 1 1 1 1 1 0
     1 1 1 1 1 1 1 1 0
     0 1 1 1 0 0 0 0 0
     0 0 1 1 0 0 0 0 0
     0 0 0 0 0 0 0 0 0]
 [m,n] = size(I);
  y = [1:m]';
  x = 1:n;
  
  M_00 = sum(sum(I));
  
  for i = 1:m
      for j = 1:n
           % Ordem 1:
          T1(i,j) = I(i,j)*x(1,j);
          T2(i,j) = I(i,j)*y(i,1);
           % Ordem 2:
          T3(i,j) = I(i,j)*x(1,j)*y(i,1);
          T4(i,j) = I(i,j)*x(1,j)^2;
          T5(i,j) = I(i,j)*y(i,1)^2;
      end
  end
  % Momentos geométricos:
   % Ordem 1:
  M_10 = sum(sum(T1)) 
  M_01 = sum(sum(T2))
   % Ordem 2:
  M_11 = sum(sum(T3))
  M_20 = sum(sum(T4))
  M_02 = sum(sum(T5))
  
  % Momentos centrais de ordem 2*:
mi_11 = M_11-(M_10*M_01)/M_00
mi_20 = M_20-(M_10^2)/M_00
mi_02 = M_02-(M_01^2)/M_00

%   *Pois os momentos centrais de ordem 1 são iguais a zero.
  
% Ângulo que o eixo principal de inércia forma com o eixo x:
Theta = (1/2)*atand((2*mi_11)/(mi_20-mi_02))    % Resultado em graus.

% Excentricidade do objeto:
e = ((mi_20-mi_02)^2+4*mi_11)/M_00
% Relação entre o eixo vertical e horizontal.