% definição do elemento estruturante circular
me = 45 % diâmetro do círculo; tem que ser ímpar
d2= ceil(me/2)
d1 = floor(me/2)
EE = zeros(me,me);
for k = -d2:d2
for l = -d2:d2
if sqrt( (d2 - (d2+k)) ^2 + (d2 - (d2+l)) ^2 ) <= (d1+0.4)
EE(d2+k,d2+l) = 1;
end
end
end
imagesc(EE)
colormap(gray)
axis equal