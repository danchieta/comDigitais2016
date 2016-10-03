load('../NossoCodigo/original66khz.mat')

addpath('../SegundoTrabalhoArquivos')

fs8k = 2^13;
x8khz6b = uniformquantize(resample(original,fs8k,fs), 2^6);

save '-v6' 'audioDigital8khz6bit.mat' fs8k x9khz6b

