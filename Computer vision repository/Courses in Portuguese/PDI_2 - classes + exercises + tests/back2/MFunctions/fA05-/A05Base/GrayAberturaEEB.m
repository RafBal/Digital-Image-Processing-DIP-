function y = GrayAberturaEEB(Im,EEB)

y = GrayErosaoEEB(Im,EEB);
y = GrayDilatacaoEEB(y,EEB);
