%% Clean up
clc;
close all;

%% Params
N = 4096;
fs = 48E3;
f = 0 : fs/N : (fs-(fs/N))/2;

N_4k = 342;
f_4k = 0 : fs/N : (fs-(fs/N))/12;
%% Alkalmazott átvitelek
figure(801);
A1_display = 20*log10(abs(fft(filter(A1_b, A1_a,Impulse), N)));
plot(f_4k, A1_display(1:N_4k));
xlabel('Frekvencia [Hz]');
ylabel('Amplitódő [dB]');
grid on;
title('A1');

figure(802);
A2_display = 20*log10(abs(fft(filter(A2_b, A2_a,Impulse), N)));
plot(f_4k, A2_display(1:N_4k));
xlabel('Frekvencia [Hz]');
ylabel('Amplitódő [dB]');
grid on;
title('A2');

%% Átvitelek
%%{
figure(2);
hold on;
original = 20*log10(abs(fft(filter(A1_b, A1_a,Impulse), N)));
xlms = 20*log10(abs(fft(w_x, N)));
elms = 20*log10(abs(fft(w_e, N)));
exlms = 20*log10(abs(fft(w_ex, N)));
plot(f_4k, original(1:N_4k),'Color',"#FF0000");
plot(f_4k, xlms(1:N_4k),'Color',"#0072BD");
plot(f_4k, elms(1:N_4k),'Color',"#D95319");
plot(f_4k, exlms(1:N_4k),'Color',"#7E2F8E");
title('Átvitelek spektruma');
xlabel('Frekvencia [Hz]');
ylabel('Erősítés[dB]');
legend('A1', 'xLMS', 'eLMS', 'exLMS');
annotation('textbox', [0.3, 0.8, 0.1, 0.1], 'String', "Szűrőegyütthatók száma: " + 500 + " db", 'BackgroundColor', 'w')
grid on;
%}

%% Hibajelek
%{ 
start =  40000; % 1
stop  = 200000; % Length(e_x)

figure(101);
hold on;
title('Hibajelek (legkisebb amplitudó szerint)');
xlabel('Minta [1]');
ylabel('Amplitudó (log)');
grid on;
plot(log(abs(e_ex)),'Color',"#7E2F8E");
plot(log(abs(e_x)),'Color',"#0072BD");
plot(log(abs(e_e)),'Color',"#D95319");
legend('exLMS', 'xLMS', 'eLMS');
%}
%{
figure(102);
hold on;
title('Hibajelek (leggyorsabb beállás szerint)');
xlabel('Minta [1]');
ylabel('Amplitudó (lin)');
grid on;
plot(abs(e_e (start:stop)),'Color',"#D95319");
plot(abs(e_ex(start:stop)),'Color',"#7E2F8E");
plot(abs(e_x (start:stop)),'Color',"#0072BD");
legend('eLMS', 'exLMS','xLMS');
%}

%%{
figure(103);
start =  40000 + 50000; 
stop = start + 300000;
n_avg = 10000;
hold on;
title('Hibajelek (Mozgó átlagolva)');
xlabel('Minta [1]');
ylabel('Amplitudó (lin)');
grid on;
plot(movmean(abs(e_x (start:stop)), n_avg),'Color',"#0072BD");
plot(movmean(abs(e_e (start:stop)), n_avg),'Color',"#D95319");
plot(movmean(abs(e_ex(start:stop)), n_avg),'Color',"#7E2F8E");
legend('xLMS', 'eLMS','exLMS');
annotation('textbox', [0.3, 0.8, 0.1, 0.1], 'String',"Mozgó átlagolás:" + n_avg + " db mintával" , 'BackgroundColor', 'w')
hold off;
%}

%{
hold on;
plot(log(abs(e_e(1:60000))),'Color',"#D95319");
plot(log(abs(e_ex(1:60000))),'Color',"#7E2F8E");
plot(log(abs(e_x(1:60000))),'Color',"#0072BD");

figure(104);
hold on;
plot(abs(e_ex(1:end)),'Color',"#7E2F8E");
plot(abs(e_x(1:end)),'Color',"#0072BD");
plot(abs(e_e(1:end)),'Color',"#D95319");

figure(105);
hold on;
plot(e_x(1:60000),'Color',"#0072BD");
plot(e_e(1:60000),'Color',"#D95319");
plot(e_ex(1:60000),'Color',"#7E2F8E");
%}

