Ima=imread('esferas.tif');
I=Ima;
I=double(I)

%++++++++++++++++++++++++++++++++++++
% com elemento de quadrado
%++++++++++++++++++++++++++++++++++++


%tophat  por abertura H1

%-----------------------------------------
% criando a abertura S2
%-----------------------------------------
%%1o  erosao

% EE = [
% 1  1  1
% 1  1  1
% 1  1  1
% ];
EE = ones (15)
[m,n] = size(I);
[me,ne] = size(EE);
d2 = ceil(me/2);
d1 = floor(me/2);
S1 = zeros(m,n);
%S1 = I;
for i = d2:m-d1
    for j = d2:n-d1
        a = zeros(1,me*me);
        ind = 1;
        for k = -d1:d1
           for l = -d1:d1
               a(1,ind) = I(i+k, j+l) - EE(d2+k,d2+l);
               ind = ind+1;
           end
        end
S1(i,j) = min(a);
    end
end

%%2o  dilata��o

S2 = zeros(m,n);
for  i = d2:m-d1
  for  j = d2:n-d1
     a = zeros(1,me*me);
     ind = 1;
     for k = -d1:d1
              for l = -d1:d1
                  a(1,ind) =  S1(i+k, j+l) ;
                  ind = ind+1;
              end
     end
     S2(i,j) = max(a);
  end
end

H1= I-S2;
%----------------------
% imagesc(H1)
% colormap(gray)
% figure
% imagesc(I)
% colormap(gray)
% axis equal
%---------------------
   
%tophat  por fechamento H2

%-----------------------------------------
% criando a fechamento S4
%-----------------------------------------
%%1o  dilata��o

S3 = zeros(m,n);
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
     S3(i,j) = max(a);
  end
end

S4 = zeros(m,n);

for i = d2:m-d1
    for j = d2:n-d1
        a = zeros(1,me*me);
        ind = 1;
        for k = -d1:d1
           for l = -d1:d1
               a(1,ind) = S3(i+k, j+l) - EE(d2+k,d2+l);
               ind = ind+1;
           end
        end
S4(i,j) = min(a);
    end
end

%%2o  dilata��o

H2= S4 -I;

%----------------------
% imagesc(H2)
% colormap(gray)
% figure
% imagesc(I)
% colormap(gray)
% axis equal
%---------------------


imagesc(H1)
colormap(gray)
figure
imagesc(H2)
colormap(gray)
figure
imagesc(I)
colormap(gray)
axis equal



