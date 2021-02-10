clc;
clear all;
close all;
x=input('enter a sequene');
m=input('enter number of shifts');
N=length(x);
k=0:N-1;Y=[];a=0;
X=fft(x);
disp('dft of entered sequence is:');
disp(X)
y=circshift(x,m);
disp('circular time shifted sequence is:');
disp(y)
z=fft(y);
disp('DFT of x((n-m))N');
disp(z)
for k=0:N-1
    a=a+X(k+1)*(exp(-j*2*pi*m*k/N));
    Y=[Y a];a=0;
end
disp('x(k)*w^mk');
disp(Y)
figure(1)
subplot(2,2,1);
stem(abs(X))
xlabel('k');
ylabel('amplitude');
title('magnitude of dft of x(n)');
subplot(2,2,2);
stem(rad2deg(angle(X)))
xlabel('k');
ylabel('angles');
title('phase of dft ofx(n)');
subplot(2,2,3);
stem(abs(y))
xlabel('k');
ylabel('amplitude');
title('magnitude of x((n-m))N');
subplot(2,2,4);
stem(angle(y))
xlabel('k');
ylabel('phase');
title('phase angles of x((n-m))N');
figure(2)
subplot(2,2,1);
stem(abs(z))
xlabel('k');
ylabel('amplitude');
title('magnitude of dft of x(n)');
subplot(2,2,2);
stem(rad2deg(angle(z)))
xlabel('k');
ylabel('phase');
title('phase angle of dft of x(n)');
subplot(2,2,3);
stem(abs(Y))
xlabel('k');
ylabel('amplitude');
title('magnitude of dft of x((n-m))N');
subplot(2,2,4);
stem(rad2deg(angle(Y)))
xlabel('k');
ylabel('phase');
title('phase angles of dft of x((n-m))N');