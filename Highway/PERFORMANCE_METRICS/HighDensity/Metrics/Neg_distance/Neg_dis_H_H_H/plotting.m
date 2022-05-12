% plotting 
clear all;
clc;

%{

load All_Neg_Data_Unit;
All_Nodes_U500;

%%{
load All_Neg_Data_Log_C;
All_Nodes_L500_C = All_Nodes_L500;
All_Nodes_L100_C = All_Nodes_L100;
%%}

load All_Neg_Data_Log;
All_Nodes_L500;

load All_Neg_Data_Obs;
All_Nodes_O500;

time = 1005;

counter_dis_unit_500 = 0;
distance_unit_500 = zeros(4000*4000,1);

counter_dis_log_500 = 0;
distance_log_500 = zeros(4000*4000,1);
%%{
counter_dis_log_500_C = 0;
distance_log_500_C = zeros(4000*4000,1);
%%}

counter_dis_obs_500 = 0;
distance_obs_500 = zeros(4000*4000,1);

counter_dis_unit_100 = 0;
distance_unit_100 = zeros(4000*4000,1);

counter_dis_log_100 = 0;
distance_log_100 = zeros(4000*4000,1);

%%{
counter_dis_log_100_C = 0;
distance_log_100_C = zeros(4000*4000,1);
%%}

counter_dis_obs_100 = 0;
distance_obs_100 = zeros(4000*4000,1);

counterTime = 0;

while time < 1799
    time
    veh_data_T_U100 = All_Nodes_U100{time,1};
    veh_data_T_U500 = All_Nodes_U500{time,1};
    
    veh_data_T_L500 = All_Nodes_L500{time,1};
    veh_data_T_L100 = All_Nodes_L100{time,1};
    
    %%{
    veh_data_T_L500_C = All_Nodes_L500_C{time,1};
    veh_data_T_L100_C = All_Nodes_L100_C{time,1};
    %%}
    
    veh_data_T_O100 = All_Nodes_O100{time,1};
    veh_data_T_O500 = All_Nodes_O500{time,1};
    
    idArray_U500 = zeros(size(veh_data_T_U500,1),1);
    idArray_U100 = zeros(size(veh_data_T_U100,1),1);
    
    idArray_L500 = zeros(size(veh_data_T_L500,1),1);
    idArray_L100 = zeros(size(veh_data_T_L100,1),1);
    
    %%{
    idArray_L500_C = zeros(size(veh_data_T_L500_C,1),1);
    idArray_L100_C = zeros(size(veh_data_T_L100_C,1),1);
    %%}
    
    idArray_O500 = zeros(size(veh_data_T_O500,1),1);
    idArray_O100 = zeros(size(veh_data_T_O100,1),1);
    
    %% for 500
    for j = 1 : size(veh_data_T_U500,1)
        if isempty(veh_data_T_U500{j,1})
            idArray_U500(j,1) = -100;
            continue;
        end
        idArray_U500(j,1) = veh_data_T_U500{j,1};
    end
    
    for j = 1 : size(veh_data_T_L500,1)
        if isempty(veh_data_T_L500{j,1})
            idArray_L500(j,1) = -100;
            continue;
        end
        idArray_L500(j,1) = veh_data_T_L500{j,1};
    end
    
    %%{
    for j = 1 : size(veh_data_T_L500_C,1)
        if isempty(veh_data_T_L500_C{j,1})
            idArray_L500_C(j,1) = -100;
            continue;
        end
        idArray_L500_C(j,1) = veh_data_T_L500_C{j,1};
    end
    %%}
    
    for j = 1 : size(veh_data_T_O500,1)
        if isempty(veh_data_T_O500{j,1})
            idArray_O500(j,1) = -100;
            continue;
        end
        idArray_O500(j,1) = veh_data_T_O500{j,1};
    end
    
    %% for 100
    for j = 1 : size(veh_data_T_U100,1)
        if isempty(veh_data_T_U100{j,1})
            idArray_U100(j,1) = -100;
            continue;
        end
        idArray_U100(j,1) = veh_data_T_U100{j,1};
    end
    
    for j = 1 : size(veh_data_T_L100,1)
        if isempty(veh_data_T_L100{j,1})
            idArray_L100(j,1) = -100;
            continue;
        end
        idArray_L100(j,1) = veh_data_T_L100{j,1};
    end
    
    %%{
    for j = 1 : size(veh_data_T_L100_C,1)
        if isempty(veh_data_T_L100_C{j,1})
            idArray_L100_C(j,1) = -100;
            continue;
        end
        idArray_L100_C(j,1) = veh_data_T_L100_C{j,1};
    end
    %%}
    
    for j = 1 : size(veh_data_T_O100,1)
        if isempty(veh_data_T_O100{j,1})
            idArray_O100(j,1) = -100;
            continue;
        end
        idArray_O100(j,1) = veh_data_T_O100{j,1};
    end
    
    %%
    
    % All models combined
    for i = 1 : size(veh_data_T_O500,1)
        
        base_veh = veh_data_T_U500{i,1};
        
        xx = veh_data_T_U500{i,3};
        yy = veh_data_T_U500{i,4};
        
        negVeh_U500 = veh_data_T_U500{i,2};
        negVeh_L500 = veh_data_T_L500{i,2};
        %%{
        negVeh_L500_C = veh_data_T_L500_C{i,2};
        %%}
        negVeh_O500 = veh_data_T_O500{i,2};
        
        negVeh_U100 = veh_data_T_U100{i,2};
        negVeh_L100 = veh_data_T_L100{i,2};
        %%{
        negVeh_L100_C = veh_data_T_L100_C{i,2};
        %%}
        negVeh_O100 = veh_data_T_O100{i,2};
        
        %% Unit Disk
        if size(negVeh_U500,1) ~= 0
            for j = 1 : size(negVeh_U500,2)
               neg_id = negVeh_U500(1,j);
               index_neg = find(idArray_U500 == neg_id);
               % vehicle no more in network
               if isempty(index_neg)
                   continue;
               end
               
               x_neg = veh_data_T_U500{index_neg,3};
               y_neg = veh_data_T_U500{index_neg,4};

               counter_dis_unit_500 = counter_dis_unit_500+1;
               distance_unit_500(counter_dis_unit_500,1) = sqrt((xx-x_neg)^2 + (yy-y_neg)^2);
            end
        end
        if size(negVeh_U100,1) ~= 0
            for j = 1 : size(negVeh_U100,2)
               neg_id = negVeh_U100(1,j);
               index_neg = find(idArray_U100 == neg_id);
               % vehicle no more in network
               if isempty(index_neg)
                   continue;
               end
               
               x_neg = veh_data_T_U100{index_neg,3};
               y_neg = veh_data_T_U100{index_neg,4};

               counter_dis_unit_100 = counter_dis_unit_100+1;
               distance_unit_100(counter_dis_unit_100,1) = sqrt((xx-x_neg)^2 + (yy-y_neg)^2);
            end
        end
        
        %% Log Normal
        if size(negVeh_L500,1) ~= 0
            for j = 1 : size(negVeh_L500,2)
               neg_id = negVeh_L500(1,j);
               index_neg = find(idArray_L500 == neg_id);
               % vehicle no more in network
               if isempty(index_neg)
                   continue;
               end
               
               x_neg = veh_data_T_L500{index_neg,3};
               y_neg = veh_data_T_L500{index_neg,4};

               counter_dis_log_500 = counter_dis_log_500 + 1;
               distance_log_500(counter_dis_log_500,1) = sqrt((xx-x_neg)^2 + (yy-y_neg)^2);
            end
        end
        if size(negVeh_L100,1) ~= 0
            for j = 1 : size(negVeh_L100,2)
               neg_id = negVeh_L100(1,j);
               index_neg = find(idArray_L100 == neg_id);
               % vehicle no more in network
               if isempty(index_neg)
                   continue;
               end
               
               x_neg = veh_data_T_L100{index_neg,3};
               y_neg = veh_data_T_L100{index_neg,4};

               counter_dis_log_100 = counter_dis_log_100 + 1;
               distance_log_100(counter_dis_log_100,1) = sqrt((xx-x_neg)^2 + (yy-y_neg)^2);
            end
        end
        
        %%{
        %% Classical Log Normal
        if size(negVeh_L500_C,1) ~= 0
            for j = 1 : size(negVeh_L500_C,2)
               neg_id = negVeh_L500_C(1,j);
               index_neg = find(idArray_L500_C == neg_id);
               % vehicle no more in network
               if isempty(index_neg)
                   continue;
               end
               
               x_neg = veh_data_T_L500_C{index_neg,3};
               y_neg = veh_data_T_L500_C{index_neg,4};

               counter_dis_log_500_C = counter_dis_log_500_C + 1;
               distance_log_500_C(counter_dis_log_500_C,1) = sqrt((xx-x_neg)^2 + (yy-y_neg)^2);
            end
        end
        if size(negVeh_L100_C,1) ~= 0
            for j = 1 : size(negVeh_L100_C,2)
               neg_id = negVeh_L100_C(1,j);
               index_neg = find(idArray_L100_C == neg_id);
               % vehicle no more in network
               if isempty(index_neg)
                   continue;
               end
               
               x_neg = veh_data_T_L100_C{index_neg,3};
               y_neg = veh_data_T_L100_C{index_neg,4};

               counter_dis_log_100_C = counter_dis_log_100_C + 1;
               distance_log_100_C(counter_dis_log_100_C,1) = sqrt((xx-x_neg)^2 + (yy-y_neg)^2);
            end
        end
        
        %%}        
        
        %% Obstacle Based
        if size(negVeh_O500,1) ~= 0
            for j = 1 : size(negVeh_O500,2)
               neg_id = negVeh_O500(1,j);
               index_neg = find(idArray_O500 == neg_id);
               % vehicle no more in network
               if isempty(index_neg)
                   continue;
               end
               
               x_neg = veh_data_T_O500{index_neg,3};
               y_neg = veh_data_T_O500{index_neg,4};

               counter_dis_obs_500 = counter_dis_obs_500+1;
               distance_obs_500(counter_dis_obs_500,1) = sqrt((xx-x_neg)^2 + (yy-y_neg)^2);
            end
        end
        if size(negVeh_O100,1) ~= 0
            for j = 1 : size(negVeh_O100,2)
               neg_id = negVeh_O100(1,j);
               index_neg = find(idArray_O100 == neg_id);
               % vehicle no more in network
               if isempty(index_neg)
                   continue;
               end
               
               x_neg = veh_data_T_O100{index_neg,3};
               y_neg = veh_data_T_O100{index_neg,4};

               counter_dis_obs_100 = counter_dis_obs_100+1;
               distance_obs_100(counter_dis_obs_100,1) = sqrt((xx-x_neg)^2 + (yy-y_neg)^2);
            end
        end
        
    end
    
    time = time + 50;
    counterTime = counterTime + 1;
end


distance_unit_500 = distance_unit_500(1:counter_dis_unit_500);

distance_log_500 = distance_log_500(1:counter_dis_log_500);

distance_log_500_C = distance_log_500_C(1:counter_dis_log_500_C);

distance_obs_500 = distance_obs_500(1:counter_dis_obs_500);


distance_unit_100 = distance_unit_100(1:counter_dis_unit_100);

distance_log_100 = distance_log_100(1:counter_dis_log_100);

distance_log_100_C = distance_log_100_C(1:counter_dis_log_100_C);

distance_obs_100 = distance_obs_100(1:counter_dis_obs_100);


save SaveData.mat;

%}
counterTime = 35;

