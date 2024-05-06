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
   % Ordem 2:
  M_11 = sum(sum(T3))
  M_20 = sum(sum(T4))
  M_02 = sum(sum(T5))
   % Ordem 3:
  M_21 = sum(sum(T6))
  M_12 = sum(sum(T7))   
  M_30 = sum(sum(T8))
  M_03 = sum(sum(T9))
  
  