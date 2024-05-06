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
  
  M_00 = sum(sum(I))
  
  for i = 1:m
      for j = 1:n
          T1(i,j) = I(i,j)*x(1,j);
          T2(i,j) = I(i,j)*y(i,1);
      end
  end
  M_10 = sum(sum(T1))
  M_01 = sum(sum(T2))
  
  xm = M_10/M_00
  ym = M_01/M_00
  