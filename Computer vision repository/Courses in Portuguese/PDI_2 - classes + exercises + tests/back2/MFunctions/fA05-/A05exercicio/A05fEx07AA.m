% Mostrar Imagens =========================================

% ---------------------------------------------------------
figure 1;

subplot(1,2,1);
imagesc(Ia1);
colormap(gray);
title('Ia1 = GrayAberturaEEB(Im,EE)');

subplot(1,2,2);
imagesc(Ia2);
colormap(gray);
title('Ia2 = GrayFechamentoEEB(Im,EE)');

% ---------------------------------------------------------
figure 2;

subplot(1,2,1);
imagesc(Ib1);
colormap(gray);
title('Ib1 = GrayTopHatAberturaEEB(Im,EE)');

subplot(1,2,2);
imagesc(Ib2);
colormap(gray);
title('Ib2 = GrayTopHatFechamentoEEB(Im,EE)');
% ---------------------------------------------------------
figure 3;

subplot(1,2,1);
imagesc(Ic1);
colormap(gray);
title('Ic1 = GrayFechamentoEEB [GrayAberturaEEB(Im,EE)]');

subplot(1,2,2);
imagesc(Ic2);
colormap(gray);
title('Ic2 = GrayAberturaEEB [GrayFechamentoEEB(Im,EE)]');

% =========================================================
