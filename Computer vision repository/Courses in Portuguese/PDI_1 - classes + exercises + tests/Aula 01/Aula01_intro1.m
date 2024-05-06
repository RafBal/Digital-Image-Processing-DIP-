% criando a variável A
A= [1 2 3; 4 5 6; 7 8 9]

% acessando o valor existente na linha 2 e coluna 3 da matriz A:
A(2,3)

whos

% A função whos retorna a informação sobre o tamanho (Size) das variáveis (em bytes) que 
% estão no espaço de trabalho do MATLAB e o tipo ou classe (class) de cada uma
% delas.

% double para inteiro: 
uint8(A)

% inteiro para double: double(A)