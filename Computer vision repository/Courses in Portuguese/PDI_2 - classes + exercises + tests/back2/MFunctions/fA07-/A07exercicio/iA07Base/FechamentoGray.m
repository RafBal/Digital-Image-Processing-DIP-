function y = FechamentoGray(Im,m,n)

y = DilatacaoGray(Im,m,n);
y = ErosaoGray(y,m,n);
