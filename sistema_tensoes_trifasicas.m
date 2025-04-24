%Autor: Professor Igor Cavalcante Torres
%Readme: Nesse sistema é possível visualizar as tensões no domínio do tempo
%e no domínio do fasor.
%Possíveis alterações: Ao estudr o script, o aluno pode discretizar o sinal
%temporal da tensão ao longo do tempo, podendo visualizar a função das
%tensões trifásicas em qualquer instante de tempo.

clear all;
V_rms = 220;
V_m = V_rms*sqrt(2);
w = (2*180*60);
fi_1 = 0;
fi_2 = 240;
fi_3 = 120;
t = [0:0.0001:0.008];

graus = t*18000;
v1_t = V_m*sind((w*t) + fi_1);
v2_t = V_m*sind((w*t) + fi_2);
v3_t = V_m*sind((w*t) + fi_3);

V_1 = V_m*(cosd(fi_1)+1i*sind(fi_1));
comp_real_1 = real(V_1);
comp_img_1 = imag(V_1);
V_1_ang = atan2d(comp_img_1,comp_real_1);
V_1_amp = abs(V_1);

V_2 = V_m*(cosd(fi_2)+1i*sind(fi_2));
comp_real_2 = real(V_2);
comp_img_2 = imag(V_2);
V_2_ang = atan2d(comp_img_2,comp_real_2);
V_2_amp = abs(V_2);

figure

plot(t,v1_t,'r','LineWidth',2)
hold on;
grid on;
plot(t,v2_t,'g','LineWidth',2)
plot(t,v3_t,'y','LineWidth',2)
xlim([0 0.018])
xticklabels({'t = 0','t = 2','t = 4','t = 6','t = 8','t = 10','t = 12','t = 14','t = 16','t = 18'})
ylabel('Tensão - Volts')
xlabel('Tempo - milissegundos')
%xticks([0,120,180,240])
legend('V_{a}','V_{b}','V_{c}','Location','northwest','Orientation','horizontal');

figure
compass(V_1_amp,V_1_ang,'r');
hold on;
compass(V_m*cosd(fi_2),V_m*sind(fi_2),'g');
compass(V_m*cosd(fi_3),V_m*sind(fi_3),'y');
legend('V_{a}','V_{b}','V_{c}','Location','northwest','Orientation','horizontal');