load SaveData.mat;

x = 0:20:1000;

%% for 500 

K_unit_500  = hist(distance_unit_500,x)/counterTime;
K_log_500 = hist(distance_log_500,x)/counterTime;
K_log_500_C = hist(distance_log_500_C,x)/counterTime;
K_obs_500  = hist(distance_obs_500,x)/counterTime;

save ('distance_obs_500_low.mat','distance_obs_500');
save ('distance_unit_500_low.mat','distance_unit_500');
save ('distance_log_500_low.mat','distance_log_500');
save ('distance_log_500_low_C.mat','distance_log_500_C');


figure
axis([0 650 0 900])
hold on;

box on

plot (x,K_unit_500,'color','b','LineStyle','-','LineWidth', 1,'Marker','.');
plot (x,K_log_500,'color','g','LineStyle','-','LineWidth', 1.5);
plot (x,K_log_500_C,'color','m','LineStyle','--','LineWidth', 1.5);
plot (x,K_obs_500,'color','r','LineStyle',':','LineWidth', 2);
set(gca,'FontSize',12)

L = legend('Unit Disk','Log-M','Log-C','Obstacle');
set(L,'FontSize',12);
%title('Distance of neighbouring vehicle from transmitter - Low Density');
xlabel('Distance of neighbours (m)','FontSize',12);
ylabel('Frequency','FontSize',12);

