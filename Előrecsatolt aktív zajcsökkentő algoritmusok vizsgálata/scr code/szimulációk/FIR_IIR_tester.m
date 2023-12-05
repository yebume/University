%% Clean up
clear;
close all;
clc;

%% Signals
% White Noise
%Signal_l =  600000;     % beállnak-e
Signal_l = 1000000;     % szintén
%Signal_l = 10000;

L = Signal_l;
Noise = randn(L, 1);

% Impulse Signal
N_imp = Signal_l;
Impulse = [1, zeros(1,N_imp-1)];

%% Filters
% Meres1 & Meres2
b_meres1 = importdata('D:\Asztalról\Szakdoga matlab\test 2gether\A1_new.dat')';
a_meres1 = 1;
b_meres2 = importdata('D:\Asztalról\Szakdoga matlab\test 2gether\A3_new.dat')';
a_meres2 = 1;

%__________________________________________________________________________

% IIR
b_iir  = [1 -0.4164 1.2346];
a_iir  = [1  0.6627  0.6414];

%__________________________________________________________________________

% FIR - LPF
fs = 48E3;
fcut = 4E3;
Num = 101;     % szűrő együttható
b_fir = firpm(Num-1, [0 fcut-1000 fcut fs/2]/(fs/2), [1 1 0 0], [1, 10]);
a_fir = 1;

b_fir2 = firpm(20,[0 0.3 0.4 0.6 0.7 1], [.3 .3 1 1 .3 .3]);
a_fir2 = 1;

%__________________________________________________________________________

% delay
b_delay = [zeros(99,1); 1]';
a_delay = 1;

b_delay2 = [zeros(49,1); 1]';
a_delay2 = 1;

%% Systems

% A1
%%{
b = b_fir;
a = a_fir;
%}

%{
b = b_meres1;
a = a_meres1;
%}

A1 = filter(b,a,Noise);
%plot(20*log10(abs(fft(filter(b, a,Impulse)))));
w_a1 = filter(b, a,Impulse);

%__________________________________________________________________________

% A2
%%{
A2_num = b_iir;
A2_den = a_iir;
%}

%{
A2_num = b_meres2;
A2_den = a_meres2;
%}

w = filter(A2_num,A2_den,Impulse);                                         % A2 impulse response 
%plot(20*log10(abs(fft(w(1:100)))));

H_A2inv = 1./abs(fft(filter(w, 1,Impulse)));

%% A2 becslője, inverze és H

% A2
M       = 10E5;
A2_N    = 500;
A2_k_mu   = .1/A2_N;
A2_i_mu   = .1/A2_N;     %.000215/A2_N;
%delay   = 50;           % og
%delay = 14;             % fir-iir      -> 5 dB-en belül
%delay = 26;             % meres1-meres2 -> 5 dB-en belül
delay = 26;

%Noise_tmp = randn(M, 1);
Noise_tmp = Noise;
Noise_d   = [zeros(delay, 1); Noise_tmp];
Noise_f   = filter(A2_num, A2_den, Noise_tmp);
[A2_e, A2_i, ~] = myLMS(A2_N, A2_i_mu, Noise_f, Noise_d);
[~, A2_k, ~] = myLMS(A2_N, A2_k_mu, Noise_tmp, Noise_f);

%__________________________________________________________________________

% H és h
h_A2inv = ifft(H_A2inv);    % ugyan annyi mint ifft mint amennyi darabunk van, ne interpoláljon

k = 22;           % k = 200
% std             % k =  50!!!!!!
%k = 22;  %IIR-FIR        -> 5 dB-en belül
%k = 34;  %meres1-meres2 -> 5 dB-en belül
% meres1-meres2:  % k =  16 még működik

out = [h_A2inv(end-k/2: end), h_A2inv(1: k/2)];
h = out .* hanning(k+1)';
            


%% LMS
% meres1 - meres2
N       = 200;
%{
mux      = 2.55 /N;                                                            
mue      =  .05/N;                                                        
muex     =  .06 /N;
%}

% fir - iir
%%{
mux      =  .1 /N;                                                            
mue      = 1.2 /N;                                                        
muex     =  .5 /N;
%}

% itt: mux = 0,01275;
% DSP: mux = 0.00005;
%{
mux      = 2.55 /N;    
mue      =  .001 /N;                                                        
muex     =  .01 /N;
%}
starter = 100000;
[e_x,  w_x,  yk_x]  = myXLMS( N, mux,  A2_k,              Noise, A1, starter);      %  xLMS
[e_e,  w_e,  yk_e]  = myELMS( N, mue,  A2_k, A2_i, delay, Noise, A1, starter);      %  eLMS
[e_ex, w_ex, yk_ex] = myEXLMS(N, muex, A2_k, h,           Noise, A1, starter);      % exLMS

%------------------------------------------------------------------------------------------------
%------------------------------------------------------------------------------------------------
%------------------------------------------------------------------------------------------------

%% Átvitelek
%{
figure(2);
hold on;
plot(20*log10(abs(fft(w_a1(1:N)))),'Color',"#FF0000");
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
%{
start =  40000; % 1
stop  = 200000; % Length(e_x)
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
H_og  = 20*log10(abs(fft(w(1:k+1))));
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
plot(20*log10(abs(fft(w(1:A2_N)))),'Color',"#FF0000");
plot(20*log10(abs(fft(A2_i))),'Color',"#013220");
plot(20*log10(abs(fft(A2_i)))' + 20*log10(abs(fft(w(1:A2_N)))),'Color',"#ff6600");
legend('Eredeti', 'Inverz', 'Szorzat');
xlabel('Minta [1]');
ylabel('Erősítés[dB]');
grid on;
%}