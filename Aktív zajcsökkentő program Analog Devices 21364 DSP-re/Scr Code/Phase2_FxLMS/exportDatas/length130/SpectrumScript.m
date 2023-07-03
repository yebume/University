file = fopen('coef1N500v2.dat','r');
A = fscanf(file,'%f');

figure(1)
plot(A)

figure(2)
freqz(A,1,8000,8000)