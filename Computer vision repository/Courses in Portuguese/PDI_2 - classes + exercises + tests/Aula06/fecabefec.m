clc;
clear all;
% fecabefec = fechamento + (abertura + fechamento);
% Efeito: Reduz regi�es escuras; refor�a regi�es claras.
% 1� fechamento, 2� abertura, 3� fechamento
I = imread('esferas.tif');
EE = [0 0 1 0 0
      0 0 1 0 0
      1 1 1 1 1
      0 0 1 0 0
      0 0 1 0 0];
  [m,n] = size(I);
  [me,ne] = size(EE);
  d2 = ceil(me/2);
  d1 = floor(me/2);
  S1 = zeros(m,n);
  % Fechamento = dilata��o + eros�o;
  % Dilata��o:
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
  
% Eros�o:
S2 = zeros(m,n);
for i = d2:m-d1
    for j = d2:n-d1
        a = zeros(1,me*ne);
        ind = 1;
        for k = -d1:d1
            for l = -d1:d1
            a(1, ind) = S1(i+k, j+l) - EE(d2+k,d2+l);
            ind = ind+1;
        end
    end
    S2(i,j) = min(a);
end
end

% Abertura = eros�o + dilata��o;
% Eros�o:
S3 = zeros(m,n);
for i = d2:m-d1
    for j = d2:n-d1
        a = zeros (1,me*ne);
        ind = 1;
        for k = -d1:d1
            for l = -d1:d1
                a(1, ind) = S2(i+k, j+l) - EE(d2+k,d2+l);
                ind = ind+1;
            end
        end
        S3(i,j) = min(a);
    end
end

% Dilata��o: 
S4 = zeros(m,n);
for i = d2:m-d1
    for j = d2:n-d1
        a = zeros(1,me*me);
        ind = 1;
        for k = -d1:d1
            for l = -d1:d1
            a(1, ind) = S3(i+k, j+l);
            ind = ind+1;
        end
    end
S4(i,j) = max(a);   
    end
end

% Fechamento = dilata��o + eros�o;
  % Dilata��o:
  S5 = zeros(m,n);
  for  i = d2:m-d1
  for  j = d2:n-d1
     a = zeros(1,me*me);
     ind = 1;
     for k = -d1:d1
              for l = -d1:d1
                  a(1,ind) =  S4(i+k, j+l) ;
                  ind = ind+1;
              end
     end
     S5(i,j) = max(a);
  end
  end
  
% Eros�o:
S6 = zeros(m,n);
for i = d2:m-d1
    for j = d2:n-d1
        a = zeros(1,me*ne);
        ind = 1;
        for k = -d1:d1
            for l = -d1:d1
            a(1, ind) = S5(i+k, j+l) - EE(d2+k,d2+l);
            ind = ind+1;
        end
    end
    S6(i,j) = min(a);
end
end
imagesc(S6)
colormap(gray)


