random_walk = zeros(100,5)
for i = 2:100
    a = rand(1,5)
    random_walk(i,:) = random_walk( i-1,:)  -1*(a<0.5) +1*(a>0.5);    
end
figure;
subplot(5,1,1);
stairs(random_walk(:,1));
grid on ;grid minor; xlabel('n');ylabel('X[n]');
subplot(5,1,2);
stairs(random_walk(:,2),'r');
grid on ;grid minor; xlabel('n');ylabel('X[n]');
subplot(5,1,3);
stairs(random_walk(:,3),'c');
grid on ;grid minor; xlabel('n');ylabel('X[n]');
subplot(5,1,4);
stairs(random_walk(:,4),'k');
grid on ;grid minor; xlabel('n');ylabel('X[n]');
subplot(5,1,5);
stairs(random_walk(:,5),'g');
grid on ;grid minor; xlabel('n');ylabel('X[n]');
%%
random_walk = zeros(100,100);
for i = 2:100
    a = rand(1,100);
    random_walk(i,:) = random_walk( i-1,:)  -1*(a<0.5) +1*(a>0.5);    
end
mean = sum(random_walk,2)/100;
var_ran = var(random_walk,0,2);
figure;
subplot(2,1,1)
plot(mean)
grid on ;grid minor; xlabel('n');ylabel('mean{X[n]}');
subplot(2,1,2)
plot(var_ran)
grid on ;grid minor; xlabel('n');ylabel('Var{X[n]}');

%%
random_walk = zeros(100,5000);
for i = 2:100
    a = rand(1,5000);
    random_walk(i,:) = random_walk( i-1,:)  -1*(a<0.5) +1*(a>0.5);    
end
k = 0
for i = 1:5000
    if random_walk(100,i)< 8
        k = k + 1;
    end
end
k/5000


