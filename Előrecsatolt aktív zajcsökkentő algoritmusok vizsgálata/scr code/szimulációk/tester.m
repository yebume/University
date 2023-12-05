clear all
close all
clc

%% White Noise
Signal_l = 100000;
L = Signal_l;
Noise = randn(L, 1);

%% Impulse Signal
N_imp = Signal_l;
Impulse = [1, zeros(1,N_imp-1)];


%% A1
fs = 48E3;
fcut = 4E3;
Num = 101;     % szűrő együttható
b = firpm(Num-1, [0 fcut-1000 fcut fs/2]/(fs/2), [1 1 0 0], [1, 10]);
a = 1;
A1 = filter(b,a,Noise);
%plot(20*log10(abs(fft(filter(b, a,Impulse)))));
w_a1 = filter(b, a,Impulse);

%% A2
A2_num  = [1 -0.4164 1.2346];
A2_den  = [1  0.6627  0.6414];
w = filter(A2_num,A2_den,Impulse);                                         % A2 impulse response 
%plot(20*log10(abs(fft(w))));

%% A2 becslője és inverze
M       = 10E5;
A2_N    = 200;
A2_mu   = .01/A2_N;
delay   = 50; 

Noise_tmp = randn(M, 1);
Noise_d   = [zeros(delay, 1); Noise_tmp];
Noise_f   = filter(A2_num, A2_den, Noise_tmp);
[A2_e, A2_i, ~] = myLMS(A2_N, A2_mu, Noise_f, Noise_d);
[~, A2_k, ~] = myLMS(A2_N, A2_mu, Noise_tmp, Noise_f);

%% LMS
N       = 200;
mu      = .1/N;

[e_x,  w_x,  yk_x]  = myXLMS( N, mu, A2_k,              Noise, A1);        %  xLMS
[e_e,  w_e,  yk_e]  = myELMS( N, mu, A2_k, A2_i, delay, Noise, A1);        %  eLMS
[e_ex, w_ex, yk_ex] = myEXLMS(N, mu, A2_k, A2_i,        Noise, A1);        % exLMS


%% Display
figure(1)
hold on;
plot(20*log10(abs(fft(w_a1(1:N)))));
plot(20*log10(abs(fft(w_x))));
plot(20*log10(abs(fft(w_e))));
plot(20*log10(abs(fft(w_ex))));
title('Spektrum');
xlabel('Minta [1]');
ylabel('Amplitúdó [1]');
annotation('textbox', [0.2, 0.8, 0.1, 0.1], 'String', "Szűrőegyütthatók száma: " + N + " db" + newline + "Bátorsági tényező: " + mu + newline + "Késleltetés: " + delay + " minta")
legend('Eredeti átvitel', 'xLMS', 'eLMS', 'exLMS');
grid on;

figure(2)
plot(e_x);
figure(3)
plot(e_e);
figure(4)
plot(e_ex);


