%Direc_butt_disig 
%20ES053    Lab_14
%Example#03
n=3; 
T=0.03; 
wc=3; 
w=-5:0.1:5; 
wz=w*T; 
[Pz,Qz]=butter(n,wc*T/pi); 
[magz,phasez]=freqz(Pz,Qz,wz/pi); 
subplot(1,2,1) 
plot(wz,magz) 
title('Mag. of digital LPF'); 
axis([-5 5 0.4 1.1]); 
xlabel('w in rad') 
ylabel('magnitude') 
subplot(1,2,2) 
plot(wz,phasez*180/pi); 
title('Phase of digital LPF vs w') 
xlabel('w in rad') 
ylabel('phase in degrees')