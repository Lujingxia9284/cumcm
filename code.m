clear ,clc 
syms t time
 t0 = 0.850;
 p0 = 100;
 p = 160;
 
% E = 1489*exp(0.00284 *p)+48.79*exp(0.01376*p);
E = 2786.4;

t1=solve((p-p0)*t-(t-t0)*E==0,t);
t1 = double(t1); %油泵处密度
t2 = 0.85;   %喷油嘴处密度
m = t2*44;
delta_p = p-p0;
V1 = m/t1;%油泵处体积
Q= 0.85*0.7*0.7*pi*sqrt(2*delta_p/t1);
% time = 100/(V1/Q)-10;
time = solve(100/(time+10)*time*Q-V1==0,time)
double(time)



%一个周期为100ms

% Q = 0.85*0.7*0.7*pi*sqrt(2*60/0.85) 