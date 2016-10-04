% David Anchieta - 2016
% Arthur Ramos
% Itamar de Aguiar
% Hanna Carvalho

%% Configuração inicial
load('audioDigital8khz6bit.mat')
addpath('../SegundoTrabalhoArquivos')

%% Modulação PSK

xBPSK = PhaseMod(x8khz6b, 2, 0);

%% Plot de constelação dos sinais sem ruído

figure(1)
scatter(real(xBPSK), imag(xBPSK))
title('constelacao xBPSK sem ruido')
xlabel('real')
ylabel('imag')

%% Largura de Banda
bandBPSK = Bandwidth(xBPSK, fs8k*2, 0.999)

%% Adicionando ruído aos sinais
SNRbit = 10^0.8;
xBPSKn = AddNoise(xBPSK, SNRbit, 2);

%% Constelações dos sinais com ruído

figure(2)
scatter(real(xBPSKn), imag(xBPSKn))
title('constelacao xBPSK com ruido')
xlabel('real')
ylabel('imag')

%% Demodulação (e 'conversão' DA) dos sinais com ruído

demxBPSK = Digital2Analog(PhaseDemod(xBPSKn,2,0),k,0,0);

%% Taxa erros de bit
BER_BPSK = sum(~(PhaseDemod(xBPSKn,2,0)' == x8khz6b))/length(x8khz6b)
% sound(demxBPSK, fs8k)

figure(3)
plot([0:1/fs8k:(length(demxBPSK)-1)/fs8k], demxBPSK)
title('Sinal demodulado BPSK')
xlabel('tempo (s)')

