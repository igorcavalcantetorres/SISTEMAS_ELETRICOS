% Parâmetros do sistema
Vm = 220;  % Amplitude da tensão (V)
f = 60;    % Frequência da rede (Hz)
w = 2 * pi * f; % Frequência angular (rad/s)
T = 1 / f; % Período da onda (s)
t = linspace(0, 2*T, 1000); % Tempo para duas ondas

% Defasagens das seis fases (múltiplos de 60° = ?/3 radianos)
phases = [0, pi/3, 2*pi/3, pi, 4*pi/3, 5*pi/3];

% Geração das seis tensões cossenoidais
voltages = zeros(6, length(t));
for i = 1:6
    voltages(i, :) = Vm * cos(w * t + phases(i));
end

% Plotando as seis ondas
figure;
hold on;
colors = ['r', 'g', 'b', 'c', 'm', 'k']; % Cores para as fases
legends = cell(1,6);

for i = 1:6
    plot(t, voltages(i, :), 'Color', colors(i), 'LineWidth', 1.5);
    legends{i} = sprintf('Fase %d', i);
end

% Configuração do gráfico
grid on;
xlabel('Tempo (s)');
ylabel('Tensão (V)');
title('Sistema Elétrico Hexafásico Cossenoidal');
legend(legends);
hold off;