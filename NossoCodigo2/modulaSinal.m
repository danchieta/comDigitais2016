% David Anchieta
% Arthur Ramos
% Itamar de Aguiar
% Hanna Carvalho

%% Configuração inicial
load('audioDigital8khz6bit.mat')

%% Modulação PSK

xBPSK = PhaseMod(x8khz6b, 2, 0);
xQPSK = PhaseMod(x8khz6b, 4, 0);
x8PSK = PhaseMod(x8khz6b, 8, 0);
x16PSK = PhaseMod(x8khz6b, 16, 0);
x32PSK = PhaseMod(x8khz6b, 32, 0);

%% Modulação QAM

xQAM = QAM16_Mod(x8khz6b);


