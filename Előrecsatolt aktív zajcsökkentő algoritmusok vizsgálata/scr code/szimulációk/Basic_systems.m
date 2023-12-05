clear all
close all
clc

%% White Noise
%Signal_l = 1000000;
Signal_l = 100000;
L = Signal_l;
Noise = randn(L, 1);

%% Impulse Signal
N_imp = Signal_l;
Impulse = [1, zeros(1,N_imp-1)];

%% A1
A1_delay = 100;
A1 = zeros(A1_delay, 1);

%% A2 - marad (egyszerű fv, jól kihozza a különbséget az algoritmusok közül)
A2_num  = [1 -0.4164 1.2346];
A2_den  = [1  0.6627  0.6414];
w = filter(A2_num,A2_den,Impulse);                                         % A2 impulse response 
 %filter(num, den, signal);
%figure(42)
%plot(Noise)
%figure(43)
%plot(filter(A2_num,A2_den,Noise))


%% A2 filtered White Noise
F_Noise = filter(A2_num, A2_den,Noise);

%% A2 kalap
N_A2_k = 200;
mu_A2_k = .1/N_A2_k;
[e_k, w_k, y_k] = myLMS(N_A2_k, mu_A2_k, Noise, F_Noise);

%% Delayed inverse
delay = 100;
N_di = 200;
mu_di = .1/N_di;
Noise_d = [zeros(delay, 1); Noise(1:end)];
[e_di, w_di, yk_di] = myLMS(N_di, mu_di, F_Noise, Noise_d);

%% Display
figure(1);
title('Amplitudó karakterisztika');
xlabel('Minta [1]');
ylabel('Erősítés [dB]');
hold on;
plot(20*log10(abs(fft(w(1:200)))));
plot(20*log10(abs(fft(w_k))));
plot(20*log10(abs(fft(w_di))));
plot(20*log10(abs(fft(w_di)) .* abs(fft(w_k))));
grid on;
legend('Eredeti átvitel spektruma', 'Modellezett átvitel spektruma', 'Eredeti átvitel inverzének spektruma', 'Eredeti és Inverz átvitelének a szorzata');


figure(2);
title('Impulzus válasz');
xlabel('Minta [1]');
ylabel('Amplitúdó [1]');
hold on;
plot(w(1:200));
plot(w_k);
plot(w_di);
grid on;
legend('Eredeti rednszer impulzus válasza','Modellezett rendszer impulzus válasza', 'Inverz rendszer impulzusválasza');