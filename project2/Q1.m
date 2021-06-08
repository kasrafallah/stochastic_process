clc;
clear;
figure;
[time,out] = poisoin(10,60);
stairs(time/3600,out);
grid on;grid minor;
xlabel('t(min)');ylabel('m(t)');
title('a realization of this process in the Landa 10 and the time of 60 minutes ');
%%
m = zeros(50,60*3600);
for i = 1:150
    m(i,1) = 0;
end
i
tic
for j = 1:150
    for i =2:length(m)
        [a,b] = poisoin(10,1/3600);
        m(j,i) = m(j,i-1)+b - calltime(0.1,m(j,i-1));
    end
    j
    toc
end
mean = sum(m,1)/100;
figure;
t = 0:1/3600:60;
t = t(1:end-1);
stairs(t,mean)
grid on;grid minor;
xlabel('t(min)');ylabel('M(t)');
title('mean of 150 realization of this M(t) process in the Landa 10 & 0.1 and the time of 90 minutes ');
function [time,out] = poisoin(lambda,t)
precition = lambda/3600;
time = 0:1:t*3600;
time = time(1:end -1);
out = cumsum(poissrnd(precition,t*3600,1));
poissrnd(precition);
end

function [out] = calltime(lambda,number)
precition = lambda/3600;
out = sum(poissrnd(precition,number,1));
end