load('../NossoCodigo/original66khz.mat')

addpath('../SegundoTrabalhoArquivos')

audio = original(1:round(0.2*length(original)));

m = ceil(length(audio)/20)*20;
audio = [audio; zeros(m -length(audio),1)];

k=6;
fs8k = 2^13;

x8khz6b = Analog2Digital(audio, fs8k, k, 0, 0, fs);


save('audioDigital8khz6bit','x8khz6b','k','fs8k');

% save '-v6' 'audioDigital8khz6bit.mat' fs8k x8khz6b k