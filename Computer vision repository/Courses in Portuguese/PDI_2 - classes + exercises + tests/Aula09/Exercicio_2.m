clc;
clear all;

I1 = imread('chave1.tif');
I1 = double(I1);

I2 = imread('chave2.tif');
I2 = double(I2);

I3 = imread('chave3.tif');
I3 = double(I3);

I4 = imread('chave4.tif');
I4 = double(I4);

[x,y] = size(I1);
S1 = zeros(x,y);
S2 = zeros(x,y);
S3 = S1;
S4 = S3;

E1 = S1;
P1 = S1;

E2 = S2;
P2 = S2;

E3 = S3;
P3 = S3;

E4 = S4;
P4 = S4;

Area1 = 0;
Area2 = 0;
Area3 = 0;
Area4 = 0;
Perimetro1 = 0;
Perimetro2 = 0;
Perimetro3 = 0;
Perimetro4 = 0;


EE = [0 1 0     % Conectividade 4.
      1 1 1
      0 1 0];
  [me,ne] = size(EE);
  
  d1 = ceil(me/2);
  d2 = floor(ne/2);
  
  % Calculando a área da chave1:
for i = 1:x
    for j = 1:y
        
    if I1(i,j) == 1
    S1(i,j) = 1;
   Area1 = Area1 + 1;
    end
    end
end

    
    % Erosão da chave1:
for i = d1:x-d2
for j = d1:y-d2
ind = 0;
for k = -d2:d2
for l = -d2:d2
if EE(d1+k,d1+l) == 1 & S1(i+k,j+l) == 1
ind = ind+1;
end
end
end
if ind == 5
E1(i,j) = S1(i,j);
end
end
end

P1 = S1-E1;
% Calculando o perímetro da chave1:
for i = 1:x 
    for j = 1:y
        
        if P1(i,j) == 1
            Perimetro1 = Perimetro1 + 1;
        end
    
    end
end

% Compacidade da chave1:
c1 = Perimetro1^2/(4*pi*Area1);

% Razão da circularidade da chave1:
Rc1 = 1/c1;
     
% Calculando a área da chave2:
for i = 1:x
    for j = 1:y
        if I2(i,j) == 1
            S2(i,j) = 1;
               Area2 = Area2 + 1;

        end
    end

end

 % Erosão da chave2:
for i = d1:x-d2
for j = d1:y-d2
ind = 0;
for k = -d2:d2
for l = -d2:d2
if EE(d1+k,d1+l) == 1 & S2(i+k,j+l) == 1
ind = ind+1;
end
end
end
if ind == 5
E2(i,j) = S2(i,j);
end
end
end

P2 = S2-E2;

% Calculando o perímetro da chave2:
for i = 1:x 
    for j = 1:y
        
        if P2(i,j) == 1
            Perimetro2 = Perimetro2 + 1;
        end
    
    end
end

% Compacidade da chave2:
c2 = Perimetro2^2/(4*pi*Area2);

% Razão da circularidade da chave2:
Rc2 = 1/c2;

  % Calculando a área da chave3:

for i = 1:x
    for j = 1:y
        if I3(i,j) == 1
            S3(i,j) = 1;
               Area3 = Area3 + 1;

        end
    end

end

% Erosão da chave3:
for i = d1:x-d2
for j = d1:y-d2
ind = 0;
for k = -d2:d2
for l = -d2:d2
if EE(d1+k,d1+l) == 1 & S3(i+k,j+l) == 1
ind = ind+1;
end
end
end
if ind == 5
E3(i,j) = S3(i,j);
end
end
end

P3 = S3-E3;
% Calculando o perímetro da chave3:
for i = 1:x 
    for j = 1:y
        
        if P3(i,j) == 1
            Perimetro3 = Perimetro3 + 1;
        end
    
    end
end

% Compacidade da chave3:
c3 = (Perimetro3^2)/(4*pi*Area3);

% Razão da circularidade da chave3:
Rc3 = 1/c3;

 % Calculando a área da chave4:
for i = 1:x
    for j = 1:y
        
    if I4(i,j) == 1
    S4(i,j) = 1;
   Area4 = Area4 + 1;
    end
    end
end

    
    % Erosão da chave4:
for i = d1:x-d2
for j = d1:y-d2
ind = 0;
for k = -d2:d2
for l = -d2:d2
if EE(d1+k,d1+l) == 1 & S4(i+k,j+l) == 1
ind = ind+1;
end
end
end
if ind == 5
E4(i,j) = S4(i,j);
end
end
end

P4 = S4-E4;
% Calculando o perímetro da chave1:
for i = 1:x 
    for j = 1:y
        
        if P4(i,j) == 1
            Perimetro4 = Perimetro4 + 1;
        end
    
    end
end

% Compacidade da chave4:
c4 = Perimetro4^2/(4*pi*Area4);

% Razão da circularidade da chave4:
Rc4 = 1/c4;
     
% 
% Area1
% Perimetro1
% c1
% Rc1
% 
% Area2
% Perimetro2
% c2
% Rc2
% 
% Area3
% Perimetro3
% c3
% Rc3

Rel12 = c1/c2
Rel13 = c1/c3
Rel14 = c1/c4

Rel23 = c2/c3
Rel21 = c2/c1
Rel24 = c2/c4

Rel31 = c3/c1
Rel32 = c3/c2
Rel34 = c3/c4


% A compacidade é invariante em relação à rotação e translação (mas não em relação à variação de escala).
subplot(1,4,1)
imagesc(S1)
axis equal
subplot(1,4,2)
imagesc(S2)
axis equal
subplot(1,4,3)
imagesc(S3)
axis equal
subplot(1,4,4)
imagesc(S4)
axis equal
