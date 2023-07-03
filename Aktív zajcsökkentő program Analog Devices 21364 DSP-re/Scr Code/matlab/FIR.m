fs = 48E3;
fcut = 4E3;
Num = 51;     % szûrõ együttható

b = firpm(Num-1, [0 fcut-1000 fcut fs/2]/(fs/2), [1 1 0 0], [1, 1]);
%figure(1)
%freqz(b,1);
figure(2)
plot(20*log10(abs(fft(b,48E3))));

FID=fopen('coef_dec.txt','w');
fprintf(FID,'%f,\n',b);
fclose(FID);

FID=fopen('coef_dec.dat','w');
fprintf(FID,'%f,\n',b);
fclose(FID);