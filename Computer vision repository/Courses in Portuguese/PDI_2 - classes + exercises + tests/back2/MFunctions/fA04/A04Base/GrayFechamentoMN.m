function y = GrayFechamentoMN(Im,M,N)

y = GrayDilatacaoMN(Im,M,N);
y = GrayErosaoMN(y,M,N);
