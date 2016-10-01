function ratio = snr(x1, n)
%  function ratio = snr(x1, n)
%
%   Calcula a SNR
%   x1 e n DEVEM ser vetores
%   length(x1) DEVE ser igual a length(n)

px1 = sum(abs(x1).^2)/length(x1);
pn = sum(abs(n).^2)/length(x1);

ratio = px1/pn;

return

