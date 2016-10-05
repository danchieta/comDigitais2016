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

demxBPSK = Digital2Analog(PhaseDemod(xBPSKn,2,0),k,0,0);
demxQPSK = Digital2Analog(PhaseDemod(xQPSKn,4,0),k,0,0);
demx8PSK = Digital2Analog(PhaseDemod(x8PSKn,8,0),k,0,0);
demx16PSK = Digital2Analog(PhaseDemod(x16PSKn,16,0),k,0,0);
demx32PSK = Digital2Analog(PhaseDemod(x32PSKn,32,0),k,0,0);
demxBPSK = QAM16_Demod(PhaseDemod(xQAMn),k,0,0);

% sound(demxBPSK, fs8k)

for k=1:12
    saveas(figure(k), ['./figuras/modula' num2str(k) '.png']);    
end
