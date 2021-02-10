clc;
close all;
clear all;
x=input('Enter sequence 1');
y=input('Enter sequence 2');
N1=length(x);
N2=length(y);
N=length(x)+length(y)-1;
x=[x zeros(1,(N-length(x)))];
y=[y zeros(1,(N-length(y)))];
%circular conv
Y=zeros(1,N);
for n=1:N
    for m=1:N
        j=mod(n-m,N)+1;
        Y(n)=Y(n)+x(m)*y(j);
    end
end
disp(Y)
%using cconv func
%y1=cconv(x,y,N);

%without cconv function
y1=zeros(1,n);
for N1=1:N
    for N2=1:N
        j=(mod(N1-N2,N)+1);
        y1(N1)=y1(N1)+x(N2)*y1(j);
    end
end
disp(y1)
figure
stem(Y)
xlabel('n values');
ylabel('magnitude');
title('Linear convolution using circular convolution');