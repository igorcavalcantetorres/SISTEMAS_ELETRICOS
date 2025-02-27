%Simulador de Circuito Elétrico Trifásico Simétrico e Equilibrado
%Professor: Igor Cavalcante Torres
clear all;

C = input('Informe a sequência de fase: 1(positiva) 2(negativa)');

switch C
    
    case 1

 V_modulo = 220;
 S_positivo_rec = [1+0i,-0.5-0.866i,-0.5+0.866i];
 [V_sequencia_pos] = V_modulo*[S_positivo_rec];
 V_sequencia_pos_primeiro = [V_sequencia_pos(1,1)];
 V_sequencia_pos_segundo = [V_sequencia_pos(1,2)];
 V_sequencia_pos_terceiro = [V_sequencia_pos(1,3)];
 V_a_mod_pos = abs(V_sequencia_pos_primeiro);
 V_b_mod_pos = abs(V_sequencia_pos_segundo);
 V_c_mod_pos = abs(V_sequencia_pos_terceiro);
 V_a_pha_pos = phase(V_sequencia_pos_primeiro)*(180/pi);
 V_b_pha_pos = phase(V_sequencia_pos_segundo)*(180/pi);
 V_c_pha_pos = phase(V_sequencia_pos_terceiro)*(180/pi);
 
 A = [' Tensão na fase A (Va) =  ', num2str(V_a_mod_pos), ' V ', ' Ângulo na fase A (Phi) = ',num2str(V_a_pha_pos), ' graus ']; 
 B = [' Tensão na fase B (Vb) =  ', num2str(V_b_mod_pos), ' V ', ' Ângulo na fase B (Phi) = ',num2str(V_b_pha_pos), ' graus ']; 
 C = [' Tensão na fase C (Vc) =  ', num2str(V_c_mod_pos), ' V ', ' Ângulo na fase C (Phi) = ',num2str(V_c_pha_pos), ' graus ']; 
 
 disp(A)
 disp(B)
 disp(C)
    case 2
 
 V_modulo = 220;
 S_negativa_rec = [1+0i,-0.5+0.866i,-0.5-0.866i];
[V_sequencia_neg] = V_modulo*[S_negativa_rec];
 V_sequencia_neg_primeiro = [V_sequencia_neg(1,1)];
 V_sequencia_neg_segundo = [V_sequencia_neg(1,2)];
 V_sequencia_neg_terceiro = [V_sequencia_neg(1,3)];
 V_a_mod_neg = abs(V_sequencia_neg_primeiro);
 V_b_mod_neg = abs(V_sequencia_neg_segundo);
 V_c_mod_neg = abs(V_sequencia_neg_terceiro);
 V_a_pha_neg = phase(V_sequencia_neg_primeiro)*(180/pi);
 V_b_pha_neg = phase(V_sequencia_neg_segundo)*(180/pi);
 V_c_pha_neg = phase(V_sequencia_neg_terceiro)*(180/pi);

 A = [' Tensão na fase A (Va) =  ', num2str(V_a_mod_neg), ' V ', ' Ângulo na fase A (Phi) = ',num2str(V_a_pha_neg), ' graus ']; 
 B = [' Tensão na fase B (Vb) =  ', num2str(V_b_mod_neg), ' V ', ' Ângulo na fase B (Phi) = ',num2str(V_b_pha_neg), ' graus ']; 
 C = [' Tensão na fase C (Vb) =  ', num2str(V_c_mod_neg), ' V ', ' Ângulo na fase C (Phi) = ',num2str(V_c_pha_neg), ' graus ']; 
 
 disp(A)
 disp(B)
 disp(C)
 
end













% Va_M = input('Informe o módulo da tensão na fase A:');
% Va_A = input('Informe o ângulo da tensão na fase A:');
% 
% Vb_M = input('Informe o módulo da tensão na fase B:');
% Vb_A = input('Informe o ângulo da tensão na fase B:');
% 
% Vc_M = input('Informe o módulo da tensão na fase C:');
% Vc_A = input('Informe o ângulo da tensão na fase C:');
% 
% Zl_R = input('Informe a resistência da linha:');
% Zl_X = input('Informe a reatância da linha:');
% Zl_M = (sqrt((Zl_R^2)+(Zl_X^2)));
% Zl_A = (atan(Zl_X/Zl_R)*(180/pi));
% 
% Zc_R = input('Informe a resistência da carga:');
% Zc_X = input('Informe a reatância da carga:');
% Zc_M = (sqrt((Zc_R^2)+(Zc_X^2)));
% 
% Ia_M = (Va_M/(Zl_M+Zc_M))
% Ia_A = (Va_A-Zl_A)
% Ib_M = (Vb_M/(Zl_M+Zc_M))
% Ib_A = (Vb_A-Zl_A)
% Ic_M = (Vc_M/(Zl_M+Zc_M))
% Ic_A = (Vc_A-Zl_A)
% 
% Ia_R = Ia_M*cosd(Ia_A);
% Ia_I = Ia_M*sind(Ia_A);
% Ib_R = Ib_M*cosd(Ib_A);
% Ib_I = Ib_M*sind(Ib_A);
% Ic_R = Ic_M*cosd(Ic_A);
% Ic_I = Ic_M*sind(Ic_A);
% 
% Ia = Ia_M*cosd(Ia_A) + i*(Ia_M*sind(Ia_A))

