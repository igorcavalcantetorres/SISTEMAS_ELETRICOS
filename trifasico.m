%Simulador de Circuito El�trico Trif�sico Sim�trico e Equilibrado
%Professor: Igor Cavalcante Torres
clear all;
V_f_mod = input('Informe o m�dulo da tens�o de fase da fonte: ');
V_f_ang = input('Informe o �ngulo de refer�ncia da tens�o: ');

V_f = V_f_mod+V_f_ang*i;


C = input('Informe a sequ�ncia de fase: 1(positiva) 2(negativa)');

switch C

    case 1
alpha_exp = [1 -0.5+sqrt(3)/2i -0.5-sqrt(3)/2i]; %Matriz de sequ�ncia positiva
V_f_seq = V_f*alpha_exp; %Composi��o da matriz de tens�es de fase sequencial
cte = 1.5+0.866025404i; %rela��o para a tens�o de linha
%C�lculo dos m�dulos e �ngulos das tens�es
Van_mod = abs(V_f_seq(1));
Vbn_mod = abs(V_f_seq(2));
Vcn_mod = abs(V_f_seq(3));
Van_ang = angle(V_f_seq(1))*180/pi;
Vbn_ang = angle(V_f_seq(2))*180/pi;
Vcn_ang = angle(V_f_seq(3))*180/pi;
[Vab_seq] = (Van_mod+Van_ang*i)*cte*[1 -0.5+sqrt(3)/2i -0.5-sqrt(3)/2i];
Vab_mod = abs(Vab_seq(1));
Vbc_mod = abs(Vab_seq(2));
Vca_mod = abs(Vab_seq(3));
Vab_ang = angle(Vab_seq(1))*180/pi;
Vbc_ang = angle(Vab_seq(2))*180/pi;
Vca_ang = angle(Vab_seq(3))*180/pi;

%Par�metros de linha e da carga
Z_carga_seq = [3+4i 3+4i 3+4i];
Z_linha_seq = [0.2+0.5i 0.2+0.5i 0.2+0.5i];

%C�lculo das correntes de linha
Ia = Van_mod/(Z_linha_seq(1)+Z_carga_seq(1));
Ib = Ia*alpha_exp(2);
Ic = Ia*alpha_exp(3);

%Composi��o da matriz de correntes sequenciais
I_seq = Ia*alpha_exp;

%C�lculo dos m�dulos e �ngulos das correntes
Ia_mod = abs(I_seq(1));
Ib_mod = abs(I_seq(2));
Ic_mod = abs(I_seq(3));
Ia_ang = angle(I_seq(1))*180/pi;
Ib_ang = angle(I_seq(2))*180/pi;
Ic_ang = angle(I_seq(3))*180/pi;

mensagem = sprintf('M�dulo Van: %.2f -  �ngulo Van: %.2f�\nM�dulo Vbn: %.2f -  �ngulo Vbn: %.2f�\nM�dulo Vcn: %.2f -  �ngulo Vcn: %.2f� - \nM�dulo Ia: %.2f -  �ngulo Ia: %.2f�',Van_mod,Van_ang,Vbn_mod,Vbn_ang,Vcn_mod,Vcn_ang,Ia_mod,Ia_ang);

msgbox(mensagem, 'Tens�es de fase');

%Exibi��o do diagrama fasorial das tens�es e corrente de fase
figure
compass(Van_mod,Van_ang,'r');
hold on;
compass(Van_mod*cosd(angle(V_f_seq(2))*180/pi),Van_mod*sind(angle(V_f_seq(2))*180/pi),'g');
compass(Van_mod*cosd(angle(V_f_seq(3))*180/pi),Van_mod*sind(angle(V_f_seq(3))*180/pi),'y');
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

end