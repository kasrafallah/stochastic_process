%%
clear
clc
close all
load('RTT.mat');
y=temp;
len = length(y);
l_new = ones( 1 , len );
l_new(1)=y(1);
alfa = 0.9;
for i = 2 : len
l_new(i) = alfa * l_new(i-1) + (1- alfa) * y(i);
end

figure;
plot(l_new,'r','LineWidth',1.8)
hold on;
plot(y,'b','LineWidth',0.5)
grid on;
grid on;grid minor;
title('RTT')
xlabel('n');ylabel('RTT');
legend('l^','y[n]');
%%
alfa= [0.1,0.2,0.3,0.4,0.5,...
    0.6,0.7,0.8,0.9];
for j=1:9
     for i=2:length(y)
        l_new(i) = alfa(j) * l_new(i-1) ...
            + ( 1 - alfa(j) ) * y(i);
     end
     mean = sum(l_new) / length(y);
     L(j)=sum((l_new - mean).^2) / length(y) ...
         + sum(( l_new - y).^2) / length(y);
end
figure;
plot(alfa,L)
hold on;
plot(alfa,L,'r*')
hold on;
plot(alfa,L(5)*ones(1,length(alfa)),'g--')
grid on;
grid on;grid minor;
title('cost function')
xlabel('alfa');ylabel('L');
legend('L','L_data','min line');
ylim([1150,1350])

%%
alfa= 0.5;
for i=2:length(y)
    l_new(i) = alfa * l_new(i-1) ...
            + ( 1 - alfa ) * y(i);
end
li1 = l_new(1 : length(l_new) -1);
li2 = l_new(2 : length(l_new) );
l_eq = li1 .* li2;

R = sum(l_eq) / length(l_new);
meany = sum(y)/length(y);
sigma = sum((y-meany).^2)/length(y);
var=(meany^2+sigma-R)*2*alfa/(1+alfa^2);
disp(var)




