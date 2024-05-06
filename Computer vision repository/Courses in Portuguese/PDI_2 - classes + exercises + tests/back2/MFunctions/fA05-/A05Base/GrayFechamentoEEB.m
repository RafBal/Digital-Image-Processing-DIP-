function y = GrayFechamentoEEB(Im,EE)

y = GrayDilatacaoEEB(Im,EE);
y = GrayErosaoEEB(y,EE);
