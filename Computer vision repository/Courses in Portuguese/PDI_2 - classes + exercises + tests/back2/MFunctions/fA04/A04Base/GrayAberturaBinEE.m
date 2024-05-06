function y = GrayAberturaBinEE(Im,EE)

y = GrayErosaoBinEE(Im,EE);
y = GrayDilatacaoBinEE(y,EE);
