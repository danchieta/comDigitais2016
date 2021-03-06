% Arthur Ramos
% David Anchieta
% Hanna Carvalho
% Itamar de aguiar

% N�o precisa executar o script todo sempre.
% Basta selecionar as linhas que quer executar e apertar F9.

%% Configuracao inicial
addpath('../Primeiro_trabalho_funcoes')
load('audio8khz.mat') % carrega o audio com taxa de amostragem
time8khz = 0:1/f_s8:(length(x8k)-1)/f_s8;
% sound(x8k,f_s8)


%% Quantizando o sinal
% Numero de niveis: 16 

y = uniformquantize(x8k,16);

%% Amplificando o sinal quantizado

z = 2*uniformquantize(0.5*x8k, 16);
w = 2*uniformquantize(5*x8k, 16);

% sound(w, f_s8);

%% Plotando o sinal de erro

figure(1)
plot(x8k - y);
title('Gr�fico erro de y (x8k-y)')
ylabel('erro')

figure(2)
plot(x8k - z);
title('Gr�fico erro de z (x8k-z)')
ylabel('erro')

figure(3)
plot(x8k - w);
title('Gr�fico erro de w (x8k-z)')
ylabel('erro')

%% SNR dos sinais quantizados.


SNRy = snr(x8k, x8k - y)
SNRz = snr(x8k, x8k - z)
SNRq = snr(x8k, x8k - w)
%% 

for k=1:5
    saveas(figure(k), ['../PlotsTrab1/' num2str(k+22) 'erroGanho.png']);
end