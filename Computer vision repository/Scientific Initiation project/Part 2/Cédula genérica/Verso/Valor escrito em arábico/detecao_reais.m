% Fazer para outros valores.
close all;
clc;
clear all;

%Preparando a imagem segmentada:
I = imread('segmento dois reais.tif');
I = double(I)/255;  % Extremamente necessário.
[m,n] = size(I)

%Ib  = I;
menor = 10000;

%Preparando o elemento estruturante:
EE = imread('EE_dois_reais77.tif');
EE = double(EE)/255;  % Extremamente necessário.
EE = EE(:,:,2);
[me,ne] = size(EE);

d2 = ceil(me/2);    % ceil arredonda para cima
d1 = floor(ne/2);   % floor arredonda para baixo
% Verredura dentro da imagem I
for i = d2:m-d1
for j = d2:n-d1
Ib = zeros(me,ne);

% Varredura dentro da imagem Ib
for k = -d1:d1
for l = -d1:d1
    Ib(k+d2,l+d2) = I(i+k, j+l);
end
end

  y = [1:me]';
  x = 1:ne;
  
  M_00 = sum(sum(Ib));
  
  for i = 1:me
      for j = 1:ne
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
  abscissa = xm;
ordenada = ym;
  
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

% EE = imread('EE_dois_reais.tif');
% %IpA = imread('dois reais reconstruido WS.tif');
% 
% EE = double(EE)/255;  % Extremamente necessário.
% EE = EE(:,:,2);
%  [m,n] = size(EE);
%   y = [1:m]';
%   x = 1:n;
%   
%   M_00pA = sum(sum(EE));
%   
%   for i = 1:m
%       for j = 1:n
%           % Ordem 1:
%           T1pA(i,j) = EE(i,j)*x(1,j);
%           T2pA(i,j) = EE(i,j)*y(i,1);
%            % Ordem 2:
%           T3pA(i,j) = EE(i,j)*x(1,j)*y(i,1);
%           T4pA(i,j) = EE(i,j)*(x(1,j)^2);
%           T5pA(i,j) = EE(i,j)*(y(i,1)^2);
%           % Ordem 3:
%           T6pA(i,j) = y(i,1)*EE(i,j)*(x(1,j)^2);
%           T7pA(i,j) = (y(i,1)^2)*EE(i,j)*x(1,j);
%           T8pA(i,j) = EE(i,j)*(x(1,j)^3);
%           T9pA(i,j) = (y(i,1)^3)*EE(i,j);
%       end
%   end
%    % Momentos geométricos:
%    % Ordem 1:
%   M_10pA = sum(sum(T1pA));
%   M_01pA = sum(sum(T2pA));
%    % Ordem 2:
%   M_11pA = sum(sum(T3pA));
%   M_20pA = sum(sum(T4pA));
%   M_02pA = sum(sum(T5pA));
%    % Ordem 3:
%   M_21pA = sum(sum(T6pA));
%   M_12pA = sum(sum(T7pA));
%   M_30pA = sum(sum(T8pA));
%   M_03p = sum(sum(T9pA));
%   
%   % Centróides
%   xmpA = M_10pA/M_00pA;
%   ympA = M_01pA/M_00pA;
%   
%   % Momentos centrais de ordem 2*:
% mi_00pA = M_00pA;
% mi_01pA = 0;
% mi_10pA = 0;
% mi_11pA = M_11pA - (M_10pA * M_01pA) / M_00pA;
% mi_20pA = M_20pA - (M_10pA ^2)/ M_00pA;
% mi_02pA = M_02pA - (M_01pA ^2)/ M_00pA;
% mi_30pA = M_30pA - 3*xmpA*M_20pA + 2*(xmpA^2)*M_10pA;
% mi_12pA = M_12pA - 2*ympA*M_11pA - xmpA*M_02pA + 2*(ympA^2)* M_10pA;
% mi_21pA = M_21pA - 2*xmpA*M_11pA - ympA*M_20pA + 2*(xmpA^2)* M_01pA;
% mi_03pA = M_03p - 3*ympA*M_02pA + 2*(ympA^2)*M_01pA;

