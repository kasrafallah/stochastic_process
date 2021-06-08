load("Q2_DATA.csv");
format long
a = Q2_DATA;
time = a(:,1);
x = a(:,2);
plot(time,x)
xlim([0,4*10^-6])
%zero_crossing
zero_crossing(1) = 0;
k = 2;
for i = 2: length(x)
    if x(i)<0
        if x(i-1)>0
            zero_crossing(k) = time(i);
            k =k+1;
        end 
    end
    if x(i)>0
        if x(i-1)<0
            zero_crossing(k) = time(i);
            k =k+1;
        end 
    end
end
hold on;
stem(zero_crossing,ones(1,length(zero_crossing))*2,'r.')
xlim([0,4*10^-7])
mean_length_of_pulse = sum(diff(zero_crossing))...
    /length(diff(zero_crossing))

lambda_est = 1/mean_length_of_pulse

lambda_est = 145/time(end)

%%
dt = diff(time(1:843));
xave = x(1:842);
a = dt.*xave;

integration = sum(a)/time(843)

lambda = (1-integration)/(2*time(843))

syms f(x)
f(x) = ((1-exp(-x))/x)-integration;
sol = vpasolve(f)
lambda = sol/(2*time(843))
