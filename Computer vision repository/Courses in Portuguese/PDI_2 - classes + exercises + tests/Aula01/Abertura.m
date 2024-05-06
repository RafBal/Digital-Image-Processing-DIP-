I = [1 1 1 0 0 0
     1 1 1 0 0 0
     1 1 1 1 0 0
     0 0 1 1 1 1
     0 0 0 1 1 1
     0 0 0 1 1 1
     ]
     
EE = [0 1 0
      1 1 1
      0 1 0]
      
      [me,ne] = size(EE)
[m,n]= size(I);
% para EE quadrado: me = ne
d1 = ceil(me/2);
d2 = floor(ne/2);

S1 = zeros(m,n);
for i = d1:m-d2
for j = d1:n-d2
ind = 0;
for k = -d2:d2
for l = -d2:d2
if EE(d1+k,d1+l) == 1 & I(i+k,j+l) == 1
ind = ind+1;
end
end
end
if ind == 5
S1(i,j) = I(i,j);
end
end
end
S2 = zeros(m,n);
for i = d1:m-d2
for j = d1:n-d2
if S1(i,j) == 1
for k = -d2:d2
for l = -d2:d2
if EE(d1+k,d1+l)== 1
S2(i+k,j+l) = 1;
end
end
end
end
end
end

imagesc(S2)
colormap(gray)