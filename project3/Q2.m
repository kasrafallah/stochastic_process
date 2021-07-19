
clc;
clear;
close all;
x = normrnd(0,1,[1,10000]);
b = 1;
a = [1 -0.6];
x = filter(b,a,x,2);
y = x + normrnd(0,1,[1,10000]);

plot(x)
legend('Input Data')
title('sample');grid on; grid minor;

h =[480/1456,144/1456];
k = 1;
for alfa = 0:0.001:1
    x_1 = 0;
    x_2 = 0;
    counter = 0;
    for n = 1:1:length(y)
        a(n) = alfa*y(n)+(1-alfa)*h*[x_1;x_2];
        x_2 = x_1;
        x_1 = y(n);
        if abs(a(n)) > 1
            counter = counter+1;
        end
      
        
    end
    pi_alfa(k)= counter/length(a);
    k = k+1;
%     close all
%     figure;
%     subplot(2,1,1)
%     plot(a)
%     subplot(2,1,2)
%     plot(x)
    c(k)= sqrt(sum((x-a).^2))/10000;
        
end
figure;

plot(0:0.001:1,pi_alfa)

counter = 0;
for i =1:1:length(x)
    if abs(x(i))>1
        counter = counter +1;
    end   
end

PI_REAL = counter/ length(x)

hold on;
plot(0:0.001:1,PI_REAL*ones(length(pi_alfa),1))
k = find(abs(pi_alfa-PI_REAL)<0.0005)
alpha = 0:0.001:1;
alpha_critical = alpha(k(1))
text(alpha_critical, PI_REAL,'alpha*{0.424}','Color','green','FontSize',10)
grid on;

%%
x_1 = 0;
x_2 = 0;
alpha = alpha_critical;
for n = 1:1:length(y)
    a(n) = alfa*y(n)+(1-alfa)*h*[x_1;x_2];
    x_2 = x_1;
    x_1 = y(n);    
    end
figure;
plot(x,'r')
hold on;
plot(a,'b')
grid on;grid minor;
title('part16');legend('X','Xc')