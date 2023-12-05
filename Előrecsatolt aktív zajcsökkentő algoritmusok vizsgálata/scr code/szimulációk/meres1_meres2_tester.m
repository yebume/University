%% Clean up
clear;
close all;
clc;

%% Signals
% White Noise
Signal_l = 10E5;
L = Signal_l;
Noise = randn(L, 1);

% Impulse Signal
N_imp = Signal_l;
Impulse = [1, zeros(1,N_imp-1)];

%% Decimáló szűrő
fs = 48E3;
fcut = 4E3;
Num = 101;     % szűrő együttható

b_dec = firpm(Num-1, [0 fcut-1000 fcut fs/2]/(fs/2), [1 1 0 0], [1, 10]);
a_dec = 1;

Noise = filter(b_dec, a_dec,Noise);

%% Filters
% Meres1 & Meres2
b_meres1 = importdata('D:\Egyetem\Szakdoga matlab\test 2gether\systems\A3.dat')';
%b_meres1 = importdata('D:\Egyetem\11.10\A3.dat')';
a_meres1 = 1;
b_meres2 = importdata('D:\Egyetem\Szakdoga matlab\test 2gether\systems\A2.dat')';
%b_meres2 = importdata('D:\Egyetem\11.10\A2.dat')';
a_meres2 = 1;

%__________________________________________________________________________

% A1
A1_b = b_meres1;    
A1_a = a_meres1;

y_A1 = filter(A1_b,A1_a,Noise);
%plot(20*log10(abs(fft(A1_b))));

%__________________________________________________________________________

% A2
A2_b = b_meres2;
A2_a = a_meres2;
%plot(20*log10(abs(fft(A2_b))));

H_A2inv = 1./abs(fft(filter(A2_b, A2_a,Impulse)));

%% A2 becslője, inverze és H

% A2
A2_N    = 500;
A2_i_mu   = .01/A2_N;       %.000215/A2_N;
delay = 50;

Noise_tmp = Noise;

Noise_d   = [zeros(delay, 1); Noise_tmp];
Noise_f   = filter(A2_b, A2_a, Noise_tmp);

[A2_e, A2_i, ~] = myLMS(A2_N, A2_i_mu, Noise_f, Noise_d);
%{
figure(256)
plot(A2_e);
grid on;
%}
%__________________________________________________________________________

% H és h
h_A2inv = ifft(H_A2inv);    % ugyan annyi mint ifft mint amennyi darabunk van, ne interpoláljon

k = 160;           % k = 200

out = [h_A2inv(end-k/2: end), h_A2inv(1: k/2)];
h = out .* hanning(k+1)';
            

%N       = 500;
%mux      =  .1/N;    
%mue      =  .05/N;                                                        
%muex     =  .08/N;    %.065

%% LMS
N       = 500;
mux      =  .1/N;    
mue      =  .05/N;                                                        
muex     =  .08/N;    %.065


starter = 100000;
A2_k = b_meres2;

[e_x,  w_x,  yk_x]  = myXLMS( N, mux,  A2_k,              Noise, y_A1, starter);      %  xLMS
[e_e,  w_e,  yk_e]  = myELMS( N, mue,  A2_k, A2_i, delay, Noise, y_A1, starter);      %  eLMS
[e_ex, w_ex, yk_ex] = myEXLMS(N, muex, A2_k, h,           Noise, y_A1, starter);      % exLMS

%------------------------------------------------------------------------------------------------
%------------------------------------------------------------------------------------------------
%------------------------------------------------------------------------------------------------
%% Params
%N = 4096;
%fs = 48E3;
%f = 0 : fs/N : (fs-(fs/N))/2;

%% Átvitelek
%%{
figure(2);
hold on;
plot(20*log10(abs(fft(A1_b(1:N)))),'Color',"#FF0000");
plot(20*log10(abs(fft(w_x))),'Color',"#0072BD");
plot(20*log10(abs(fft(w_e))),'Color',"#EE7600");
plot(20*log10(abs(fft(w_ex))),'Color',"#7E2F8E");
title('Átvitelek spektruma');
xlabel('Minta [1]');
ylabel('Erősítés[dB]');
legend('A1', 'xLMS', 'eLMS', 'exLMS');
annotation('textbox', [0.2, 0.8, 0.1, 0.1], 'String', "Szűrőegyütthatók száma: " + N + " db")
grid on;
%}

