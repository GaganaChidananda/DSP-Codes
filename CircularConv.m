clc;
close all;
clear all;
a=input('Enter 1st a sequence');
b=input('Enter 2nd a sequence');
n1=length(a);
n2=length(b);
if(n1~=n2)
    if(n1>n2)
        n=n1;
        b=[b zeros(1,(n1-n2))];
    else
        n=n2;
        a=[a zeros(1,(n2-n1))];
    end
else
    n=n1;
end
%xk=cconv(a,b,n);
%without cconv(a,b,n)
y=zeros(1,n);
for N1=1:n
    for N2=1:n
        j=(mod(N1-N2,n)+1);
        y(N1)=y(N1)+a(N2)*b(j);
    end
end
disp('circular covolution in time domain');
disp(y)
subplot(2,1,1);
stem(y);
xlabel('N values');
ylabel('amplitude');
title('circular covolution in time domain');
Xk1=fft(a,n);
Xk2=fft(b,n);
Xk=Xk1.*Xk2;
Xkk=ifft(Xk);
disp('circular covolution in frequency domain');
disp(Xkk)
subplot(2,1,2);
stem(Xkk);
xlabel('N values');
ylabel('amplitude');
title('circular covolution in frequency domain');