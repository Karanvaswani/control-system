clc;  clearvars;
s=tf('s'); 
csys=1/(1*(s+1));
csys_closed=feedback(csys,1) 
step(csys_closed)%cont: time step response 
hold on

dsys=c2d(csys,1,'zoh'); 
dsys_closed=feedback(dsys,1)
step(dsys_closed,'y')%discrete time step response without pid 
stepinfo(dsys_closed)%discrete time transient response ch.
%without pid 
hold on 

z=tf('z',1);
kp=1;
ki=0.2;
kd=0.3;
dpid=((kp+ki+kd)*z^2-(kp+2*kd)*z+kd)/(z^2-z) %pulse t/f of
%digital pid 
dsys_closed_pid=feedback(dpid*dsys,1)
step(dsys_closed_pid,'g')%discrete time step response with pid 
stepinfo(dsys_closed_pid)%discrete time transient response ch.
%with pid