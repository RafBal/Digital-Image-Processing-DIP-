function y = GrayTopHatAberturaEEB(Im,EE)

y = GrayAberturaEEB(Im,EE);
y = Im - y;