% Momentos invariantes afins da cédula de dois reais.
I12 =   0.0224; % =(mi_20pA*mi_02pA - mi_11pA^2) / (mi_00pA^4)
I22 = 5.9961e-08; % =( (mi_30pA^2)*(mi_03pA^2) - 6* mi_30pA*mi_21pA*mi_12pA*mi_03pA + 4*mi_30pA*(mi_12pA^3)+ 4*(mi_21pA^3)*mi_03pA - 3*(mi_21pA^2)*(mi_12pA^2)) /(mi_00pA^10)
I32 = -1.0812e-05; % =( mi_20pA*(mi_21pA*mi_03pA-mi_12pA^2) - mi_11pA*(mi_30pA*mi_03pA-mi_21pA*mi_12pA) + mi_02pA*(mi_30pA*mi_12pA-mi_21pA^2)) / (mi_00pA^7)   

%Nota de 5:
I15 =  0.0311;
I25 = -3.1643e-09;
I35 = -1.2731e-05;

%Nota de 10:
I110 =  0.0287;
I210 = -5.0275e-09;
I310 = -1.8397e-05;

%Nota de 20:
I120 =  0.0273;
I220 =  6.6934e-09;
I320 = -1.4179e-05;

%Nota de 50:
I150 =  0.0263;
I250 =  1.1189e-09;
I350 = -3.0119e-06;

%Nota de 100:
I1100 =  0.0252;
I2100 = -2.8518e-10;
I3100 = -6.6839e-06;

tolerancia = 0.1;

% Fazer comparações que representam "distâncias"; quanto mais próximo de 0, melhor. 
comparar2 = sqrt((Resultado1 - I12)^2 + (Resultado2 - I22)^2 + (Resultado3 - I32)^2);
comparar5 = sqrt((Resultado1 - I15)^2 + (Resultado2 - I25)^2 + (Resultado3 - I35)^2);
comparar10 = sqrt((Resultado1 - I110)^2 + (Resultado2 - I210)^2 + (Resultado3 - I310)^2);
comparar20 = sqrt((Resultado1 - I120)^2 + (Resultado2 - I220)^2 + (Resultado3 - I320)^2);
comparar50 = sqrt((Resultado1 - I150)^2 + (Resultado2 - I250)^2 + (Resultado3 - I350)^2);
comparar100 = sqrt((Resultado1 - I1100)^2 + (Resultado2 - I2100)^2 + (Resultado3 - I3100)^2);

for w = 1:6 
    if w == 1
        comparar(w) = comparar2;
    end
    if w == 2
        comparar(w) = comparar5;
    end
    if w == 3
        comparar(w) = comparar10;
    end
    if w == 4
        comparar(w) = comparar20;
    end
    if w == 5
        comparar(w) = comparar50;
    end
    if w == 6
        comparar(w) = comparar100;
    end
end
%menor = 10000;
     for w = 1:6
         if comparar(w) < menor
             menor = comparar(w);
             z = w; %Guardar o valor do vetor que contém a cédula mais próxima.
             abscissareal = abscissa;
             ordenadareal = ordenada;
         end
     end
     end
end
     if menor <= tolerancia
         for w = 1:6 
            if z == w
                if z == 1
                    f = msgbox('2 reais')
                    beep
                    beep
                end
                if z == 2
                    f = msgbox('5 reais')
                    beep
                    pause(5)
                    beep
                end
                if z == 3
                    f = msgbox('10 reais')
                    beep
                    pause(10)
                    beep
                end
                if z == 4
                    f = msgbox('20 reais')
                    beep
                    beep
                    beep
                end
                if z == 5
                    f = msgbox('50 reais')
                    beep
                    beep
                    beep
                    beep
                end
                if z == 6
                    f = msgbox('100 reais')
                    beep
                    beep
                    beep
                    beep
                    beep
                  
                end
            end
         end
     end

%if abs(Resultado1 - Outro1A) <= tolerancia & abs(Resultado2 - Outro2A) <= tolerancia & abs(Resultado3 - Outro3A) <= tolerancia



    f = msgbox('outro valor')

