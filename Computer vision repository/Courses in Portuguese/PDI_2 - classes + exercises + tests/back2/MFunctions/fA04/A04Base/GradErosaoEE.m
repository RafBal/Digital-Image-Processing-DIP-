function y = GradErosaoEE(Im,EE)

y = GrayErosaoEE(Im,EE);
y = Im - y;
