%Open Ended Task#01
%20ES059
Roll_no = 59;
G_cont = tf(1, [1,Roll_no]);
Ts_val = [0.1,0.3,0.5];
subplot(211)
step(G_cont)
title('Continuous Time Step Response of system')
xlabel('Time')
ylabel('Amplitude')
subplot(212)
hold on;
for i = 1:length(Ts_val)
    Ts = Ts_val(i);
    G_discrete = c2d(G_cont, Ts, 'zoh');
    [y,t] = step(G_discrete);
    plot(t,y,'LineWidth', 1.5);
end
hold off;
xlabel('Time')
ylabel('Amplitude')
title('Discrete-Time Step Response for different sampling times');
legend('Ts = 0.1', 'Ts = 0.3', 'Ts = 0.5');


%Open Ended Task#02
%20ES059
clc; clearvars;
syms z n 
ztrans((1/59)^n)
num = [1 0];
den = [1 -1/5.9];
zplane(num,den)
transfer_func = tf(num, den, -1);
disp('Pulse Transfer Function H(z):')
disp(transfer_func)
%Checking Stability
its_stable = all(abs(roots(den)) <1 );
if its_stable
    disp('The system is stable')
else
    disp('The system is unstable')
end





%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%Open Ended Task#03
%20ES059
A = [0 1; -5 -5];
b = [0; 1];
C = [1 0];
D = 0;
roll_no = 59;   %My Roll Number is 20ES053
B = b * roll_no;
sys = ss(A,B,C,D);
t = 0:0.1:10;
u = ones(size(t));
[y, ~, ~] = lsim(sys, u, t);
figure;
plot(t, y)
xlabel('Time');
ylabel('Output(y)')
title('System Response to a Unit Step Input');

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%Open Ended Task#04
%20ES059
Co = ctrb(sys);
Obs = obsv(sys);
disp('Controllability Matrix');
disp(Co);
disp('Observability Matrix');
disp(Obs);
B1 = B * roll_no;
sys_modified = ss(A,B1,C,D);
Co_modified =  ctrb(sys_modified);
Obs_modified = obsv(sys_modified);
disp('Modified Controllability Matrix');
disp(Co_modified);
disp('Modified Observability Matrix')
disp(Obs_modified)
its_controllable = rank(Co_modified) == size(A, 1);
its_Observable = rank(Obs_modified) == size(A, 1);

disp(['Modified System is Controllable :', num2str(its_controllable)]);
disp(['Modified System is Observable :', num2str(its_Observable)]);