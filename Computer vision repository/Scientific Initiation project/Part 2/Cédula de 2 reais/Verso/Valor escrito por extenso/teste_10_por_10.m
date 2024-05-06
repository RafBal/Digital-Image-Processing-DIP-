% Fazer para outros valores.
clc;
clear all;

%I = imread('Dois_dez_por_dez.txt');
%I = double(I)/255;  % Extremamente necessário.
Ib  = [0000000000
0000011000
0000100100
0001000010
0000000100
0000001000
0000010000
0000100000
0001111110
0000000000];


%(257:290,383:541); 
[m,n] = size(Ib);
  y = [1:m]';
  x = 1:n;
  
  M_00 = sum(sum(Ib));
  
  for i = 1:m
      for j = 1:n
          % Ordem 1:
          T1(i,j) = Ib(i,j)*x(1,j);
          T2(i,j) = Ib(i,j)*y(i,1);
           % Ordem 2:
          T3(i,j) = Ib(i,j)*x(1,j)*y(i,1);
          T4(i,j) = Ib(i,j)*(x(1,j)^2);
          T5(i,j) = Ib(i,j)*(y(i,1)^2);
          % Ordem 3:
          T6(i,j) = y(i,1)*Ib(i,j)*(x(1,j)^2);
          T7(i,j) = (y(i,1)^2)*Ib(i,j)*x(1,j);
          T8(i,j) = Ib(i,j)*(x(1,j)^3);
          T9(i,j) = (y(i,1)^3)*Ib(i,j);
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

% momentos invariantes afins
I1 = (mi_20*mi_02 - mi_11^2) / (mi_00^4)
I2 = ( (mi_30^2)*(mi_03^2) - 6* mi_30*mi_21*mi_12*mi_03 + 4*mi_30*(mi_12^3)+ 4*(mi_21^3)*mi_03 - 3*(mi_21^2)*(mi_12^2)) /(mi_00^10)
I3 = ( mi_20*(mi_21*mi_03-mi_12^2) - mi_11*(mi_30*mi_03-mi_21*mi_12) + mi_02*(mi_30*mi_12-mi_21^2)) / (mi_00^7)   


Resultado1 = I1;
Resultado2 = I2;
Resultado3 = I3;

clear x
clear y

%IpB = fopen('Dois_dez_por_dez_2.txt','r');
%IpB = imread('cinco reais reconstruido WS.tif');

%IpB = double(IpB)/255;  % Extremamente necessário.
%IpB = IpB(:,:,2);

IpB = [0000000000
       0000110000
       0001001000
       0010000100
       0000001000
       0000010000
       0000100000
       0001000000
       0011111100
       0000000000];
 [m,n] = size(IpB);
  y = [1:m]';
  x = 1:n;
  
  mi_00pB = sum(sum(IpB));
  
  for i = 1:m
      for j = 1:n
          % Ordem 1:
          T1pB(i,j) = IpB(i,j)*x(1,j);
          T2pB(i,j) = IpB(i,j)*y(i,1);
           % Ordem 2:
          T3pB(i,j) = IpB(i,j)*x(1,j)*y(i,1);
          T4pB(i,j) = IpB(i,j)*(x(1,j)^2);
          T5pB(i,j) = IpB(i,j)*(y(i,1)^2);
          % Ordem 3:
          T6pB(i,j) = y(i,1)*IpB(i,j)*(x(1,j)^2);
          T7pB(i,j) = (y(i,1)^2)*IpB(i,j)*x(1,j);
          T8pB(i,j) = IpB(i,j)*(x(1,j)^3);
          T9pB(i,j) = (y(i,1)^3)*IpB(i,j);
      end
  end
   % Momentos geométricos:
   % Ordem 1:
  M_10pB = sum(sum(T1pB));
  M_01pB = sum(sum(T2pB));
   % Ordem 2:
  M_11pB = sum(sum(T3pB));
  M_20pB = sum(sum(T4pB));
  M_02pB = sum(sum(T5pB));
   % Ordem 3:
  M_21pB = sum(sum(T6pB));
  M_12pB = sum(sum(T7pB));
  M_30pB = sum(sum(T8pB));
  M_03pB = sum(sum(T9pB));
  
  % Centróides
  xmpB = M_10pB/mi_00pB;
  ympB = M_01pB/mi_00pB;
  
  % Momentos centrais de ordem 2*:
mi_00pB = mi_00pB;
mi_01pB = 0;
mi_10pB = 0;
mi_11pB = M_11pB - (M_10pB * M_01pB) / mi_00pB;
mi_20pB = M_20pB - (M_10pB ^2)/ mi_00pB;
mi_02pB = M_02pB - (M_01pB ^2)/ mi_00pB;
mi_30pB = M_30pB - 3*xmpB*M_20pB + 2*(xmpB^2)*M_10pB;
mi_12pB = M_12pB - 2*ympB*M_11pB - xmpB*M_02pB + 2*(ympB^2)* M_10pB;
mi_21pB = M_21pB - 2*xmpB*M_11pB - ympB*M_20pB + 2*(xmpB^2)* M_01pB;
mi_03pB = M_03pB - 3*ympB*M_02pB + 2*(ympB^2)*M_01pB;

% momentos invariantes afins
I1pB = (mi_20pB*mi_02pB - mi_11pB^2) / (mi_00pB^4)
I2pB = ( (mi_30pB^2)*(mi_03pB^2) - 6* mi_30pB*mi_21pB*mi_12pB*mi_03pB + 4*mi_30pB*(mi_12pB^3)+ 4*(mi_21pB^3)*mi_03pB - 3*(mi_21pB^2)*(mi_12pB^2)) /(mi_00pB^10)
I3pB = ( mi_20pB*(mi_21pB*mi_03pB-mi_12pB^2) - mi_11pB*(mi_30pB*mi_03pB-mi_21pB*mi_12pB) + mi_02pB*(mi_30pB*mi_12pB-mi_21pB^2)) / (mi_00pB^7)   


Outro1B = I1pB;
Outro2B = I2pB;
Outro3B = I3pB;
%tolerancia = 0.004;
tolerancia = 0.07;

if abs(Resultado1 - Outro1B) <= tolerancia & abs(Resultado2 - Outro2B) <= tolerancia & abs(Resultado3 - Outro3B) <= tolerancia
    f = msgbox('2 reais')
else
    f = msgbox('outro valor')
end
