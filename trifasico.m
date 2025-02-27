%Simulador de Circuito Elétrico Trifásico Simétrico e Equilibrado
%Professor: Igor Cavalcante Torres
clear all;

V_f = 220+0i; %tensão de fase definida
alpha_exp = [1 -0.5+sqrt(3)/2i -0.5-sqrt(3)/2i]; %Matriz de sequência positiva

V_seq = V_f*alpha_exp; %Composição da matriz de tensões de fase sequencial

%Cálculo dos módulos e ângulos das tensões
Van_mod = abs(V_seq(1))
Vbn_mod = abs(V_seq(2))
Vcn_mod = abs(V_seq(3))
Van_ang = angle(V_seq(1))*180/pi
Vbn_ang = angle(V_seq(2))*180/pi
Vcn_ang = angle(V_seq(3))*180/pi

%Parâmetros de linha e da carga
Z_carga_seq = [4+3i 4+3i 4+3i];
Z_linha_seq = [0.2+0.5i 0.2+0.5i 0.2+0.5i];

%Cálculo das correntes de linha
Ia = Van_mod/(Z_linha_seq(1)+Z_carga_seq(1));
Ib = Ia*alpha_exp(2);
Ic = Ia*alpha_exp(3);

%Composição da matriz de correntes sequenciais
I_seq = Ia*alpha_exp;

%Cálculo dos módulos e ângulos das correntes
Ia_mod = abs(I_seq(1));
Ib_mod = abs(I_seq(2));
Ic_mod = abs(I_seq(3));
Ia_ang = angle(I_seq(1))*180/pi;
Ib_ang = angle(I_seq(2))*180/pi;
Ic_ang = angle(I_seq(3))*180/pi;

mensagem = sprintf('Módulo Van: %.2f -  Ângulo Van: %.2f°\nMódulo Vbn: %.2f -  Ângulo Vbn: %.2f°\nMódulo Vcn: %.2f -  Ângulo Vcn: %.2f°',Van_mod,Van_ang,Vbn_mod,Vbn_ang,Vcn_mod,Vcn_ang);

msgbox(mensagem, 'Tensões de fase');

%Exibição do diagrama fasorial das tensões e corrente de fase
figure
compass(Van_mod,Van_ang,'r');
hold on;
compass(Van_mod*cosd(angle(V_seq(2))*180/pi),Van_mod*sind(angle(V_seq(2))*180/pi),'g');
compass(Van_mod*cosd(angle(V_seq(3))*180/pi),Van_mod*sind(angle(V_seq(3))*180/pi),'y');
h=compass(Ia_mod*cosd(angle(I_seq(1))*180/pi),Ia_mod*sind(angle(I_seq(1))*180/pi),'r');
j=compass(Ia_mod*cosd(angle(I_seq(2))*180/pi),Ia_mod*sind(angle(I_seq(2))*180/pi),'g');
k=compass(Ia_mod*cosd(angle(I_seq(3))*180/pi),Ia_mod*sind(angle(I_seq(3))*180/pi),'y');
legend('V_{a}','V_{b}','V_{c}','I_{a}','I_{b}','I_{c}','Location','west','Orientation','vertically');
lineHandles = h(1);
lineHandless = j(1);
lineHandlesss = k(1);
set(lineHandles, 'LineStyle', '--', 'LineWidth',1, 'Color', 'r');
set(lineHandless, 'LineStyle', '--', 'LineWidth',1, 'Color', 'g');
set(lineHandlesss, 'LineStyle', '--', 'LineWidth',1, 'Color', 'y');