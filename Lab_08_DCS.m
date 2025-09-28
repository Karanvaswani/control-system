%20ES053
%Lab_08
clc; clearvars;
m = 1;
b = 10;
k = 20;
A = [0 1;-k/m -b/m];
B = [0;1/m];
C = [1 0];
D = 0;
Ts = 1/100;
sys = ss(A,B,C,D);
sys_d = c2d(sys,Ts,'zoh');

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%20ES053    %Lab_08 Example#01
a1 = [1 3; 2 5]; 
b1 = [0; 1]; 
c1 = [1 2];
d1 = 0; 
a2 = [-4 0; 0 3]; 
b2 = [1; 0]; 
c2= [3 0]; 
d2 = 0; 
a3 = [3 2; 1 0]; 
b3 = [1; 1]; 
c3= [1 1]; 
d3 = 0; 
[numg1, deng1] = ss2tf(a1,b1,c1,d1); 
[numg2, deng2] = ss2tf(a2,b2,c2,d2); 
[numh, denh] = ss2tf(a3,b3,c3,d3); 
[numf, denf] = feedback(numg1,deng1,numh,denh); 
[nums, dens] = series(numf,denf,numh,denh); 
printsys(nums,dens);

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%20ES053        %Example#02 Lab_08
H = tf([1 -1],[1 4 5],'InputDelay', 0.3); 
Hd = c2d(H,0.1,'foh'); 
step(H,'-',Hd,'--');

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%20ES053    Example#03  Lab_08
h = tf(10,[1 3 10],'IODelay',0.25);
hd = c2d(h,0.1);
step(h,'--',hd,'-')

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%20ES053    Example#04  Lab_08
A = [0 1;-1 -2];
B = [0;1];
C = [1 1];
D = 0;
sys_c = ss(A,B,C,D); %creates/stores continuous-time state-space model 
ts=1; 
sys_d=c2d(sys_c,ts,'zoh'); % gives discrete-time state-space model 

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%20ES053    Example#05 Lab_08
A = [ 0 1 0 ; 980 0 -2.8 ; 0 0 -100 ];
B = [ 0; 0 ;100 ];
C = [ 1 0 0 ];
Poles= eig(A);
t = 0:0.01:2;
u = zeros(size(t)); x0 = [0.01 0 0];
sys = ss(A,B,C,0);
[y,t,x] = lsim(sys,u,t,x0); plot(t,y)
title('Open-Loop Response to Non-Zero Initial Condition') 
xlabel('Time (sec)')
ylabel('Ball Position (m)')

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%20ES053    Lab_09 
A = [-5 -1; 3 -1];
B = [1; 0];
C = [1 2];
D = 0;
Ts = 1/100;
sys = ss(A,B,C,D,Ts);
LengthofA = length(sys.A);
s = ctrb(sys);
rankofs = rank(s);
v = obsv(sys);
rankofv = rank(v);

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%20ES053    Lab_10
num = [1 2.05 13];
den = [1 5.9 2 17];
Gs = tf(num,den);
bode(Gs);
grid 

H = tf([1 2.05 13],[1 5.9 2 17]);
Hd = c2d(H,0.5,'zoh');
bode(H,Hd)

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%20ES053 
%Example#01
num = [2];  % Numerator
den = [1 1];% Denominator 
G = tf(num, den) % Transfer Function
% Plot Frequency Response 
bode(G), grid

%Example#02
H = tf([1 0.1 7.5],[1 0.12 9 0 0]); 
bode(H)

%Example#03
H = tf([-0.1,-2.4,-181,-1950],[1,3.3,990,2600]); 
bode(H,{1,100}) 
grid on

%Example#04
w = [1 5 10 15 20 23 31 40 44 50 85 100]; 
figure(2)
bode(H,w,'.-') 
grid on

%Example#05
H = tf([1 0.1 7.5],[1 0.12 9 0 0]); 
Hd = c2d(H,0.5,'zoh'); 
bode(H,Hd)

%Example#06
H = tf([1 0.1 7.5],[1 0.12 9 0 0]); 
Hd = c2d(H,0.5,'zoh');
figure(2)
bode(H,'r',Hd,'b--')

%Example#07
win = logspace(-2,2,5) 
[mag,phase,wout] = bode(G,win); 
size(wout)
size(mag) 
size(phase)
