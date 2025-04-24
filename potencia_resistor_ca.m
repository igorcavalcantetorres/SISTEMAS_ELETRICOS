% Parâmetros
Vm = 100;             % Tensão máxima (V)
R = 10;               % Resistência (Ohms)
f = 60;               % Frequência (Hz)
w = 2*pi*f;           % Frequência angular
t = linspace(0, 3/f, 1000);  % Tempo: 3 ciclos


v = Vm * sin(w*t);       
i = v / R;               
p = v .* i;               

figure(1);

subplot(3,1,1);
plot(t, v, 'b', 'LineWidth', 1.5);
ylabel('Tensão (V)');
title('Forma de onda da Tensão');
grid on;

subplot(3,1,2);
plot(t, i, 'r', 'LineWidth', 1.5);
ylabel('Corrente (A)');
title('Forma de onda da Corrente');
grid on;

subplot(3,1,3);
plot(t, p, 'm', 'LineWidth', 1.5);
ylabel('Potência (W)');
xlabel('Tempo (s)');
title('Potência Instantânea no Resistor');
grid on;
i_norm = i * Vm;         % Fator de escala para amplificar a forma de onda da corrente.
p_norm = p; 


figure(2);
plot(t, v, 'b', 'LineWidth', 1.5); hold on;
plot(t, i_norm, 'r--', 'LineWidth', 1.5);
plot(t, p_norm, 'm-.', 'LineWidth', 1.5);

xlabel('Tempo (s)');
ylabel('Amplitude');
title('Tensão, Corrente (escalada) e Potência em um Resistor');
legend('Tensão (V)', 'Corrente (escalada)', 'Potência (W)');
grid on;