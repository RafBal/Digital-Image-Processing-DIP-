clear all
clc

B = [5 1 2; 3 9 4; 7 6 8]

for i = 1:3
    for j = 1:3 
    if B(i,j)<= 3
        C(i,j) = 0;
    else
        C(i,j) = B(i,j);
    end
    end
end
 C