% Fazer para outros valores.
clc;
clear all;

I = imread('segmento cinquenta reais.tif');
I = double(I)/255;  % Extremamente necessário.
Ib  = I(1:100,900:1000); 
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

IpA = imread('EE_50_reais.tif');
%IpA = imread('dois reais reconstruido WS.tif');

IpA = double(IpA)/255;  % Extremamente necessário.
IpA = IpA(:,:,2);
 [m,n] = size(IpA);
  y = [1:m]';
  x = 1:n;
  
  M_00pA = sum(sum(IpA));
  
  for i = 1:m
      for j = 1:n
          % Ordem 1:
          T1pA(i,j) = IpA(i,j)*x(1,j);
          T2pA(i,j) = IpA(i,j)*y(i,1);
           % Ordem 2:
          T3pA(i,j) = IpA(i,j)*x(1,j)*y(i,1);
          T4pA(i,j) = IpA(i,j)*(x(1,j)^2);
          T5pA(i,j) = IpA(i,j)*(y(i,1)^2);
          % Ordem 3:
          T6pA(i,j) = y(i,1)*IpA(i,j)*(x(1,j)^2);
          T7pA(i,j) = (y(i,1)^2)*IpA(i,j)*x(1,j);
          T8pA(i,j) = IpA(i,j)*(x(1,j)^3);
          T9pA(i,j) = (y(i,1)^3)*IpA(i,j);
      end
  end
   % Momentos geométricos:
   % Ordem 1:
  M_10pA = sum(sum(T1pA));
  M_01pA = sum(sum(T2pA));
   % Ordem 2:
  M_11pA = sum(sum(T3pA));
  M_20pA = sum(sum(T4pA));
  M_02pA = sum(sum(T5pA));
   % Ordem 3:
  M_21pA = sum(sum(T6pA));
  M_12pA = sum(sum(T7pA));
  M_30pA = sum(sum(T8pA));
  M_03p = sum(sum(T9pA));
  
  % Centróides
  xmpA = M_10pA/M_00pA;
  ympA = M_01pA/M_00pA;
  
  % Momentos centrais de ordem 2*:
mi_00pA = M_00pA;
mi_01pA = 0;
mi_10pA = 0;
mi_11pA = M_11pA - (M_10pA * M_01pA) / M_00pA;
mi_20pA = M_20pA - (M_10pA ^2)/ M_00pA;
mi_02pA = M_02pA - (M_01pA ^2)/ M_00pA;
mi_30pA = M_30pA - 3*xmpA*M_20pA + 2*(xmpA^2)*M_10pA;
mi_12pA = M_12pA - 2*ympA*M_11pA - xmpA*M_02pA + 2*(ympA^2)* M_10pA;
mi_21pA = M_21pA - 2*xmpA*M_11pA - ympA*M_20pA + 2*(xmpA^2)* M_01pA;
mi_03pA = M_03p - 3*ympA*M_02pA + 2*(ympA^2)*M_01pA;

% momentos invariantes afins
I1pA = (mi_20pA*mi_02pA - mi_11pA^2) / (mi_00pA^4)
I2pB = ( (mi_30pA^2)*(mi_03pA^2) - 6* mi_30pA*mi_21pA*mi_12pA*mi_03pA + 4*mi_30pA*(mi_12pA^3)+ 4*(mi_21pA^3)*mi_03pA - 3*(mi_21pA^2)*(mi_12pA^2)) /(mi_00pA^10)
I3pA = ( mi_20pA*(mi_21pA*mi_03pA-mi_12pA^2) - mi_11pA*(mi_30pA*mi_03pA-mi_21pA*mi_12pA) + mi_02pA*(mi_30pA*mi_12pA-mi_21pA^2)) / (mi_00pA^7)   


Outro1A = I1pA;
Outro2A = I2pB;
Outro3A = I3pA;
%tolerancia = 0.004;
tolerancia = 0.05;  % Tolerância foi alterada.

if abs(Resultado1 - Outro1A) <= tolerancia & abs(Resultado2 - Outro2A) <= tolerancia & abs(Resultado3 - Outro3A) <= tolerancia
    f = msgbox('50 reais')
else
    f = msgbox('outro valor')
end
