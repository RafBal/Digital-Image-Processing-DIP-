% Coisas a verificar:
% 1) Converter RGB para gray
% 2) Retirar ruído (pré-processamento) como no exercício do flamingo do
% semestre passado.

close all
clc
clear all

c = 20;     % c = c0

u = imread('semaforo_pedestre.jpg');
u = double(u);
gradx = u;
grady = u;
divergent = u;
[m,n] = size(u);

for i = 1:1:m-1
    for j = 1:1:n-1
        % Construindo o gradiente:
        gradx(i,j) = u(i+1,j) - u(i,j);
        gradx(i,j) = gradx(i,j)*c;
        grady(i,j) = u(i,j+1) - u(i,j);
        grady(i,j) = grady(i,j)*c;
    end
end

for i = 1:1:m-1
    for j = 1:1:n-1
% Construindo o divergente:
        hx(i,j) = gradx(i+1,j) - gradx(i,j);
        hy(i,j) = grady(i,j+1) - grady(i,j);
        divergent(i,j) = hx(i,j) +hy(i,j);
    end
end

%v = -divergence(gradient(u1, [x, y]), [x, y]) + u;
v0 = u - divergent;
v0 = rgb2gray(v0);
imagesc(v0)
axis equal
colormap gray

