%aprox de um circulo para o elemento estruturante
%para d = 15, debe ser um valor impar debido a definição do centro da
%figura
d=1001
me = d   %  d :  diâmetro do círculo
d2= ceil(me/2)
d1 = floor(me/2)
EE = zeros(me,me);
for k = -d2:d2
for l = -d2:d2
if  sqrt(  (d2 - (d2+k)) ^2 + (d2 - (d2+l)) ^2  ) <= (d1+0.4)
EE(d2+k,d2+l) = 1;
end
end
end

imagesc(EE)
colormap(gray)
% para ter 
axis equal
