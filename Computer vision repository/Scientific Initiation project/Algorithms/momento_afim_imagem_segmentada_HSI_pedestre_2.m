clc;
clear all;

I = imread('segmento HSI 1.tif');
I = double(I)/255;  % Extremamente necessário.
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
  
  % Momentos centrais de ordem 3:
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

% momentos invariantes afins
I1 = (mi_20*mi_02 - mi_11^2) / (mi_00^4)
I2 = ( (mi_30^2)*(mi_03^2) - 6* mi_30*mi_21*mi_12*mi_03 + 4*mi_30*(mi_12^3)+ 4*(mi_21^3)*mi_03 - 3*(mi_21^2)*(mi_12^2)) /(mi_00^10)
I3 = ( mi_20*(mi_21*mi_03-mi_12^2) - mi_11*(mi_30*mi_03-mi_21*mi_12) + mi_02*(mi_30*mi_12-mi_21^2)) / (mi_00^7)   


Resultado1 = I1;
Resultado2 = I2;
Resultado3 = I3;

clear x
clear y

Ip = imread('EE_oficial.tif');
Ip = double(Ip)/255;  % Extremamente necessário.
Ip = Ip(:,:,2);
 [m,n] = size(Ip);
  y = [1:m]';
  x = 1:n;
  
  M_00p = sum(sum(Ip));
  
  for i = 1:m
      for j = 1:n
          % Ordem 1:
          T1p(i,j) = Ip(i,j)*x(1,j);
          T2p(i,j) = Ip(i,j)*y(i,1);
           % Ordem 2:
          T3p(i,j) = Ip(i,j)*x(1,j)*y(i,1);
          T4p(i,j) = Ip(i,j)*(x(1,j)^2);
          T5p(i,j) = Ip(i,j)*(y(i,1)^2);
          % Ordem 3:
          T6p(i,j) = y(i,1)*Ip(i,j)*(x(1,j)^2);
          T7p(i,j) = (y(i,1)^2)*Ip(i,j)*x(1,j);
          T8p(i,j) = Ip(i,j)*(x(1,j)^3);
          T9p(i,j) = (y(i,1)^3)*Ip(i,j);
      end
  end
   % Momentos geométricos:
   % Ordem 1:
  M_10p = sum(sum(T1p));
  M_01p = sum(sum(T2p));
   % Ordem 2:
  M_11p = sum(sum(T3p));
  M_20p = sum(sum(T4p));
  M_02p = sum(sum(T5p));
   % Ordem 3:
  M_21p = sum(sum(T6p));
  M_12p = sum(sum(T7p));
  M_30p = sum(sum(T8p));
  M_03p = sum(sum(T9p));
  
  % Centróides
  xmp = M_10p/M_00p;
  ymp = M_01p/M_00p;
  
  % Momentos centrais de ordem 2*:
mi_00p = M_00p;
mi_01p = 0;
mi_10p = 0;
mi_11p = M_11p - (M_10p * M_01p) / M_00p;
mi_20p = M_20p - (M_10p ^2)/ M_00p;
mi_02p = M_02p - (M_01p ^2)/ M_00p;
mi_30p = M_30p - 3*xmp*M_20p + 2*(xmp^2)*M_10p;
mi_12p = M_12p - 2*ymp*M_11p - xmp*M_02p + 2*(ymp^2)* M_10p;
mi_21p = M_21p - 2*xmp*M_11p - ymp*M_20p + 2*(xmp^2)* M_01p;
mi_03p = M_03p - 3*ymp*M_02p + 2*(ymp^2)*M_01p;

% momentos invariantes afins
I1p = (mi_20p*mi_02p - mi_11p^2) / (mi_00p^4)
I2p = ( (mi_30p^2)*(mi_03p^2) - 6* mi_30p*mi_21p*mi_12p*mi_03p + 4*mi_30p*(mi_12p^3)+ 4*(mi_21p^3)*mi_03p - 3*(mi_21p^2)*(mi_12p^2)) /(mi_00p^10)
I3p = ( mi_20p*(mi_21p*mi_03p-mi_12p^2) - mi_11p*(mi_30p*mi_03p-mi_21p*mi_12p) + mi_02p*(mi_30p*mi_12p-mi_21p^2)) / (mi_00p^7)   


Outro1 = I1p;
Outro2 = I2p;
Outro3 = I3p;
tolerancia = 0.0014;

if abs(Resultado1 - Outro1) <= tolerancia & abs(Resultado2 - Outro2) <= tolerancia & abs(Resultado3 - Outro3) <= tolerancia
    f = msgbox('Pedestre andando')
else
    f = msgbox('Pedestre parado')
end
