%Script file : inp_out
%20ES053    Lab_14
%Example#03
Pz=[0.0380 0.1141 0.1141 0.0380]; 
Qz=[1.000 -1.3445 0.8215 -0.172]; 
n=0:1:100; %Discrete Time Sequence 
T=0.3; 
input=2+cos(0.2*T.*n)+cos(4*T.*n); 
output=filter(Pz,Qz,input); 
t=0:0.05:8; 
inputa=2+cos(0.2.*t)+cos(4.*t); 
subplot(2,2,1) 
plot(t,inputa) 
xlabel('t in sec') 
ylabel('Amplitude') 
title('[x(t)=2+cos(0.2.*t)+cos(4.*t)] vs. t') 
axis([0 5 0 5]) 
subplot(2,2,2) 
plot(n*T,output) 
xlabel('t in sec') 
ylabel('Amplitude') 
title('y(t) vs. t') 
axis([0 8 0 4]) 
subplot(2,2,3) 
stem(n*T,input) 
xlabel('time index nT') 
ylabel('Amplitude') 
title('x(nT) vs. nT'); 
axis([0 5 0 5]) 
subplot(2,2,4) 
stem(n*T,output) 
xlabel('time index nT') 
ylabel('Amplitude') 
title('y(nT) vs. nT'); 
axis([0 8 0 4])