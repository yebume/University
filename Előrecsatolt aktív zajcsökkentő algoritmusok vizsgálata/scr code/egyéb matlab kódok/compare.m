%% Clean up
clear;
close all;
clc;

coefs_x   = importdata('C:\Student\DSPLab\Jakab_Tamas\Szakdolgozat\Teljes beállás\xLMS.dat');
coefs_e   = importdata('C:\Student\DSPLab\Jakab_Tamas\Szakdolgozat\Teljes beállás\eLMS.dat');
coefs_ex_41 = importdata('C:\Student\DSPLab\Jakab_Tamas\Szakdolgozat\Teljes beállás\exLMS_41h.dat');
coefs_ex_121 = importdata('C:\Student\DSPLab\Jakab_Tamas\Szakdolgozat\Teljes beállás\exLMS_121h.dat');
coefs_ex_egyesek = importdata('C:\Student\DSPLab\Jakab_Tamas\Szakdolgozat\Teljes beállás\exLMS_egyesek.dat');
fs = importdata('C:\Student\DSPLab\Jakab_Tamas\Szakdolgozat\Teljes beállás\firstStep.dat');
secstep = importdata('C:\Student\DSPLab\Jakab_Tamas\Szakdolgozat\Teljes beállás\secStep.dat');
%{
figure(1)
hold on;
plot(coefs_x, 'blue');
plot(coefs_e, 'red');
plot(coefs_ex_41, 'black');
plot(coefs_ex_121, 'green');
legend('X', 'E', 'EX');
%}
figure(2)
plot(coefs_x, 'blue');
legend('X');

figure(3)
plot(coefs_e, 'red');
legend('E');

figure(4)
plot(coefs_ex_41, 'black');
legend('EX 41');

figure(5)
plot(coefs_ex_121, 'green');
legend('EX 121');

figure(6)
plot(coefs_ex_egyesek);
legend('EX egyesek');

figure(7)
plot(fs);

figure(8)
plot(secstep);