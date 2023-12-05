%% Clean up
clear;
close all;
clc;

a1   = importdata('C:\Student\DSPLab\Jakab_Tamas\Szakdolgozat\23.11.13 exLMS - cherry\Phase2_FxLMS\A2.dat');
A1_inv = 1./abs(fft(a1));

% H és h
h_inv = ifft(A1_inv);    % ugyan annyi mint ifft mint amennyi darabunk van, ne interpoláljon

k = 50;           % konvergencia sebsességét befolyásolják

out = [h_inv(end-k/2: end); h_inv(1: k/2)];
h = out .* hanning(k+1);

%{
figure(1)
hold on;
plot(a1(1:k+1));
plot(h);
%}

%%{
figure(8)
hold on;
plot(20*log10(abs(fft(a1(1:k+1)))));
plot(20*log10(abs(fft(h))));
plot(20*log10(abs(fft(a1(1:k+1)))) + 20*log10(abs(fft(h))));
%}
