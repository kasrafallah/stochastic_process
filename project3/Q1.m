clc;
clear;
M = csvread('rescueMission.csv');
t_main = M(:,1);
Xr = M(:,2);
w = 2*pi*2000;
k = 1;
T = 1/2000;
for i = 1:150:75000
    xr = Xr(i : i + 149);
    t = t_main(i : i + 149);
    x = xr;
    xc = hilbert(x);
    xcref = hilbert(cos(w*t));
    Phase(k) = mean(angle(xc.*conj(xcref)));
    k = k+1;
end
k = 1;c = 1;
for i = 1: 150:75000
    xr = Xr(i : i + 149);
    t = t_main(i : i + 149);
    h = cos(w*(T-t)- 2*pi*(k));
    Y = conv(h,xr,'full');
    z(k) = (Y(150)^2/(sum(xr.^2)))*(2/T)*(t_main(end)/length(t_main));
    if z(k) >0.8
        index = k;
        c = c+1;
    end
    k = k+1;
end
close all;


figure;
stem(z)
title('finding signal')
xlabel('n');ylabel('z');
grid on; grid minor;
text(index,z(index),'\leftarrow Optimal wave', "color",'red')
%part5
figure;
plot(t_main,Xr)
hold on
for i = 1:1:length(index)
    xr = Xr((index-1)*150 : 150*(index-1) + 149);
    t = t_main(150*(index-1) : 150*(index-1) + 149);
    plot(t,xr,'r')
end
grid on; grid minor;
legend('recieved signal','finded')
%part6
d = t_main(index*150)*1200/2;
disp(['distance is ',num2str(d),' m'])

%part7
xr = Xr((index-1)*150+1 : 150*(index-1) + 150);
t = t_main(150*(index-1)+1 : 150*(index-1) + 150);
x = xr;
xc = hilbert(x);
xcref = hilbert(cos(w*t));
Phase = mean(angle(xc.*conj(xcref)));
figure
plot(t,xr,'r')
hold on;
plot(t,8*cos(w*t+Phase))
k =1;
max =0;
for omega = 0.8*w:0.01*w:1.2*w
    x = xr;
    xc = hilbert(x);
    xcref = hilbert(cos(omega*t));
    Phase = mean(angle(xc.*conj(xcref)));
    h = cos(omega*(T-t)-Phase);
    Y = conv(h,xr,'full');
    a(k) = (Y(150)^2/(sum(xr.^2)))*(2/T)*(t_main(end)/length(t_main));

    if a(k) > max
        max = a(k);
        omega_max = omega;
    end
    k = k+1;
end
figure;
plot(0.8:0.01:1.2,a)
hold on;
plot(0.8:0.01:1.2 , ones(1, length(a)),'r')
title('finding omega')
xlabel('omega(W0)');ylabel('z');
grid on; grid minor;
legend('Ksi', 'tereshold')
figure
x = xr;
xc = hilbert(x);
xcref = hilbert(cos(omega_max*t));
Phase = mean(angle(xc.*conj(xcref)));
plot(t,xr,'r')
hold on;
plot(t,8.5*cos(omega_max*t+Phase))
k =1;
grid on ;grid minor;
legend('real signal','signal that we generate with our program')

Vr = -(omega_max/w - 1)*1200;

disp(['Vr is ',num2str(Vr),' m/s'])
















