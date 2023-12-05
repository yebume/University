%% Clean up
clear;
close all;
clc;

%% Process
%{
input   = importdata('C:\Users\onlab\Desktop\better mu\big_bell.wav');
data = input.data;
fs = input.fs;

spectrogram(data,hanning(1024),0,1024,fs)
%}

%% Music
%%{

music   = importdata('C:\Users\onlab\Desktop\Beethoven-7.4\classic.wav');
fs = music.fs;
music = music.data;

music_anc   = importdata('C:\Users\onlab\Desktop\Beethoven-7.4\anc.wav');
music_anc = music_anc.data;

figure(2);
plot(20*log10(abs(fft(music))));
hold on;
plot(20*log10(abs(fft(music_anc))));

figure(3);
plot(music);
hold on;
plot(music_anc);

%figure(4);
%spectrogram(music,hanning(1024),0,1024,fs)
%figure(5);
%spectrogram(music_anc,hanning(1024),0,1024,fs)


%}