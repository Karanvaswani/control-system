%20ES053
%Lab#07
n = 0:1:15;
wave = sin(2*pi*0.064*n);
yzero = zeros(1,100);
stem(n,wave)
hold on 
stairs(n,wave)
figure(2)
a = interp(wave,4);
b = 0:16*4-1;
stem(b,a(1:64))
hold on 
plot(b,a(1:64),b,yzero(1:64))

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%20ES053
n = 0:1:15;
wave = sin(2*pi*0.064*n);
yzero = zeros(1,100);
a = interp(wave,4);
b = 0:16*4-1;
h = ones(1,1);
z = filter(h,1,a);
stem(b,a,'--.')
hold on 
stairs(b,a)