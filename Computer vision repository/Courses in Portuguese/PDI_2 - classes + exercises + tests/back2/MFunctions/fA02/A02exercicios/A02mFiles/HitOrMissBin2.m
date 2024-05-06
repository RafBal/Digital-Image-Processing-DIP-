function y = HitOrMissBin2(Im,EE)

y = ErosaoBin2(Im,EE) & ErosaoBin2(~Im,~EE);
