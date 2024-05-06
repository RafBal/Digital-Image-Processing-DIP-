clc
clear all

% Calcular valores IHS para  um pixel com RGB = (100, 150, 200)
R = 100/255;
G = 150/255;
B = 200/255;

if (R == G) & (R == B)
S = 0;
else
% intensidade
I = ( R + G + B) / 3;
% saturação
a = min([ R G B ] );
S = 1 - (3 * a) / ( R+ G + B ) ;
% matiz
num = ( R - G ) + (R - B ) ;
den = 2 * sqrt ( ( R - G )^2 + (R - B) * (G - B ) );
theta = acosd(num/den); % acosd serve para obter ângulo em graus.
if B <= G
H = theta;
elseif B > G
H = 360 - theta ;
end
end