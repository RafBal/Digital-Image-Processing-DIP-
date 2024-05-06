function y = AberturaGray(Im,m,n)

y = ErosaoGray(Im,m,n);
y = DilatacaoGray(y,m,n);