%% for 100 now

K_unit_100  = hist(distance_unit_100,x)/counterTime;
K_log_100 = hist(distance_log_100,x)/counterTime;
K_log_100_C = hist(distance_log_100_C,x)/counterTime;
K_obs_100  = hist(distance_obs_100,x)/counterTime;

save ('distance_obs_100_low.mat','distance_obs_100');
save ('distance_unit_100_low.mat','distance_unit_100');
save ('distance_log_100_low.mat','distance_log_100');
%%{
save ('distance_log_100_low_C.mat','distance_log_100_C');
%%}

figure
axis([0 650 0 15000])
hold on;

box on

plot (x,K_unit_100,'color','b','LineStyle','-','LineWidth', 1,'Marker','.');
plot (x,K_log_100,'color','g','LineStyle','-','LineWidth', 1.5);
%%{
plot (x,K_log_100_C,'color','m','LineStyle','--','LineWidth', 1.5);
%%}
plot (x,K_obs_100,'color','r','LineStyle',':','LineWidth', 2);
set(gca,'FontSize',12)


L = legend('Unit Disk','Log-M','Log-C','Obstacle');
set(L,'FontSize',12);
%title('Distance of neighbouring vehicle from transmitter - Low Density');
xlabel('Distance of neighbours (m)','FontSize',12);
ylabel('Frequency','FontSize',12);

