% Arthur Ramos
% David Anchieta
% Hanna Carvalho
% Itamar de aguiar

% N�o precisa executar o script todo sempre.
% Basta selecionar as linhas que quer executar e apertar F9.

%% Configuracao inicial
addpath('../Primeiro_trabalho_funcoes')
load('original66khz') % carrega o audio com taxa de amostragem
timeoriginal = 0:1/fs:(length(original)-1)/fs;


%% Analise de ESD
EnergySpectralDensity(original, fs);
xlim([-1500,1500]) % Limita o gr�fico � parte que interessa
title('ESD sinal de m�sica amostrado f_s=65536')

%%Analise de largura de banda
largurabandaoriginal = Bandwidth(original, fs, 0.999)

%% Reamostrando o sinal
% Tente varias taxas de amostragem entre f_s = 2048 e f_s = 16384.

f_s16 = 16384;
x16k = sample(original,f_s16);
EnergySpectralDensity(x16k, f_s16);
xlim([-1500,1500]) % Limita o gr�fico � parte que interessa
title('ESD sinal de m�sica amostrado f_s=16384')

f_s8 = 8192;
x8k = sample(original,f_s8);
EnergySpectralDensity(x8k, f_s8);
xlim([-1500,1500]) % Limita o gr�fico � parte que interessa
title('ESD sinal de m�sica amostrado f_s=8192')


f_s4 = 4096;
x4k = sample(original,f_s4);
EnergySpectralDensity(x4k, f_s4);
xlim([-1500,1500]) % Limita o gr�fico � parte que interessa
title('ESD sinal de m�sica amostrado f_s=4096')

f_s2 = 2048;
x2k = sample(original,f_s2);
EnergySpectralDensity(x2k, f_s2);
xlim([-1500,1500]) % Limita o gr�fico � parte que interessa
title('ESD sinal de m�sica amostrado f_s=2048')


%% Analise da largura de banda dos sinais reamostrados

larguraBanda16 = Bandwidth(x16k, f_s16, 0.999)

largurabanda8 = Bandwidth(x8k, f_s8, 0.999)

larguraBanda4 = Bandwidth(x4k, f_s4, 0.999)

largurabanda2 = Bandwidth(x2k, f_s2, 0.999)

%% analise da SNR - rela��o sinal ruido - dos sinais reamostrados
% Precisamos calcular o eixo do tempo das amostras de cada sinal.
% Precisaoms disso para usar a fun��o interp1 pra interpolar cada sinal 
% no mesmo n�mero de amostras do sinal 'original'.
% Tudo isso pra poder comparar cada sinal com o original usando SNR.

time16k = 0:1/f_s16:(length(x16k)-1)/f_s16;
snr16khz = snr(original,original - interp1(time16k, x16k, timeoriginal)')

time8k = 0:1/f_s8:(length(x8k)-1)/f_s8;
snr8khz = snr(original,original - interp1(time8k, x8k, timeoriginal)')

time4k = 0:1/f_s4:(length(x4k)-1)/f_s4;
snr4khz = snr(original,original - interp1(time4k, x4k, timeoriginal)')

time2k = 0:1/f_s2:(length(x2k)-1)/f_s2;
snr2khz = snr(original,original - interp1(time2k, x2k, timeoriginal)')

