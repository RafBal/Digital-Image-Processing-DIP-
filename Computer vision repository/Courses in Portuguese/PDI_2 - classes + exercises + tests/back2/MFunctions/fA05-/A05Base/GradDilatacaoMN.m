function y = GradDilatacaoMN(Im,M,N)

y = GrayDilatacaoMN(Im,M,N);
y = y - Im;
