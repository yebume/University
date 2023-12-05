fs = 48e3;

N = 1000;

B_1 = fir1(N-1, 1000/(fs/2));
figure(1)
freqz(B_1, 1, fs, fs)
FID=fopen('coef_1.dat','w');
fprintf(FID,'%f,\n',B_1);
fclose(FID);


% B_2 = firls(N-1, [0 5000 6e3 10e3 11e3 24e3]/(fs/2), [0 0 1 1 0 0]);
% figure(2)
% freqz(B_2, 1, fs, fs)
% FID=fopen('coef_2.dat','w');
% fprintf(FID,'%f,\n',B_2);
% fclose(FID);


