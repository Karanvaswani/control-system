%20ES053    Lab_14
%Example#01
x=rand(2,15); 
b=1; 
a=[1 -0.2]; 
y=filter(b,a,x,[],2); 
t=0:length(x)-1; %Index Vector 
plot(t,x(1,:)) 
hold on 
plot(t,y(1,:)) 
legend('Input Data','Filtered Data') 
title('First Row')

%20ES053    Lab_14
%Example#02
x=rand(2,15); 
b=1; 
a=[1 -0.2]; 
y=filter(b,a,x,[],2); 
t=0:length(x)-1; %Index Vector 
plot(t,x(1,:)) 
hold on 
plot(t,y(1,:)) 
legend('Input Data','Filtered Data') 
title('First Row') 
figure 
plot(t,x(2,:)) 
hold on 
plot(t,y(2,:)) 
legend('Input Data','Filtered Data') 
title('Second Row')