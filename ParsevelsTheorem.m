clc;
clear all;
close all;
x=input('Enter the sequence');
N=length(x);
sum=0;
sum1=0;
LHS=[];
RHS=[];
LHS=x.*x;
for i=0:N-1
    sum=sum+LHS(i+1);
end
disp(sum)
X=fft(x);

xk=0;X_K=[];
for k=0:N-1
    for n=0:N-1
        xk= xk+x(n+1)*exp(-1j*2*pi*n*k/N);
    end
X_K=[X_K xk];
xk=0;
end
%disp(X_K)
RHS=abs(X_K.*X_K);
for j=0:N-1
    sum1=sum1+RHS(j+1);
end
disp(sum1/N)