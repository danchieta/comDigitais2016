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
% Numero de niveis: 16


y = compress(x8k, 255);

x_q = uniformquantize(x8k, 16);
y_q = uniformquantize(y, 16);

z = expand(y_q, 255);

% sound(z, f_s8);

%% Plotando o sinal de erro

figure(1)
plot(x8k - z);
title('Gráfico erro de z (x8k-z)')
ylabel('erro')

figure(2)
plot(x8k - x_q);
title('Gráfico erro de x_q (x8k-x_q)')
ylabel('erro')

%% SNR dos sinais quantizados.

SNRz = snr(x8k, x8k - z)
SNRx_q = snr(x8k, x8k - x_q)

%% 

for k=1:2
    saveas(figure(k), ['../PlotsTrab1/' num2str(k+10) 'erroQuantCompressVoz.png']);
end