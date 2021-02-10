clc;
clear all;
close all;
x_n=input('enter the sequence');
l=input('enter the number of shifts');
N=input('enter the value of N');
if(N>length(x_n))
    for i=1:N-length(x_n)
        x_n=[x_n 0];
    end
end
n=0:N-1;
a=fft(x_n);
disp('dft of x(n)')
disp(a)
X=circshift(a,l);
disp('X((k-l))N')
disp(X)
p=x_n.*exp(j*2*pi*l*n/N);
disp('DFT(x(n)*WN^-ln)')
X1=fft(p)

figure
subplot(2,2,1)
stem(abs(x_n))
title('magnitude of input sequence x(n)')

subplot(2,2,2)
stem(angle(x_n))
title('phase of input sequence x(n)')

subplot(2,2,3)
stem(abs(a))
title('magnitude of X(k)')

subplot(2,2,4)
stem(angle(a))
title('phase of X(k)')

figure
subplot(2,2,1)
stem(abs(X))
title('magnitude of X((k-l))N')

subplot(2,2,2)
stem(angle(X))
title('phase of X((k-l))N')

subplot(2,2,3)
stem(abs(X1))
title('magnitude of DFT{x(n)*WN^-ln}')

subplot(2,2,4)
stem(angle(X1))
title('phase of DFT{x(n)*WN^-ln}')