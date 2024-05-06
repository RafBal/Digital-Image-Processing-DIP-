function y = GrayFechamentoBinEE(Im,EE)

y = GrayDilatacaoBinEE(Im,EE);
y = GrayErosaoBinEE(y,EE);
