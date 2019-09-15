% p0 = 0.5;
clear
v0 = 20+4.8260; %在最低点时的体积
% rou0 = rou_all(1);
% w =0.6064;
% w =0.4489609;
w =3.65;
% w = 0.88888
delta_t = 0.1;
t = 0;%当前时间
rou = 0.804517;
p = 0.5;
v = 20+4.8260; 
s = pi*2.5*2.5;%油泵横截面积
A = pi*0.7*0.7;
m_all = 0;%进油的质量 一次开启
M_all = 0;
% m_B = pi*2.5*sin(9/180*pi)*0.85*sqrt(2*100/0.85)*3.67;%第二题
% m_B =
% 0.85*0.85*sqrt(2*100/0.85)*(0.7*0.7*pi*(2.1-0.35)+pi*2.5*sin(9/180*pi)*0.204414)*2;%第三题第一问
m_B = 0.85*0.85*pi*0.7*0.7*sqrt(200/0.85);
% for k =1:4
    
  for i = 1:1000
    v_t = 20+(7.239-(2.413*cos(w*t+pi)+4.826))*pi*2.5*2.5 ;%w*t初值？？？
    v_plus = 20+(7.239-(2.413*cos(w*(t+delta_t)+pi)+4.826))*s;
    rou_plus = rou*v_t/v_plus;
    delta_rou = rou_plus - rou;
    delta_p = delta_rou*(1489*exp(0.00284 *p)+48.79*exp(0.01376*p))/rou;
    p_plus = p + delta_p;
    p
    if p>100
        
        time_1 = t;
        break
     end   %临界值
    rou = rou_plus;
    t = t+delta_t;
    p = p_plus;
  end
    
 
    rou = rou_plus;
    t = t+delta_t;
    p = p_plus;
 
     for j =1:1000000
        E = 1489*exp(0.00284 *p)+48.79*exp(0.01376*p);
        delta_rou = (rou*0.85*A*sqrt(2*(p-100)/rou)+rou*s*2.413*w*sin(w*t+pi))*delta_t/v_t;
        delta_p = delta_rou*E/rou;
        Q = 0.85*A*sqrt(2*(p-100)/rou);
        delta_m = Q*delta_t*rou;
        rou_plus = rou + delta_rou;
        p_plus = p+delta_p;
        p
        if p<100
            time_2 = t;
            break
        end
        rou = rou_plus;
        p = p_plus;
        m_all= m_all+delta_m;
        t = t + delta_t;
     end
%      M_all = M_all+m_all;
%  M_all = w*100/(2*pi)*m_all;
M_all = m_all*w;

 
open_time = 65.2782/17.0025*2*pi/w
 
 
 
 
 
 
 
 
 
 
