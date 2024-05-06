Ima=imread('MDS_70cm.tif');
%Fechamento
%1ro abro (dilatação)2do fecho (erosão)
I=Ima;
EE = [
1  1  1
1  1  1
1  1  1
];
[m,n] = size(I);
[me,ne] = size(EE);
d2 = ceil(me/2);
d1 = floor(me/2);
S1 = zeros(m,n);
for  i = d2:m-d1
  for  j = d2:n-d1
     a = zeros(1,me*me);
     ind = 1;
     for k = -d1:d1
              for l = -d1:d1
                  a(1,ind) =  I(i+k, j+l) ;
                  ind = ind+1;
              end
     end
     S1(i,j) = max(a);
  end
end
%(erosão)

d2 = ceil(me/2);
d1 = floor(me/2);
%S1 = I;
S2 = zeros(m,n);
for i = d2:m-d1
    for j = d2:n-d1
        a = zeros(1,me*me);
        ind = 1;
        for k = -d1:d1
           for l = -d1:d1
               a(1,ind) = S1(i+k, j+l) - EE(d2+k,d2+l);
               ind = ind+1;
           end
        end
S2(i,j) = min(a);
    end
end
%=======================================================================
% terminou o fechamento 
% ==================================
% inicio de erosão de gradiente para encontrar a borda
% I- erosaõ(I)
% S2 - S3, S3=Eros(S2)
% criando a erosão do S2

d2 = ceil(me/2);
d1 = floor(me/2);
%S1 = I;
S3 = zeros(m,n);
for i = d2:m-d1
    for j = d2:n-d1
        a = zeros(1,me*me);
        ind = 1;
        for k = -d1:d1
           for l = -d1:d1
               a(1,ind) = S2(i+k, j+l) - EE(d2+k,d2+l);
               ind = ind+1;
           end
        end
S3(i,j) = min(a);
    end
end
S4= S2-S3;
% trocando de color
%=======================
% if S4(i,j) >= 2 o valor e 2 por que se considera o valor de alturas
% arvores de apro 2 metros


for i = 1:m
     for j = 1:n
         if S4(i,j) >= 2.2
            S4(i,j) = 0;
         else
            S4(i,j) = 255;
         end
     end
end

imagesc(S4)
colormap(gray)
axis equal
   
    