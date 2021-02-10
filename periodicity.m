clc
clear all;
close all;
xn1=input('enter sequence');
disp(xn1)
N=length(xn1);
n=1:4;
xk1=fft(xn1,N);
disp('dft of sequence');
disp(xk1)
xk=fft(xn1(mod(n+N,N+1)+1));
disp('dft of sequence periodicity');
disp(xk)
subplot(2,2,1);
stem(abs(xk1));
xlabel('k values');
ylabel('magnitude');
title('dft plot of x(n)');
z1=rad2deg(angle(xk1));
subplot(2,2,2);
stem(z1);
xlabel('k values');
ylabel('phase');
title('dft phase plot of x(n)');
subplot(2,2,3);
stem(abs(xk));
xlabel('k values');
ylabel('magnitude');
title('dft magnitude plot of x(k+N)');
z2=rad2deg(angle(xk));
subplot(2,2,4);
stem(z2);
xlabel('k values');
ylabel('phase');
title('dft phase plot of x(k+N)');