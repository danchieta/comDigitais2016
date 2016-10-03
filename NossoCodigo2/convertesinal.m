load('../NossoCodigo/original66khz.mat')

addpath('../SegundoTrabalhoArquivos')

fs8k = 2^13;
k = 6
x8khz6b = Analog2Digital(original, fs8k, k, 0, 0, fs);

% save '-v6' 'audioDigital8khz6bit.mat' fs8k x8khz6b k