%% FxLMS
%%{
figure(3);
plot(f_4k, xlms(1:N_4k),'Color',"#0072BD");
title('FxLMS spektruma');
xlabel('Frekvencia [Hz]');
ylabel('Erősítés[dB]');
annotation('textbox', [0.5, 0.8, 0.1, 0.1], 'String', "Szűrőegyütthatók száma: " + 500 + " db" + newline + "Bátorsági tényező: " + mux + newline + "Késleltetés: " + "-" + " minta", 'BackgroundColor', 'w')
grid on;

figure(4);
hold on
start =  40000 + 50000; 
stop = start + 300000;
plot(e_x(start:stop),'Color',"#0072BD");
title('FxLMS hibajele');
xlabel('Minta [1]');
ylabel('Amplitúdó [1]');
grid on;
t_settle = getSettleTime(e_x(start:stop), 10000);
annotation('textbox', [0.55, 0.8, 0.1, 0.1], 'String', "Beállási idő " + t_settle + " db minta" , 'BackgroundColor', 'w');


%}

%% FeLMS
%%{
figure(5);
plot(f_4k, elms(1:N_4k),'Color',"#D95319");
title('FeLMS spektruma');
xlabel('Frekvencia [Hz]');
ylabel('Erősítés[dB]');
annotation('textbox', [0.5, 0.8, 0.1, 0.1], 'String', "Szűrőegyütthatók száma: " + 500 + " db" + newline + "Bátorsági tényező: " + mue + newline + "Késleltetés: " + delay + " minta", 'BackgroundColor', 'w')
grid on;

figure(6);
start =  40000 + 50000; 
stop = start + 300000;
hold on
plot(e_e(start:stop),'Color',"#D95319");
title('FeLMS hibajele');
xlabel('Minta [1]');
ylabel('Amplitúdó [1]');
grid on;
t_settle = getSettleTime(e_e(start:stop), 10000);
annotation('textbox', [0.55, 0.8, 0.1, 0.1], 'String', "Beállási idő " + t_settle + " db minta" , 'BackgroundColor', 'w');
%}

%% FexLMS
%%{
figure(7);
plot(f_4k, exlms(1:N_4k),'Color',"#7E2F8E");
title('FexLMS spektruma');
xlabel('Frekvencia [Hz]');
ylabel('Erősítés[dB]');
annotation('textbox', [0.5, 0.8, 0.1, 0.1], 'String', "Szűrőegyütthatók száma: " + 500 + " db" + newline + "Bátorsági tényező: " + muex + newline + "Késleltetés: " + k + " minta", 'BackgroundColor', 'w')
grid on;

figure(8);
start =  40000 + 50000; 
stop = start + 300000;
plot(e_ex(start:stop),'Color',"#7E2F8E");
title('FexLMS hibajele');
xlabel('Minta [1]');
ylabel('Amplitúdó [1]');
grid on;
t_settle = getSettleTime(e_ex(start:stop), 10000);
annotation('textbox', [0.55, 0.8, 0.1, 0.1], 'String', "Beállási idő " + t_settle + " db minta" , 'BackgroundColor', 'w');
%}
%% H és inverze
%%{
figure(11)
H_og  = 20*log10(abs(fft(filter(A2_b, A2_a,Impulse), N)));
H_inv = 20*log10(abs(fft(h, N)));
hold on
plot(f_4k, H_og(1:N_4k),'Color',"red");
plot(f_4k, H_inv(1:N_4k),'Color',"#013220");
plot(f_4k, H_og(1:N_4k) + H_inv(1:N_4k),'Color',"#ff6600");
title('A2 és H');
xlabel('Frekvencia [Hz]');
ylabel('Erősítés[dB]');
legend('Eredeti A2', 'Inverz A2 (H)', 'A kettő szorzata');
annotation('textbox', [0.15, 0.8, 0.1, 0.1], 'String', "Szűrőegyütthatók száma: " + k + " db", 'BackgroundColor', 'w');
grid on;
hold off
%}

%% A2 és inverze
%{
figure(12)
hold on;
plot(A2_k(1:A2_N),'Color',"red");
plot(A2_i,'Color',"#013220");
%}
%%{
figure(13)
hold on;
title('A2 és inverze LMS algoritmussal');
og = 20*log10(abs(fft(filter(A2_b, A2_a,Impulse), N)));
inv = 20*log10(abs(fft(A2_i, N)));

plot(f_4k, og(1:N_4k),'Color',"red");
plot(f_4k, inv(1:N_4k) ,'Color',"#013220");
%plot(20*log10(abs(fft(A2_k))),'Color',"#A2142F");
plot(f_4k, inv(1:N_4k)' + og(1:N_4k),'Color',"#ff6600");
xlabel('Frekvencia [Hz]');
ylabel('Erősítés[dB]');
grid on;
legend('Eredeti A2', 'Inverz A2', 'A kettő szorzata');
%}
%%
%{ A2 nem volt bonyolult
    % }