function y = GradErosaoMN(Im,M,N)

y = GrayErosaoMN(Im,M,N);
y = Im - y;
