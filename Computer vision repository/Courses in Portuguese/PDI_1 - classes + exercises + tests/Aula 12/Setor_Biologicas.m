clc;
clear all;
I = imread('Setor_Cbiologicas.tif' );

I = double(I);
[m,n] = size(I);
S1 = zeros(m,n);
it = 1
me = 3;
d2 = ceil(me/2);
  d1 = floor(me/2);

  
  % Dilatação:
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
  imagesc(S1)
colormap(gray)


  