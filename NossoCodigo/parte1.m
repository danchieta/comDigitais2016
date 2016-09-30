% Arthur Ramos
% David Anchieta
% Hanna Carvalho
% Itamar de aguiar

%% Configuracao inicial
addpath('../Primeiro_trabalho_funcoes')
load('original66khz') % carrega o audio com taxa de amostragem

%%
EnergySpectralDensity(original, fs);
axis([-1500,1500]) % Limita o gráfico à parte que interessa