%% Hibajelek
%{ 
figure(101);
hold on;
title('Hibajelek (legkisebb amplitudó szerint)');
xlabel('Minta [1]');
ylabel('Amplitudó (log)');
grid on;
plot(log(abs(e_ex)),'Color',"#7E2F8E");
plot(log(abs(e_x)),'Color',"#0072BD");
plot(log(abs(e_e)),'Color',"#D95319");
legend('eLMS', 'exLMS', 'xLMS');
%}
%{
figure(102);
hold on;
title('Hibajelek (leggyorsabb beállás szerint)');
xlabel('Minta [1]');
ylabel('Amplitudó (lin)');
grid on;
plot(abs(e_e),'Color',"#D95319");
plot(abs(e_ex),'Color',"#7E2F8E");
plot(abs(e_x),'Color',"#0072BD");
legend('eLMS', 'exLMS','xLMS');
%}
%%{
start =  1; % 1
%stop  = 200000; % Length(e_x)
stop = 1000000;
figure(103);
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
%}

%{

hold on;
plot(log(abs(e_e)),'Color',"#D95319");
plot(log(abs(e_ex),'Color',"#7E2F8E");
plot(log(abs(e_x),'Color',"#0072BD");

figure(104);
hold on;
plot(abs(e_e),'Color',"#D95319");
plot(abs(e_ex),'Color',"#7E2F8E");
plot(abs(e_x),'Color',"#0072BD");

figure(105);
hold on;
plot(e_x),'Color',"#0072BD");
plot(e_e),'Color',"#D95319");
plot(e_ex),'Color',"#7E2F8E");
%}

%% FxLMS
%{
figure(3);
plot(20*log10(abs(fft(w_x))),'Color',"#0072BD");
title('FxLMS spektruma');
xlabel('Minta [1]');
ylabel('Erősítés[dB]');
annotation('textbox', [0.2, 0.8, 0.1, 0.1], 'String', "Szűrőegyütthatók száma: " + N + " db" + newline + "Bátorsági tényező: " + mux + newline + "Késleltetés: " + "-" + " minta")
grid on;

figure(4);
hold on
plot(e_x,'Color',"#0072BD");
title('FxLMS hibajele');
xlabel('Minta [1]');
ylabel('Amplitúdó [1]');
grid on;
%}

%% FeLMS
%{
figure(5);
plot(20*log10(abs(fft(w_e))),'Color',"#D95319");
title('FeLMS spektruma');
xlabel('Minta [1]');
ylabel('Erősítés[dB]');
annotation('textbox', [0.2, 0.8, 0.1, 0.1], 'String', "Szűrőegyütthatók száma: " + N + " db" + newline + "Bátorsági tényező: " + mue + newline + "Késleltetés: " + delay + " minta")
grid on;

figure(6);
hold on
plot(e_e,'Color',"#D95319");
title('FeLMS hibajele');
xlabel('Minta [1]');
ylabel('Amplitúdó [1]');
grid on;
%}

%% FexLMS
%{
figure(7);
plot(20*log10(abs(fft(w_ex))),'Color',"#7E2F8E");
title('FexLMS spektruma');
xlabel('Minta [1]');
ylabel('Erősítés[dB]');
annotation('textbox', [0.2, 0.8, 0.1, 0.1], 'String', "Szűrőegyütthatók száma: " + N + " db" + newline + "Bátorsági tényező: " + muex + newline + "Késleltetés: " + k + " minta")
grid on;

figure(8);
plot(e_ex,'Color',"#7E2F8E");
title('FexLMS hibajele');
xlabel('Minta [1]');
ylabel('Amplitúdó [1]');
grid on;
%}
%% H és inverze
%{
figure(11)
H_og  = 20*log10(abs(fft(A2_b(1:k+1))));
H_inv = 20*log10(abs(fft(h)));
hold on
plot(H_og,'Color',"#FF0000");
plot(H_inv,'Color',"#013220");
plot(H_og + H_inv,'Color',"#ff6600");
title('H és inverze');
xlabel('Minta [1]');
ylabel('Erősítés[dB]');
legend('Eredeti A2', 'Inverz A2 (H)', 'A kettő szorzata');
annotation('textbox', [0.5, 0.085, 0.1, 0.1], 'String', "Szűrőegyütthatók száma: " + k + " db");
grid on;
hold off
%}

%% A2 és inverze
%{
figure(12)
hold on;
plot(A2_k(1:A2_N),'Color',"#A2142F");
plot(A2_i,'Color',"#013220");
xlabel('Minta [1]');
ylabel('Amplitudó');
legend('Modellezett A2', 'Inverz A2');
grid on;
%}
%{
figure(13)
hold on;
title('A2 és inverze LMS algoritmussal');
plot(20*log10(abs(fft(A2_b(1:A2_N)))),'Color',"#FF0000");
plot(20*log10(abs(fft(A2_i))),'Color',"#013220");
plot(20*log10(abs(fft(A2_i)))' + 20*log10(abs(fft(A2_b(1:A2_N)))),'Color',"#ff6600");
legend('Eredeti', 'Inverz', 'Szorzat');
xlabel('Minta [1]');
ylabel('Erősítés[dB]');
grid on;
%}