function y = GrayAberturaMN(Im,M,N)

y = GrayErosaoMN(Im,M,N);
y = GrayDilatacaoMN(y,M,N);
