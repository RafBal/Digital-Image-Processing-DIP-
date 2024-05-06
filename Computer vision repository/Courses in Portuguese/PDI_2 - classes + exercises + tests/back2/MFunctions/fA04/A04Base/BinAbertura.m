function y = BinAbertura(Im,EE)

y = BinErosao(Im,EE);
y = BinDilatacao(y,EE);
