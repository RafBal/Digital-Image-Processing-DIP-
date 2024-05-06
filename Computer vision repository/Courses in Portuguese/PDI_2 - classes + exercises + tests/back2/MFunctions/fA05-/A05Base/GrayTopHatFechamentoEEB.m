function y = GrayTopHatFechamentoEEB(Im,EE)

y = GrayFechamentoEEB(Im,EE);
y = y - Im;
