Vm = 100;               % Tensão máxima (V)
f = 60;                 % Frequência (Hz)
w = 2*pi*f;             % Frequência angular
t = linspace(0, 3/f, 1000);  % Tempo: 3 ciclos

%% === INDUTOR ===
L = 0.1;                % Indutância (H)
vL = Vm * sin(w*t);     % Tensão no indutor
ImL = Vm / (w*L);       % Corrente máxima no indutor
iL = ImL * -cos(w*t);   % Corrente (atrasada 90°)
pL = vL .* iL;          % Potência instantânea

%% === CAPACITOR ===
C = 100e-6;             % Capacitância (F)
vC = Vm * sin(w*t);     % Tensão no capacitor
ImC = Vm * w * C;       % Corrente máxima no capacitor
iC = ImC * cos(w*t);    % Corrente (adiantada 90°)
pC = vC .* iC;          % Potência instantânea



% Curvas de tensão, corrente e potência par o indutor
iL_norm = iL * (Vm / ImL); % Fator de escala para visualização

figure;
plot(t, vL, 'b', 'LineWidth', 1.5); hold on;
plot(t, iL_norm, 'r--', 'LineWidth', 1.5);
plot(t, pL, 'm-.', 'LineWidth', 1.5);
xlabel('Tempo (s)');
ylabel('Amplitude');
title('Indutor: Tensão, Corrente (escalada) e Potência');
legend('Tensão (V)', 'Corrente (escalada)', 'Potência (W)');
grid on;

% Curvas de tensão, corrente e potência para o capacitor

C = 100e-6;             % Capacitância (F)
vC = Vm * sin(w*t);     % Tensão no capacitor
ImC = Vm * w * C;       % Corrente máxima no capacitor
iC = ImC * cos(w*t);    % Corrente (adiantada 90°)
pC = vC .* iC;          % Potência instantânea

% Curvas de tensão, corrente e potência par o capacitor
iC_norm = iC * (Vm / ImC); % Fator de escala para visualização

figure;
plot(t, vC, 'b', 'LineWidth', 1.5); hold on;
plot(t, iC_norm, 'r--', 'LineWidth', 1.5);
plot(t, pC, 'm-.', 'LineWidth', 1.5);
xlabel('Tempo (s)');
ylabel('Amplitude');
title('Capacitor: Tensão, Corrente (escalada) e Potência');
legend('Tensão (V)', 'Corrente (escalada)', 'Potência (W)');
grid on;