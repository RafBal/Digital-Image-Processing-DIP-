function y = FechamentoEEGray1(Im,EE)

y = DilatacaoEEGray1(Im,EE);
y = ErosaoEEGray1(y,EE);
