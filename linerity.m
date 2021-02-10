clc
clear all;
close all;
xn1=input('enter sequence 1');
xn2=input('enter sequence 2');
n1=length(xn1);
n2=length(xn2);
if(n1~=n2)
    if(n1>n2)
        xn2=[xn2 zeros(1,(n1-n2))];
        n=n1;
    else
        xn1=[xn1 zeros(1,(n2-n1))];
        n=n2;
    end
else
    n=n1;
end
xk1=fft(xn1,n);
xk2=fft(xn2,n);
disp('dft of sequence 1');
disp(xk1)
figure(1)
subplot(2,2,1);
stem(abs(xk1));
xlabel('n values');
ylabel('xk1 magnitude');
title('xk1 plot');
z1=rad2deg(angle(xk1));
subplot(2,2,2);
stem(z1);
xlabel('n values');
ylabel('xk1 phase');
title('xk1 plot');
disp('dft of sequence 2');
disp(xk2)
subplot(2,2,3);
stem(abs(xk2));
xlabel('n values');
ylabel('xk2 magnitude');
title('xk2 plot');
z2=rad2deg(angle(xk2));
subplot(2,2,4);
stem(z2);
xlabel('n values');
ylabel('xk2 phase');
title('xk2 plot');
xn=xn1+xn2;
xk=fft(xn,length(xn));
disp('dft of xn1+xn2=');
disp(xk)
figure(2)
subplot(2,2,1);
stem(abs(xk));
xlabel('n values');
ylabel('xk magnitude');
title('xk plot');
z3=rad2deg(angle(xk1));
subplot(2,2,2);
stem(z3);
xlabel('n values');
ylabel('xk phase');
title('xk plot');
xkk=xk1+xk2;
disp('dft of xk1+xk2=');
disp(xkk)
subplot(2,2,3);
stem(abs(xkk));
xlabel('n values');
ylabel('xkk magnitude');
title('xkk plot');
z4=rad2deg(angle(xkk));
subplot(2,2,4);
stem(z4);
xlabel('n values');
ylabel('xkk phase');
title('xkk plot');