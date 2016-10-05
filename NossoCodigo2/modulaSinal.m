% David Anchieta
% Arthur Ramos
% Itamar de Aguiar
% Hanna Carvalho

%% Configuração inicial
load('audioDigital8khz6bit.mat')
addpath('../SegundoTrabalhoArquivos')

%% Modulação PSK

xBPSK = PhaseMod(x8khz6b, 2, 0);
xQPSK = PhaseMod(x8khz6b, 4, 0);
x8PSK = PhaseMod(x8khz6b, 8, 0);
x16PSK = PhaseMod(x8khz6b, 16, 0);
x32PSK = PhaseMod(x8khz6b, 32, 0);

%% Modulação QAM

xQAM = QAM16_mod(x8khz6b);

%% Plot de constelação dos sinais sem ruído

figure(1)
scatter(real(xBPSK), imag(xBPSK))
title('constelação xBPSK sem ruído')
xlabel('real')
ylabel('imag')
axis square

figure(2)
scatter(real(xQPSK), imag(xQPSK))
title('constelação xQPSK sem ruído')
xlabel('real')
ylabel('imag')
axis square

figure(3)
scatter(real(x8PSK), imag(x8PSK))
title('constelação x8PSK sem ruído')
xlabel('real')
ylabel('imag')
axis square

figure(4)
scatter(real(x16PSK), imag(x16PSK))
title('constelação x16PSK sem ruído')
xlabel('real')
ylabel('imag')
axis square

figure(5)
scatter(real(x32PSK), imag(x32PSK))
title('constelação x32PSK sem ruído')
xlabel('real')
ylabel('imag')
axis square

figure(6)
scatter(real(xQAM), imag(xQAM))
title('constelação xQAM sem ruído')
xlabel('real')
ylabel('imag')
axis square

%% Adicionando ruído aos sinais
SNRbit = 10^0.8;
xBPSKn = AddNoise(xBPSK, SNRbit, 2);
xQPSKn = AddNoise(xQPSK, SNRbit, 4);
x8PSKn = AddNoise(x8PSK, SNRbit, 8);
x16PSKn = AddNoise(x16PSK, SNRbit, 16);
x32PSKn = AddNoise(x32PSK, SNRbit, 32);

xQAMn = AddNoise(xQAM, SNRbit, 16);

%% Constelações dos sinais com ruído

figure(7)
scatter(real(xBPSKn), imag(xBPSKn))
title('constelação xBPSK com ruído')
xlabel('real')
ylabel('imag')
axis square

figure(8)
scatter(real(xQPSKn), imag(xQPSKn))
title('constelação xQPSK com ruído')
xlabel('real')
ylabel('imag')
axis square

figure(9)
scatter(real(x8PSKn), imag(x8PSKn))
title('constelação x8PSK com ruído')
xlabel('real')
ylabel('imag')
axis square

figure(10)
scatter(real(x16PSKn), imag(x16PSKn))
title('constelação x16PSK com ruído')
xlabel('real')
ylabel('imag')
axis square

figure(11)
scatter(real(x32PSKn), imag(x32PSKn))
title('constelação x32PSK com ruído')
xlabel('real')
ylabel('imag')
axis square

figure(12)
scatter(real(xQAMn), imag(xQAMn))
title('constelação xQAM com ruído')
xlabel('real')
ylabel('imag')
axis square

%% Demodulação (e 'conversão' DA) dos sinais com ruído

demodBPSK = PhaseDemod(xBPSKn,2,0);
analogBPSK = Digital2Analog(demodBPSK,k,0,0);

demodQPSK = PhaseDemod(xQPSKn,4,0);
analogQPSK = Digital2Analog(demodQPSK,k,0,0);

demod8PSK = PhaseDemod(x8PSKn,8,0);
analog8PSK = Digital2Analog(demod8PSK,k,0,0);

demodQAM = QAM16_demod(xQAMn);
analogQAM16 = Digital2Analog(demodQAM,k,0,0);

% O script demora tempo demais para demodular os seguintes sinais
% demod16psk = PhaseDemod(x16PSKn,16,0);
% demx16PSK = Digital2Analog(demod16psk,k,0,0);
% demx32PSK = Digital2Analog(PhaseDemod(x32PSKn,32,0),k,0,0);

% sound(analogQAM16, fs8k)

%% Taxa de erro por bit
BER_BPSK = sum(x8khz6b ~= demodBPSK')/length(x8khz6b)
BER_QPSK = sum(x8khz6b ~= demodQPSK')/length(x8khz6b)
BER_16PSK = sum(x8khz6b ~= demod8PSK')/length(x8khz6b)
BER_QUAM = sum(x8khz6b ~= demodQAM')/length(x8khz6b)


%% Plot dos sinais demodulados

figure(13)
plot([0:1/fs8k:(length(analogBPSK)-1)/fs8k], analogBPSK);
title('Sinal demodulado e convertido DA. BPSK')
xlabel('tempo (s)')


figure(14)
plot([0:1/fs8k:(length(analogBPSK)-1)/fs8k], analogQPSK);
title('Sinal demodulado e convertido DA. QPSK')
xlabel('tempo (s)')

figure(15)
plot([0:1/fs8k:(length(analogBPSK)-1)/fs8k], analog8PSK);
title('Sinal demodulado e convertido DA. PSK 8 bits')
xlabel('tempo (s)')

figure(16)
plot([0:1/fs8k:(length(analogBPSK)-1)/fs8k], analogQAM16);
title('Sinal demodulado e convertido DA. QAM 16 bits')
xlabel('tempo (s)')


for k=13:16
    saveas(figure(k), ['./figuras/modula' num2str(k) '.png']);    
end
