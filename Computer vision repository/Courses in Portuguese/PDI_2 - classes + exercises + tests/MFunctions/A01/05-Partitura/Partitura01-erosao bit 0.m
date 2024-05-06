B0= imread('partitura.jpeg');
B1= B0 >= 100;

I = B1;
[m,n]= size(I);

EE = [1 0 1 
      1 0 1 
      1 0 1 ];
[me,ne] = size(EE);

%============ Erosao ==============================

% EE: me != ne
dr1 = ceil(me/2);
dr2 = floor(me/2);

dc1 = ceil(ne/2);
dc2 = floor(ne/2);

I2 = ones(m,n);

for i = dr1:m-dr2
for j = dc1:n-dc2
ind = 0;
for k = -dr2:dr2
for l = -dc2:dc2
if EE(dr1+k,dc1+l) == 0 & I(i+k,j+l) == 0
  ind = ind+1;
end
end
end
if ind == 3
  I2(i,j) = I(i,j);
end
end
end

%============ Dilatacao ==============================

% Mesmo EE
%dr1 = ceil(me/2);
%dr2 = floor(me/2);
%
%dc1 = ceil(ne/2);
%dc2 = floor(ne/2);

I3 = ones(m,n);

for i = dr1:m-dr2
  for j = dc1:n-dc2
    if I2(i,j) == 0
      for k = -dr2:dr2
        for l = -dc2:dc2
          if EE(dr1+k,dc1+l)== 0
            I3(i+k,j+l) = 0;
          end % endif
        end
      end
    end % endif
  end
end

figure;
subplot(3,1,1);
imagesc(I);
colormap(gray);
title('Imagem');

subplot(3,1,2);
imagesc(I2);
colormap(gray);
title('Erosão Bit 0 (Preto)');

subplot(3,1,3);
imagesc(I3);
colormap(gray);
title('Dilatação Bit 0 (Preto)');
