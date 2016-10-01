% Arthur Ramos
% David Anchieta
% Hanna Carvalho
% Itamar de aguiar

% Não precisa executar o script todo sempre.
% Basta selecionar as linhas que quer executar e apertar F9.

%% Configuracao inicial
addpath('../Primeiro_trabalho_funcoes')
load('audio8khz.mat') % carrega o audio com taxa de amostragem
time8khz = 0:1/f_s8:(length(x8k)-1)/f_s8;

%% Quantizando o sinal
% Numero de niveis: 4 16 64 256 1024


xq1k = uniformquantize(x8k,1024);

xq256 = uniformquantize(x8k,256);

xq64 = uniformquantize(x8k,64);

xq16 = uniformquantize(x8k,16);

xq2 = uniformquantize(x8k,2);

% sound(xq256, f_s8);

%% Plotando o sinal de erro

figure(1)
plot(x8k - xq1k);
title('Gráfico erro de sinal quantizado e 1024 níveis')
ylabel('erro')

figure(2)
plot(x8k - xq256);
title('Gráfico erro de sinal quantizado e 256 níveis')
ylabel('erro')

figure(3)
plot(x8k - xq64);
title('Gráfico erro de sinal quantizado e 64 níveis')
ylabel('erro')

figure(4)
plot(x8k - xq16);
title('Gráfico erro de sinal quantizado e 16 níveis')
ylabel('erro')

figure(5)
plot(x8k - xq2);
title('Gráfico erro de sinal quantizado e 2 níveis')
ylabel('erro')

%% SNR dos sinais quantizados.


SNRq1k = snr(x8k, x8k - xq1k)


SNRq256 = snr(x8k, x8k - xq256)


SNRq64 = snr(x8k, x8k - xq64)


SNRq16 = snr(x8k, x8k - xq16)


SNRq2 = snr(x8k, x8k - xq2)

%% 