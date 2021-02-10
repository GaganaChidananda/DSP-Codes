clc;
close all;
clear all;
x=input('Enter sequence 1');
y=input('Enter sequence 2');
if(length(x)~=length(y))
if(length(x)>length(y))
    y=[y zeros(1,(length(x)-length(y)))];
else
    x=[x zeros(1,(length(y)-length(x)))];
end
end
N=length(x)+length(y)-1;
xk=conv(x,y);
disp(xk)
if (rem(N,2)==0)
else
    xk=[xk zeros(1,1)];
    N=N+1;
end
n=N/2;
x1=[];x2=[];
for i=0:n-1
    x1=[x1 xk(i+1)];
end
for j=n:N-1
    x2=[x2 xk(j+1)];
end
disp(x1)
disp(x2)
sum=x1+x2;
disp('Linear to circular convoluted values');
disp(sum)
figure
stem(sum)
xlabel('n values');
ylabel('magnitude');
title('linear to circular convoluted sequence is');