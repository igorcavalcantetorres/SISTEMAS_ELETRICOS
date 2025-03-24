%Simulador de Circuito Elétrico Trifásico Simétrico e Equilibrado
%Professor: Igor Cavalcante Torres
clear all;
V_f_mod = input('Informe o módulo da tensão de fase da fonte: ');
V_f_ang = input('Informe o ângulo de referência da tensão: ');

V_f = V_f_mod+V_f_ang*i;


C = input('Informe a sequência de fase: 1(positiva) 2(negativa)');

switch C

    case 1
linha_a = input('Informe a impedância de cada linha A: ');
carga_a = input('Informe a impedância da carga na fase A: ');

alpha_exp = [1 -0.5+sqrt(3)/2i -0.5-sqrt(3)/2i]; %Matriz de sequência positiva
V_f_seq = V_f*alpha_exp; %Composição da matriz de tensões de fase sequencial
cte = 1.5+0.866025404i; %relação para a tensão de linha
%Cálculo dos módulos e ângulos das tensões
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
[V_fase_seq] = Van_mod*[alpha_exp];


%Parâmetros de linha e da carga
Z_carga_seq = [carga_a carga_a carga_a];
Z_linha_seq = [linha_a linha_a linha_a];

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

%Cálculo das potências
pot_complexa = ([V_fase_seq].*(conj([I_seq])));
Pa = real(pot_complexa(1))/1000;
Qa = imag(pot_complexa(1))/1000;
Pb = real(pot_complexa(2))/1000;
Qb = imag(pot_complexa(2))/1000;
Pc = real(pot_complexa(3))/1000;
Qc = imag(pot_complexa(3))/1000;
Sa = abs(pot_complexa(1))/1000;
Sb = abs(pot_complexa(2))/1000;
Sc = abs(pot_complexa(3))/1000;
Fp_a = Pa/Sa;
Fp_b = Pb/Sb;
Fp_c = Pc/Sc;
S3f = (sqrt(3)*Vab_mod*Ia_mod)/1000;
theta = Van_ang-Ia_ang;
P3f = (sqrt(3)*Vab_mod*Ia_mod*cos(theta))/1000;
Q3f = (sqrt(3)*Vab_mod*Ia_mod*sin(theta))/1000;
FP_t = abs(P3f/S3f);

if Ia_ang < Van_ang 
    FP = 'Atrasado'; 
else if Ia_ang > Van_ang
    FP = 'Adiantado';
    else
        FP = 'Unitário';
    end
end


mensagem = sprintf(['Módulo Van: %.2f V   Ângulo Van: %.2f° \n'...
                    'Módulo Vbn: %.2f V   Ângulo Vbn: %.2f° \n'...
                    'Módulo Vcn: %.2f V   Ângulo Vcn: %.2f° \n'...
                    'Módulo Vab: %.2f V   Ângulo Vab: %.2f° \n'...
                    'Módulo Vbc: %.2f V   Ângulo Vbc: %.2f° \n'...
                    'Módulo Vca: %.2f V   Ângulo Vca: %.2f° \n'...
                    'Módulo Ia: %.2f A      Ângulo Ia: %.2f° \n'...
                    'Módulo Ib: %.2f A      Ângulo Ib: %.2f° \n'...
                    'Módulo Ic: %.2f A      Ângulo Ic: %.2f° \n'...
                    'Ativa Pa: %.2f kW         Reativa Qa: %.2f kVAr \n'...
                    'Ativa Pb: %.2f kW         Reativa Qb: %.2f kVAr \n'...
                    'Ativa Pc: %.2f kW         Reativa Qc: %.2f kVAr \n'...
                    'Aparente Sa: %.2f kVA     FP fase A: %.2f \n'...
                    'Aparente Sb: %.2f kVA     FP fase B: %.2f \n'...
                    'Aparente Sc: %.2f kVA     FP fase C: %.2f \n'...
                    'Aparente 3', char(966) ': %.2f kVA  \n'...     
                    'Ativa 3', char(966) ': %.2f kW \n'...
                    'Reativa 3', char(966) ': %.2f kVAr \n'...
                    'Fator de potência 3: %.2f  Natureza: %s'],...
                    Van_mod, Van_ang,...
                    Vbn_mod, Vbn_ang,...
                    Vcn_mod, Vcn_ang,...
                    Vab_mod, Vab_ang, Vbc_mod, Vbc_ang, Vca_mod, Vca_ang,...
                    Ia_mod, Ia_ang,...
                    Ib_mod, Ib_ang,...
                    Ic_mod, Ic_ang,...
                    Pa, Qa,...
                    Pb, Qb,...
                    Pc, Qc,...
                    Sa, Fp_a, Sb, Fp_b, Sc, Fp_c,...
                    S3f,...
                    P3f,...
                    Q3f,...
                    FP_t, FP);
                    
                 
f = figure('Position', [500 300 350 600], 'Name', 'Relatório tensões e correntes', 'NumberTitle', 'off', 'MenuBar', 'none');

% Criando o controle de texto
uicontrol('Style', 'text', 'String', mensagem, ...
          'Position', [10 50 480 540], ... % Ajuste maior para dar espaço suficiente
          'HorizontalAlignment', 'left', 'Max', 2, 'FontSize', 12);
      
%diagrama fasorial das tensões e corrente de fase
figure
compass(Van_mod,Van_ang,'r');
hold on;
compass(Van_mod*cosd(angle(V_f_seq(2))*180/pi),Van_mod*sind(angle(V_f_seq(2))*180/pi),'g');
compass(Van_mod*cosd(angle(V_f_seq(3))*180/pi),Van_mod*sind(angle(V_f_seq(3))*180/pi),'y');
x=compass(Vab_mod*cosd(angle(Vab_seq(1))*180/pi),Vab_mod*sind(angle(Vab_seq(1))*180/pi),'r');
y=compass(Vbc_mod*cosd(angle(Vab_seq(2))*180/pi),Vbc_mod*sind(angle(Vab_seq(2))*180/pi),'g');
z=compass(Vca_mod*cosd(angle(Vab_seq(3))*180/pi),Vca_mod*sind(angle(Vab_seq(3))*180/pi),'y');
h=compass(Ia_mod*cosd(angle(I_seq(1))*180/pi),Ia_mod*sind(angle(I_seq(1))*180/pi));
j=compass(Ia_mod*cosd(angle(I_seq(2))*180/pi),Ia_mod*sind(angle(I_seq(2))*180/pi),'g');
k=compass(Ia_mod*cosd(angle(I_seq(3))*180/pi),Ia_mod*sind(angle(I_seq(3))*180/pi),'y');
legend('V_{a}','V_{b}','V_{c}','V_{ab}','V_{bc}','V_{ca}','I_{a}','I_{b}','I_{c}','Location','west','Orientation','vertically');
lineHandles = h(1);
lineHandless = j(1);
lineHandlesss = k(1);
set(lineHandles, 'LineStyle', '--', 'LineWidth',1, 'Color', 'r');
set(lineHandless, 'LineStyle', '--', 'LineWidth',1, 'Color', 'g');
set(lineHandlesss, 'LineStyle', '--', 'LineWidth',1, 'Color', 'y');

end