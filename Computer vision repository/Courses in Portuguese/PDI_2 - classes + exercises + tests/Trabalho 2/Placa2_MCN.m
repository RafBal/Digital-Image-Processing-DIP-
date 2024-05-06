clc;
clear all;

I = imread('placa2.tif');
I = double(I);
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
          T4(i,j) = I(i,j)*(x(1,j)^2);
          T5(i,j) = I(i,j)*(y(i,1)^2);
          % Ordem 3:
          T6(i,j) = y(i,1)*I(i,j)*(x(1,j)^2);
          T7(i,j) = (y(i,1)^2)*I(i,j)*x(1,j);
          T8(i,j) = I(i,j)*(x(1,j)^3);
          T9(i,j) = (y(i,1)^3)*I(i,j);
      end
  end
   % Momentos geométricos:
   % Ordem 1:
  M_10 = sum(sum(T1));
  M_01 = sum(sum(T2));
   % Ordem 2:
  M_11 = sum(sum(T3));
  M_20 = sum(sum(T4));
  M_02 = sum(sum(T5));
   % Ordem 3:
  M_21 = sum(sum(T6));
  M_12 = sum(sum(T7));
  M_30 = sum(sum(T8));
  M_03 = sum(sum(T9));
  
  % Centróides
  xm = M_10/M_00;
  ym = M_01/M_00;
  
  % Momentos centrais de ordem 2*:
mi_00 = M_00;
mi_01 = 0;
mi_10 = 0;
mi_11 = M_11 - (M_10 * M_01) / M_00;
mi_20 = M_20 - (M_10 ^2)/ M_00;
mi_02 = M_02 - (M_01 ^2)/ M_00;
mi_30 = M_30 - 3*xm*M_20 + 2*(xm^2)*M_10;
mi_12 = M_12 - 2*ym*M_11 - xm*M_02 + 2*(ym^2)* M_10;
mi_21 = M_21 - 2*xm*M_11 - ym*M_20 + 2*(xm^2)* M_01;
mi_03 = M_03 - 3*ym*M_02 + 2*(ym^2)*M_01;

% momentos centrais normalizados
eta_11=mi_11/mi_00^2
eta_20=mi_20/mi_00^2
eta_02=mi_02/mi_00^2
eta_21=mi_21/mi_00^(5/2)
eta_12=mi_12/mi_00^(5/2)
eta_30=mi_30/mi_00^(5/2)
eta_03=mi_03/mi_00^(5/2)
