function y = BinFechamento(Im,EE)

y = BinDilatacao(Im,EE);
y = BinErosao(y,EE);
