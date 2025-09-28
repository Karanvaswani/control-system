%20ES053    Lab_13
%Example_01
wm = 4.5;
alpha = 0.3;
T = 1/(wm*sqrt(alpha)); 
k= 10;
gnum = [k]; gden = [1 1 0];
uncompensated = tf(gnum,gden) 
cnum = [T 1]; cden = [T*alpha 1];
compensator = tf(cnum,cden) 
numo = conv(cnum,gnum); deno = conv(cden,gden);
compensated = tf(numo,deno) 
bode(uncompensated,'r',compensated ,'g') 
uncomtr=feedback(uncompensated,1)
comtr=feedback(compensated,1) 
step(uncomtr,'y') 
hold on 
step(comtr,'b')

%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%20ES053    Example#02
G=tf(1, [1 1 0])
z= 8.0501
k= 4.472
C=tf(k*[1 z],[1]) 
T=feedback(C*G,1) 
step(T)
sisotool(G)

%%%%%%%%%%%%%%%%%%%%%%%%
%20ES053    Example#03
Gv = tf(0.02,[4 1]); G1 = tf(70,[50 1]); H = tf(1,[12 1]);
Gc = tf(1); % dummy static gain

Gol = Gc*Gv*G1; % Openloop: I'm assuming Gp = G1 
Gcl = feedback(Gol,H); % closed loop

step(Gcl) % look at the response
stepinfo(Gcl) % extract key data for your design

