Vm = 100;               % Tens�o m�xima (V)
f = 60;                 % Frequ�ncia (Hz)
w = 2*pi*f;             % Frequ�ncia angular
t = linspace(0, 3/f, 1000);  % Tempo: 3 ciclos

%% === INDUTOR ===
L = 0.1;                % Indut�ncia (H)
vL = Vm * sin(w*t);     % Tens�o no indutor
ImL = Vm / (w*L);       % Corrente m�xima no indutor
iL = ImL * -cos(w*t);   % Corrente (atrasada 90�)
pL = vL .* iL;          % Pot�ncia instant�nea

%% === CAPACITOR ===
C = 100e-6;             % Capacit�ncia (F)
vC = Vm * sin(w*t);     % Tens�o no capacitor
ImC = Vm * w * C;       % Corrente m�xima no capacitor
iC = ImC * cos(w*t);    % Corrente (adiantada 90�)
pC = vC .* iC;          % Pot�ncia instant�nea



% Curvas de tens�o, corrente e pot�ncia par o indutor
iL_norm = iL * (Vm / ImL); % Fator de escala para visualiza��o

figure;
plot(t, vL, 'b', 'LineWidth', 1.5); hold on;
plot(t, iL_norm, 'r--', 'LineWidth', 1.5);
plot(t, pL, 'm-.', 'LineWidth', 1.5);
xlabel('Tempo (s)');
ylabel('Amplitude');
title('Indutor: Tens�o, Corrente (escalada) e Pot�ncia');
legend('Tens�o (V)', 'Corrente (escalada)', 'Pot�ncia (W)');
grid on;

% Curvas de tens�o, corrente e pot�ncia para o capacitor

C = 100e-6;             % Capacit�ncia (F)
vC = Vm * sin(w*t);     % Tens�o no capacitor
ImC = Vm * w * C;       % Corrente m�xima no capacitor
iC = ImC * cos(w*t);    % Corrente (adiantada 90�)
pC = vC .* iC;          % Pot�ncia instant�nea

% Curvas de tens�o, corrente e pot�ncia par o capacitor
iC_norm = iC * (Vm / ImC); % Fator de escala para visualiza��o

figure;
plot(t, vC, 'b', 'LineWidth', 1.5); hold on;
plot(t, iC_norm, 'r--', 'LineWidth', 1.5);
plot(t, pC, 'm-.', 'LineWidth', 1.5);
xlabel('Tempo (s)');
ylabel('Amplitude');
title('Capacitor: Tens�o, Corrente (escalada) e Pot�ncia');
legend('Tens�o (V)', 'Corrente (escalada)', 'Pot�ncia (W)');
grid on;