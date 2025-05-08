% --- Entradas ---
Va = 210*exp(1j*deg2rad(0));      % Fase A
Vb = 210*exp(1j*deg2rad(-90)); % Fase B
Vc = 210*exp(1j*deg2rad(90));  % Fase C


a = exp(1j*2*pi/3);


T = (1/3) * [1 1 1;
             1 a a^2;
             1 a^2 a];


V012 = T * [Va; Vb; Vc];
V0 = V012(1); V1 = V012(2); V2 = V012(3);


Va_0 = V0;         Va_1 = V1;         Va_2 = V2;
Vb_0 = V0;         Vb_1 = V1*a^2;     Vb_2 = V2*a;
Vc_0 = V0;         Vc_1 = V1*a;       Vc_2 = V2*a^2;

% --- Plotagem ---
figure;
hold on; grid on; axis equal;
title('Componentes de Fase e Componentes Simétricas por Fase');
xlabel('Re'); ylabel('Im');

% Plot fase completa
h_Va = quiver(0, 0, real(Va), imag(Va), 0, 'r', 'LineWidth', 2);
h_Vb = quiver(0, 0, real(Vb), imag(Vb), 0, 'g', 'LineWidth', 2);
h_Vc = quiver(0, 0, real(Vc), imag(Vc), 0, 'b', 'LineWidth', 2);

% Plot componentes simétricas globais
h_V0 = quiver(0, 0, real(V0), imag(V0), 0, 'k--', 'LineWidth', 2);
h_V1 = quiver(0, 0, real(V1), imag(V1), 0, 'm--', 'LineWidth', 2);
h_V2 = quiver(0, 0, real(V2), imag(V2), 0, 'c--', 'LineWidth', 2);

% Componentes simétricas por fase — empilhadas

% Fase A
origin = [0 0];
h_Va0 = plot_vector(Va_0, origin, 'r', ':');
origin = origin + [real(Va_0), imag(Va_0)];
h_Va1 = plot_vector(Va_1, origin, 'r', ':');
origin = origin + [real(Va_1), imag(Va_1)];
h_Va2 = plot_vector(Va_2, origin, 'r', '-.');

% Fase B
origin = [0 0];
h_Vb0 = plot_vector(Vb_0, origin, 'g', ':');
origin = origin + [real(Vb_0), imag(Vb_0)];
h_Vb1 = plot_vector(Vb_1, origin, 'g', ':');
origin = origin + [real(Vb_1), imag(Vb_1)];
h_Vb2 = plot_vector(Vb_2, origin, 'g', '-.');

% Fase C
origin = [0 0];
h_Vc0 = plot_vector(Vc_0, origin, 'b', ':');
origin = origin + [real(Vc_0), imag(Vc_0)];
h_Vc1 = plot_vector(Vc_1, origin, 'b', ':');
origin = origin + [real(Vc_1), imag(Vc_1)];
h_Vc2 = plot_vector(Vc_2, origin, 'b', '-.');

% Legenda completa
legend([h_Va, h_Vb, h_Vc, h_V0, h_V1, h_V2, ...
        h_Va0, h_Va1, h_Va2, ...
        h_Vb0, h_Vb1, h_Vb2, ...
        h_Vc0, h_Vc1, h_Vc2], ...
       {'Va','Vb','Vc','V0','V1','V2', ...
        'Va_0','Va_1','Va_2', ...
        'Vb_0','Vb_1','Vb_2', ...
        'Vc_0','Vc_1','Vc_2'}, ...
        'Location','bestoutside');

% --- Função auxiliar para plotar vetores empilhados ---
function h = plot_vector(v, origin, color, style)
    h = quiver(origin(1), origin(2), real(v), imag(v), 0, ...
        'Color', color, 'LineStyle', style, 'LineWidth', 1.5, 'MaxHeadSize', 0.5);
end