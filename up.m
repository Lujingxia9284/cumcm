syms t
% delta_p = 2.5;%一个周期内均匀增加的压强
t0 = 0.850;
p0 = 100;%初始值
% e = 1489*exp(0.00284 *p)+48.79*exp(0.01376*p);
rou_160 = solve((160-100)*t-(t-0.85)*2786.4==0,t); %160MPa下的密度
p_2s = linspace(100,150,21); %气压取值
p_5s = linspace(100,150,51); %气压取值
p_10s = linspace(100,150,101); %气压取值
E_2s= zeros(1,length(p_2s));
rou_2s=zeros(1,length(p_2s)); %每次变化的密度
E_5s= zeros(1,length(p_5s));
rou_5s=zeros(1,length(p_5s)); %每次变化的密度
E_10s= zeros(1,length(p_10s));
rou_10s=zeros(1,length(p_10s)); %每次变化的密度
V_tube = pi*5*5*500;%管的体积
V_out = 88;%一个周期内喷出的体积

% time = zeros(1,length(p)-1);
for i = 1:length(p_10s) %
    for j = 1:401
        if p_10s(i) ==p_all(j)%
            E_10s(i) = E_all(j);%
            rou_10s(i) = rou_all(j);%
        end
    end
    
end
for i = 1:length(p_5s) %
    for j = 1:401
        if p_5s(i) ==p_all(j)%
            E_5s(i) = E_all(j);%
            rou_5s(i) = rou_all(j);%
        end
    end
    
end

for i = 1:length(p_2s) %
    for j = 1:401
        if p_2s(i) ==p_all(j)%
            E_2s(i) = E_all(j);%
            rou_2s(i) = rou_all(j);%
        end
    end
    
end


% 
% 
% for j = 1:20 %
%     rou = rou_2s(j);%
%     p = 150; %
%     delta_rou = 0;
%     delta_p = 0;
%     
% end
  p=100; rou=0.85 
 for i = 1:10000
        
    delta_t = 0.01;
    Q_ru = double(0.85*0.7*0.7*pi*sqrt(2*(160-p)/rou_160));
  
    Q_chu = double(0.85*0.7*0.7*pi*sqrt(2*p/rou));

    E = double(1489*exp(0.00284 *p)+48.79*exp(0.01376*p));
    if i<240%
        delta_rou = double((rou_160*Q_ru*delta_t-rou*Q_chu*delta_t*2)/V_tube);
    else
        delta_rou = rou_160*Q_ru*delta_t/V_tube;
    end
    delta_p = double(delta_rou*E/rou);
    rou = double(rou +delta_rou);
    p = p+delta_p
    if p>100   %
        time_100=i %
        break
    end
end


% xlswrite('data.xls',time_2s');
% xlswrite('data.xls',time_5s');
% xlswrite('data.xls',time_10s');
% xlswrite('data.xls',time_2s_001');

     
    
    




