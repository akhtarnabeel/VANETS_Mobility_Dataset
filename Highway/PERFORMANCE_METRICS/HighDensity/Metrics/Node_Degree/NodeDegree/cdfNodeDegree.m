%cdfNodeDegree

clear all;
clc;

load All_Neg_Data_Unit.mat

%%{
load All_Neg_Data_Log_C.mat
All_Nodes_L500_C = All_Nodes_L500;
All_Nodes_L100_C = All_Nodes_L100;
%%}

load All_Neg_Data_Log.mat

load All_Neg_Data_Obs.mat

disp('files loaded...');

for time = 1000 : 1: 1798
    time
    %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
    all_veh_T_U100 = All_Nodes_U100{time,1};
    N_t_U100 = size(all_veh_T_U100,1);
    size_U100 = zeros(1,N_t_U100);
    for i = 1 : N_t_U100
        size_U100(1,i) = size(all_veh_T_U100{i,2},2);
    end    
    
    all_veh_T_U500 = All_Nodes_U500{time,1};
    N_t_U500 = size(all_veh_T_U500,1);
    size_U500 = zeros(1,N_t_U500);
    for i = 1 : N_t_U500
        size_U500(1,i) = size(all_veh_T_U500{i,2},2);
    end    
    
    %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%    
    all_veh_T_L100 = All_Nodes_L100{time,1};
    N_t_L100 = size(all_veh_T_L100,1);
    size_L100 = zeros(1,N_t_L100);
    for i = 1 : N_t_L100
        size_L100(1,i) = size(all_veh_T_L100{i,2},2);
    end        
    
    all_veh_T_L500 = All_Nodes_L500{time,1};
    N_t_L500 = size(all_veh_T_L500,1);
    size_L500 = zeros(1,N_t_L500);
    for i = 1 : N_t_L500
        size_L500(1,i) = size(all_veh_T_L500{i,2},2);
    end    
    
    %%{
    
    %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%    
    all_veh_T_L100_C = All_Nodes_L100_C{time,1};
    N_t_L100_C = size(all_veh_T_L100_C,1);
    size_L100_C = zeros(1,N_t_L100_C);
    for i = 1 : N_t_L100_C
        size_L100_C(1,i) = size(all_veh_T_L100_C{i,2},2);
    end        
    
    all_veh_T_L500_C = All_Nodes_L500_C{time,1};
    N_t_L500_C = size(all_veh_T_L500_C,1);
    size_L500_C = zeros(1,N_t_L500_C);
    for i = 1 : N_t_L500_C
        size_L500_C(1,i) = size(all_veh_T_L500_C{i,2},2);
    end    
    
    %%}
    
    %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
    all_veh_T_O100 = All_Nodes_O100{time,1};
    N_t_O100 = size(all_veh_T_O100,1);
    size_O100 = zeros(1,N_t_O100);
    for i = 1 : N_t_O100
        size_O100(1,i) = size(all_veh_T_O100{i,2},2);
    end    
      
    all_veh_T_O500 = All_Nodes_O500{time,1};
    N_t_O500 = size(all_veh_T_O500,1);
    size_O500 = zeros(1,N_t_O500);
    for i = 1 : N_t_O500
        size_O500(1,i) = size(all_veh_T_O500{i,2},2);
    end    
        
end


figure
hold on;
box on;
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

U100 = cdfplot(size_U100);
U500 = cdfplot(size_U500);
set(U100,'color','b','LineStyle','-','Marker','o','LineWidth',1)
set(U500,'color','b','LineStyle',':','Marker','o','LineWidth', 2)

xdata = get(U100,'XData');
ydata = get(U100,'YData');
set(U100,'XData',xdata(1:2:end));
set(U100,'YData',ydata(1:2:end));

xdata = get(U500,'XData');
ydata = get(U500,'YData');
set(U500,'XData',xdata(1:3:end));
set(U500,'YData',ydata(1:3:end));



%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

L100 = cdfplot(size_L100);
L500 = cdfplot(size_L500);
set(L100,'color','g','LineStyle','-','Marker','*','LineWidth',1)
set(L500,'color','g','LineStyle',':','Marker','*','LineWidth', 2)

xdata = get(L100,'XData');
ydata = get(L100,'YData');
set(L100,'XData',xdata(1:2:end));
set(L100,'YData',ydata(1:2:end));

xdata = get(L500,'XData');
ydata = get(L500,'YData');
set(L500,'XData',xdata(1:3:end));
set(L500,'YData',ydata(1:3:end));



%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

%%{

%% log classical

L100_C = cdfplot(size_L100_C);
L500_C = cdfplot(size_L500_C);
set(L100_C,'color','m','LineStyle','-','Marker','^','LineWidth',1)
set(L500_C,'color','m','LineStyle',':','Marker','^','LineWidth', 2)

xdata = get(L100_C,'XData');
ydata = get(L100_C,'YData');
set(L100_C,'XData',xdata(1:2:end));
set(L100_C,'YData',ydata(1:2:end));

xdata = get(L500_C,'XData');
ydata = get(L500_C,'YData');
set(L500_C,'XData',xdata(1:3:end));
set(L500_C,'YData',ydata(1:3:end));

%%}


%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

%set(h,'color','r')
O100 = cdfplot(size_O100);
O500 = cdfplot(size_O500);
set(O100,'color','r','LineStyle','-','Marker','s','LineWidth',1)
set(O500,'color','r','LineStyle',':','Marker','s','LineWidth', 2)

xdata = get(O100,'XData');
ydata = get(O100,'YData');
set(O100,'XData',xdata(1:2:end));
set(O100,'YData',ydata(1:2:end));

xdata = get(O500,'XData');
ydata = get(O500,'YData');
set(O500,'XData',xdata(1:3:end));
set(O500,'YData',ydata(1:3:end));


set(gca,'FontSize',12)



grid;

xlabel('Node Degree','FontSize',12);
ylabel('CDF','FontSize',12);
%title('Link Duration')
L = legend('Unit 100','Unit 500','Log_M 100', 'Log_M 500','Log_C 100', 'Log_C 500','Obs 100', 'Obs 500');
set(L,'FontSize',10);



