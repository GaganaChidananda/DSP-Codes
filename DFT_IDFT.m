clc;
clear all;
close all;
x=input('enter a sequence');
N=input('enter sequence length');
b=N-length(x);
if(N>x)
    x=[x zeros(1,b)];
end
subplot(2,2,1);
stem(x);
xlabel('n values');
ylabel('x[n] values');
title('Plot of signal');
y=zeros(1,N);
for k=0:N-1
    for n=0:N-1
        y(k+1)=y(k+1)+x(n+1)*exp((-2*i*pi*k*n)/N);
    end
end
disp('FFT without built-in: y=');
disp(y)
mag=abs(y);
subplot(2,2,2);
stem(mag);
xlabel('n values');
ylabel('magnitude of X[k]');
title('DFT value magnitude');
z=rad2deg(angle(y));
subplot(2,2,3);
stem(z);
xlabel('n values');
ylabel('phase of X[k]');
title('DFT value phase');

%idft
N1=length(y);
m=zeros(1,N1);
for n=0:N1-1
    for k=0:N-1
        m(n+1)=m(n+1)+((1/N)*y(k+1)*exp((2*i*pi*k*n)/N));
    end
end
disp('IDFT without built-in: m=');
disp(m)
subplot(2,2,4); 
stem(m);
xlabel('n values');
ylabel('x[n] signal');
title('IDFT value');

%using fft module
a=fft(x,N);
disp('FFT using built-in');
disp('a=');
disp(a)
figure
subplot(2,2,1)
mag1=abs(a);
stem(mag1);
xlabel('n values');
ylabel('magnitude of X[k]');
title('DFT value magnitude');
z=rad2deg(angle(a));
subplot(2,2,2);
stem(z);
xlabel('n values');
ylabel('phase of X[k]');
title('DFT value phase');

%idft using fft module
c=ifft(a,N);
disp('IFFT using built-in');
disp('c=');
disp(abs(c))
subplot(2,2,3); 
stem(c);
xlabel('n values');
ylabel('x[n] signal');
title('IDFT value');
f=(0:length(a)-1)%*100/length(a);
subplot(2,2,3);
plot(f,abs(a))
subplot(2,2,4);
plot(f,(angle(a)*180/pi))