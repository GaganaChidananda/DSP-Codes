w=0:0.01:2*pi;
n=0:50;
x=input('Enter a sequence');
for i=1:length(w);
    X(i)=0;
    for k=1:length(x);
          X(i)=X(i)+x(k).*exp(-j.*w(i).*n(k));
      end
end
subplot(2,1,1);
plot(w/pi,abs(X));
xlabel('X(w)');
ylabel('magnitude');
title('Magnitude of DTFT');
z=rad2deg(angle(X));
subplot(2,1,2);
plot(w/pi,z);
xlabel('X(w)')
ylabel('phase');
title('Phase plot of DTFT');
