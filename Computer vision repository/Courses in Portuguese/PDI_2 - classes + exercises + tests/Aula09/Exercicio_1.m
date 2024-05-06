clc;
clear all;

I = imread('frutas_8bits.tif');
I = double(I);

[x,y] = size(I);
S1 = zeros(x,y);
S2 = zeros(x,y);
S3 = S1;

E1 = S1;
P1 = S1;

E2 = S2;
P2 = S2;

E3 = S3;
P3 = S3;

Area1 = 0;
Area2 = 0;
Area3 = 0;
Perimetro1 = 0;
Perimetro2 = 0;
Perimetro3 = 0;


EE = [0 1 0     % Conectividade 4.
      1 1 1
      0 1 0];
  [me,ne] = size(EE);
  
  d1 = ceil(me/2);
  d2 = floor(ne/2);
  
  % Calculando a área da maçã:
for i = 1:x
    for j = 1:y
        
    if I(i,j) == 50
    S1(i,j) = 1;
   Area1 = Area1 + 1;
    end
    end
end

    
    % Erosão da maçã:
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
% Calculando o perímetro da maçã:
for i = 1:x 
    for j = 1:y
        
        if P1(i,j) == 1
            Perimetro1 = Perimetro1 + 1;
        end
    
    end
end

% Compacidade da maçã:
c1 = Perimetro1^2/(4*pi*Area1);

% Razão da circularidade da maçã:
Rc1 = 1/c1;
     
% Calculando a área da pêra:
for i = 1:x
    for j = 1:y
        if I(i,j) == 100
            S2(i,j) = 1;
               Area2 = Area2 + 1;

        end
    end

end

 % Erosão da pêra:
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

% Calculando o perímetro da pêra:
for i = 1:x 
    for j = 1:y
        
        if P2(i,j) == 1
            Perimetro2 = Perimetro2 + 1;
        end
    
    end
end

% Compacidade da pêra:
c2 = Perimetro2^2/(4*pi*Area2);

% Razão da circularidade da pêra:
Rc2 = 1/c2;

  % Calculando a área da banana:

for i = 1:x
    for j = 1:y
        if I(i,j) == 150
            S3(i,j) = 1;
               Area3 = Area3 + 1;

        end
    end

end

% Erosão da banana:
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


% Calculando o perímetro da banana:
for i = 1:x 
    for j = 1:y
        
        if P3(i,j) == 1
            Perimetro3 = Perimetro3 + 1;
        end
    
    end
end

% Compacidade da banana:
c3 = (Perimetro3^2)/(4*pi*Area3);

% Razão da circularidade da banana:
Rc3 = 1/c3;


Area1
Perimetro1
c1
Rc1

Area2
Perimetro2
c2
Rc2

Area3
Perimetro3
c3
Rc3

subplot(1,3,1)
imagesc(S1)
axis equal
subplot(1,3,2)
imagesc(S2)
axis equal
subplot(1,3,3)
imagesc(S3)
axis equal

