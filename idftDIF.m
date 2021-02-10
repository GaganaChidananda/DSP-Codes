clc; 
clear all;
x=input('enter X[k]:');
N=length(x);
x=conj(x)
levels=nextpow2(N);
xn=[x,zeros(1,(2^levels)-N)];
N=length(xn);
tw=cos(2*pi*(1/N)*(0:N/2-1))-j*sin(2*pi*(1/N)*(0:N/2-1));
for level=levels:-1:1
    L=2^level;
   twlvl=tw(1:N/L:N/2);
    for k=0:L:N-L       
        for n=0:L/2-1
            A=x(n+k+1);
            B=x(n+k+(L/2)+1);
            x(n+k+1)=A+B;
            x(n+k+(L/2)+1)=(A-B)*twlvl(n+1);;
         end  
    end
    x
 end
x=bitrevorder(x)
XK=conj(x)/N ;
disp(XK)
n=0:N-1;
subplot(2,2,1);
stem(n,real(xn));
title('Real part of X(k)');
xlabel('n');
ylabel('Amplitude');
subplot(2,2,2);
stem(n,imag(xn));
title('Imag part of X(k)');
xlabel('n');
ylabel('Amplitude');
subplot(2,2,3);
stem(n,real(XK));
title('Real part of x(n)');
xlabel('n');ylabel('Amplitude');
subplot(2,2,4);
stem(n,imag(XK));
title('Imag part of x(n)');
xlabel('n');
ylabel('Amplitude');
