f=4;
T=1/f;
t=0:0.001:1;
y=sin(2*pi*f*t);
subplot(4,2,1);
plot(t,y);
title('input signal with f=4Hz');
xlabel('time');
ylabel('Amplitude');

%sampling
fs1=8;       %sampling freq. fs1=2*f=8Hz
Ts1=1/fs1;
ts1=0:Ts1/2:1;
ys1=sin(2*pi*f*ts1);
subplot(4,2,3);
stem(ts1,ys1);
title('Sampled signal with Fs=8Hz-Perfect sampling');
xlabel('Samples');
ylabel('Amplitude');
%Reconstruction
t_new=linspace(0,1,1000);
ys1_recons=interp1(ts1,ys1,t_new,'spline');
subplot(4,2,4);
plot(ts1,ys1,'o',t_new,ys1_recons,'-','linewidth',1.5);
title('Reconstructed signal-Perfect sampling')

fs2=12;                 %sampling freq. >2*f
Ts2=1/fs2;
ts2=0:Ts2/2:1;
ys2=sin(2*pi*f*ts2);
subplot(4,2,5);
stem(ts2,ys2);
title('Sampled signal with Fs=12Hz-Over sampling');
xlabel('Samples');
ylabel('Amplitude');
%Reconstruction
t_new=linspace(0,f*T,(f*T)/0.001);
ys2_recons=interp1(ts2,ys2,t_new,'spline');
subplot(4,2,6);
plot(ts2,ys2,'o',t_new,ys2_recons,'-','linewidth',1.5);
title('Reconstructed signal-Over sampling')

fs3=5;
Ts3=1/fs3;
ts3=0:Ts3/2:1;
ys3=sin(2*pi*f*ts3);
subplot(4,2,7);
stem(ts3,ys3);
title('Sampled signal with Fs=5Hz-Under sampling');
xlabel('Samples');
ylabel('Amplitude');
%Reconstruction
ys3_recons=interp1(ts3,ys3,t_new,'spline');
subplot(4,2,8);
plot(ts3,ys3,'o',t_new,ys3_recons,'-','linewidth',1.5);
title('Reconstructed signal-Under sampling');

figure
subplot(3,1,1)
plot(ts1,abs(fft(ys1)))
axis([-4 4 0 10])
title("spectral analysis of perfect sampling signal")

subplot(3,1,2)
plot(ts2,abs(fft(ys2)))
axis([-2 2 0 12])
title("spectral analysis of over sampling signal")

subplot(3,1,3)
plot(ts3,abs(fft(ys3)));
axis([-2 2 0 10])
title("spectral analysis of under sampling signal")