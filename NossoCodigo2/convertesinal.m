load('../NossoCodigo/original66khz.mat')

addpath('../SegundoTrabalhoArquivos')

m = ceil(log2(length(original)));
audio = [original; zeros(2^m - length(original) ,1)] ;

k=6;
fs8k = 2^13;

x8khz6b = Analog2Digital(audio, fs8k, k, 0, 0, fs);

% save '-v6' 'audioDigital8khz6bit.mat' fs8k x8khz6b k