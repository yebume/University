%% Clean up
clear;
close all;
clc;
%% Signals
A1   = importdata('C:\Student\DSPLab\Jakab_Tamas\Szakdolgozat\23.11.03 eLMS\Phase2\A2.dat');
%A1 = A1_all.data;
A1_i = importdata('C:\Student\DSPLab\Jakab_Tamas\Szakdolgozat\23.11.03 eLMS\Phase2\A2_i.dat');
%A1_i = A1_i_all.data;
%%{
figure(1);
plot(A1);
hold on;
plot(A1_i);
legend('modell','inverz');
%}

%%{
figure(3);
hold on;
plot(20*log10(abs(fft(A1))));
plot(20*log10(abs(fft(A1_i))));
plot(20*log10(abs(fft(A1))) + 20*log10(abs(fft(A1_i))));
%legend('modell','inverz');
%}


%{
k = 1000;
pre = abs(ifft((abs(1./fft(A1)))));
out = [pre(end-k/2:end); pre(1:k/2)];
outed = out.*hanning(k+1);
figure(1)
%plot(outed);
figure(3);
plot(20*log10(abs(fft(outed))));
%}