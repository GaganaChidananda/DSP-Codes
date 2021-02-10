clc;
close all;
xn=input('Enter a real sequence=');
N=input('Enter the value of N=');

XK=[];
CK=[];
YK=[];
ZK=[];
PK=[];

xk=0;
for k=0:N-1
    for n=0:N-1
        xk= xk+xn(n+1)*exp(-1j*2*pi*n*k/N);
    end
XK=[XK xk];
xk=0;
end

disp('DFT X(k)')
disp(XK)

yk=0;
for k=0:N-1
    for n=0:N-1
        yk= yk+xn(n+1)*exp(-1j*2*pi*n*-k/N);
    end
YK=[YK yk];
yk=0;
CK= conj(YK);
end

disp('DFT X(-k)')
disp(CK)

zk=0;
for k=0:N-1
    for n=0:N-1
        zk= zk+xn(n+1)*exp(-1j*2*pi*n*(N-k)/N);
    end
ZK=[ZK yk];
yk=0;
PK= conj(YK);
end

disp('DFT X(N-k)')
disp(PK)
m=0;
if(XK==PK)
    m=1;
else
    m=0;
end
if(m==1)
    disp('It is symmetric')
else
    disp('It is not symmetric')
end