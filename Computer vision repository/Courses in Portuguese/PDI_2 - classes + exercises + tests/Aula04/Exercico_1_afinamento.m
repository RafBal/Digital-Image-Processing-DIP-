clc;
clear all;
I = imread('Ferramenta5.tif');
I = double(I);
[m,n] = size(I);
I1 =zeros(m,n,8);
S1 = zeros(m,n);
S2 = zeros(m,n);
S = zeros(m,n);
it = 1
Filtro = 1
while it <18
    %Elementos estruturantes
B1 = [ 0 0 0 ; 0 1 0 ; 1 1 1];
B1C = [ 1 1 1; 0 0 0; 0 0 0];
B2 = [ 0 0 0; 1 1 0; 1 1 0 ];
B2C=[ 0 1 1; 0 0 1; 0 0 0];
B3 = [ 1 0 0 ;1 1 0; 1 0 0];
B3C = [0 0 1; 0 0 1; 0 0 1];
B4 = [ 1 1 0; 1 1 0; 0 0 0];
B4C = [0 0 0; 0 0 1; 0 1 1];
B5 = [ 1 1 1; 0 1 0; 0 0 0];
B5C = [ 0 0 0; 0 0 0; 1 1 1];
B6 = [ 0 1 1; 0 1 1; 0 0 0 ];
B6C = [ 0 0 0; 1 0 0; 1 1 0];
B7 = [ 0 0 1; 0 1 1 ; 0 0 1];
B7C = [ 1 0 0; 1 0 0; 1 0 0];
B8 = [ 0 0 0; 0 1 1; 0 1 1];
B8C = [ 1 1 0; 1 0 0;0 0 0];

while Filtro < 9
if Filtro == 1
Bi = B1;
BiC = B1C;
elseif Filtro ==2
Bi = B2;
BiC = B2C;
elseif Filtro == 3
Bi = B3;
BiC = B3C;
elseif Filtro == 4
Bi = B4;
BiC = B4C;
elseif Filtro == 5
Bi = B5;
BiC = B5C;
elseif Filtro == 6
Bi = B6;
BiC = B6C;
elseif Filtro == 7
Bi = B7;
BiC = B7C;
elseif Filtro == 8
Bi = B8;
BiC = B8C;
    end
for i = 2:m-1
for j = 2:n-1
ind = 0;
for k = -1:1
for l = -1:1
if Bi(2+k, 2+l) == 1 & I(i+k,j+l) == 1
ind = ind+1;
end
end
end
if ind == 4
S1(i,j) = I(i,j);
else
S1(i,j) = 0;
end
ind = 0;
for k = -1:1
for l = -1:1
if BiC(2+k, 2+l) ==1 & (1 - I(i+k,j+l)) ==1
ind = ind+1;
end
end
end
if ind >= 3
S2(i,j) = 0; %1-I(i+k,j+l) ;
else
S2(i,j) = 1;
end
end
end
for i = 2:m-1
for j = 2:n-1
if S1(i,j)== 1 & S2(i,j)== 0
S(i,j) = 1;
else
S(i,j) = 0;
end
end
end

Iaux = I-S;
I1(:,:,Filtro) = Iaux;
I = Iaux;
Filtro = Filtro +1;
end
it = it+1;
Filtro = 1;
end
imagesc(I);

%it = 1;
%while it < 18 
%subplot(2,9,it);
%plot(I1(:,:,it))
%i=i+1;
%end
