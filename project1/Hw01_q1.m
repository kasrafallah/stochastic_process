%%
clc; clear;close all;
x=wgn(1,1000000,0);
y = filter([1,0.3,-0.5],[1],x);
[acf,lags] = xcorr(y,y);
figure;
stem(lags,acf/1000000,'b','LineWidth',2)
xlim([-10,10])
grid on;grid minor;
title('Ryy[m]')
xlabel('m');ylabel('Ryy[m]');
% for part c must be uncommented
hold on;
stem([-2,-1,0,1,2],[-0.5,.15,1.34,0.15,-0.5],'r')
xlim([-10,10])
grid on;grid minor;
title('Ryy[m]')
xlabel('m');ylabel('Ryy[m]');
legend('matlab','theory');


[acf,lags] = xcorr(x,y);
figure;
stem(lags,acf/1000000,'b','LineWidth',2)
xlim([-10,10])
grid on;grid minor;
title('Rxy[m]')
xlabel('m');ylabel('Rxy[m]');

% for part c must be uncommented
hold on;
stem([-2,-1,0],[-0.5,.3,1],'r')
xlim([-10,10])
grid on;grid minor;
title('Ryy[m]')
xlabel('m');ylabel('Ryy[m]');
legend('matlab','theory');

%%
clc; clear;
x=wgn(1,1000000,0);
y = filter([1],[1,-0.7,0.1],x);
[acf,lags] = xcorr(y,y);
figure;
stem(lags,acf/1000000,'LineWidth',2)
xlim([-10,10])
grid on;grid minor;
title('Ryy[m]')
xlabel('m');ylabel('Ryy[m]');
% for part c must be uncommented
hold on;
m =  linspace(-10,10,21);
b =  -0.772 *(0.2).^m.*(heaviside(m))+ 2.469*(0.5).^m.*(heaviside(m))+...
    (2.469.*(0.5).^(-m) .*heaviside(-m ) - 0.772.*(0.2).^(-m)  .*heaviside(-m ));
stem(m, b,'r')
xlim([-10,10])
grid on;grid minor;
title('Ryy[m]')
xlabel('m');ylabel('Ryy[m]');
legend('matlab','theory');



[acf,lags] = xcorr(x,y);
figure;
stem(lags,acf/1000000,'LineWidth',2)
xlim([-10,10])
grid on;grid minor;
title('Rxy[m]')
xlabel('m');ylabel('Rxy[m]');

% for part c must be uncommented
hold on;
m =  linspace(-10,10,21);
b = ( 5/3 .* (0.5).^(-m) -2/3 .* (0.2).^(-m) ).*heaviside(1-m);
stem(m, b,'r')
xlim([-10,10])
grid on;grid minor;
title('Ryy[m]')
xlabel('m');ylabel('Ryy[m]');
legend('matlab','theory');


%%
clc; clear;
x=wgn(1,1000000,0);
y = filter([1,0.2],[1,-0.7],x);
[acf,lags] = xcorr(y,y);
figure;
stem(lags,acf/1000000,'LineWidth',2)
xlim([-10,10])
grid on;grid minor;
title('Ryy[m]')
xlabel('m');ylabel('Ryy[m]');

% for part c must be uncommented
hold on;
m =  linspace(-10,10,21);
b = ( 5/3 .* (0.5).^(-m) -2/3 .* (0.2).^(-m) ).*heaviside(-m);
stem(lags, acf/1000000,'r')
xlim([-10,10])
grid on;grid minor;
title('Ryy[m]')
xlabel('m');ylabel('Ryy[m]');
legend('matlab','theory');



[acf,lags] = xcorr(x,y);
figure;
stem(lags,acf/1000000,'LineWidth',2)
xlim([-10,10])
grid on;grid minor;
title('Rxy[m]')
xlabel('m');ylabel('Rxy[m]');
% for part c must be uncommented
hold on;
m =  linspace(-10,10,21);
b = 9/7.*(0.7).^(-m).* heaviside(1-m);
b(12) = 0;
b(11) = b(11)-2/7;
stem(m, b,'r')
xlim([-10,10])
grid on;grid minor;
title('Rxy[m]')
xlabel('m');ylabel('Rxy[m]');
legend('matlab','theory');