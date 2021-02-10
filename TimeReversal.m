clc;
close all;
clear all;
xn=input('enter the sequence:');
N=length(xn);
Xk=fft(xn);
disp('dft of the sequence x(n)');
disp(Xk);
n=0:N-1;
x1n=xn(mod(-n,N)+1);
disp('time reversed sequence x(-n)');
disp(x1n);
X1k=fft(x1n);
disp('dft of time reversed sequence');
disp(X1k);
X2k=conj(Xk);
disp('conjugate of X(k)');
disp(X2k);

figure
subplot(3,2,1);
stem(abs(Xk));
ylabel('Amplitude ');
xlabel('N ');
title('magnitude of dft of x(n)');

subplot(3,2,2);
stem(angle(Xk));
ylabel('Angle ');
xlabel('N ');
title('phase of dft of x(n)');

subplot(3,2,3);
stem(abs(X1k));
ylabel('Amplitude ');
xlabel('N ');
title('magnitude of dft of x(-n)');

subplot(3,2,4);
stem(angle(X1k));
ylabel('Angle ');
xlabel('N ');
title('phase of dft of x(-n)');

subplot(3,2,5);
stem(abs(X2k));
ylabel('Amplitude ');
xlabel('N ');
title('magnitude of conjugate of Xk');

subplot(3,2,6);
stem(angle(X2k));
ylabel('Angle ');
xlabel('N ');
title('phase of conjugate of Xk');