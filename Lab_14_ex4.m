%Script file : cheby_HPF 
%20ES053    Lab_14
%Example#04
N=3; 
Rp=2; 
Rs=3; 
T=0.3; 
Wc=0.5; 
Wz=-2*pi:0.01*pi:3*pi; 
wzc=Wc*T/pi; 
[Pz1,Qz1]=cheby1(N,Rp,wzc,'high'); 
disp('*******************************************') 
disp('***************R E S U L T S***************') 
disp('*******************************************') 
disp('For the transfer function H(z) of the Chebytype1 HPF') 
disp('the numerators coefficients are:') 
disp(Pz1) 
disp('the denominator coefficients are:') 
disp(Qz1) 
[Pz2,Qz2]=cheby2(N,Rs,wzc,'high'); 
disp('For the trasnfer function H(z) of the Chebytype2 HPF') 
disp('the numerators coefficients are:') 
disp(Pz2) 
disp('the denominator coefficients are:') 
disp(Qz2) 
disp('*******************************************') 
[mag1,phase1]=freqz(Pz1,Qz1,Wz); 
[mag2,phase2]=freqz(Pz2,Qz2,Wz); 
subplot(2,2,1) 
plot(Wz,mag1) 
title('Mag of Cheby type1 HPF') 
axis([0 5 0 1.1]); 
xlabel('W in rad') 
ylabel('Magnitude') 
subplot(2,2,2)
plot(Wz,phase1*180/pi) 
title('Phase of Cheby type1 HPF') 
xlabel('W in rad') 
ylabel('Angle in degrees') 
subplot(2,2,3) 
plot(Wz,mag2) 
title('Mag of Cheby type2 HPF') 
axis([0 1 0 1.5]); 
xlabel('W in rad') 
ylabel('Magnitude') 
subplot(2,2,4) 
plot(Wz,phase2*180/pi) 
title('Phase of Cheby type2 HPF') 
xlabel('W in rad') 
ylabel('Angle in degrees') 
disp('**********FILTERS TRANSFER FUNCTIONS***********') 
disp('***********************************************') 
disp('Chebyshev type 1') 
tf(Pz1,Qz1,T) 
disp(' -') 
disp('Chebyshev type 2') 
tf(Pz2,Qz2,T) 
disp('***********************************************')