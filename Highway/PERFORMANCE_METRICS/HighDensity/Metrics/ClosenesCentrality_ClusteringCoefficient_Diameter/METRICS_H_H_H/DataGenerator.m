clc;
clear all;

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%% FOR LOG NORMAL MODEL %%

%% for range 500m log model
load All_Neg_Data_Log.mat

AllNeighbours = All_Nodes_L500;

S_time = 1005;
offset = 10;
E_time = 1799;

sizeArray = size((S_time:offset:E_time),2);

clusterCountArray = cell(sizeArray,1);
counterArray = 0;

for time = S_time : offset :E_time
    
    %since we have data till 1799, I am taking 1800 as 1799
    if time == 1800
        time = 1799;
    end
    time
    vehicles_T = AllNeighbours{time,1} ; %first colum veh ID and 2nd colum their neighbours
    noOfVeh_T = size(vehicles_T,1);
    
    %cluster_T contains information that will help in identifying cluster
    %1st row contain ID of vehicles
    %2nd row contain if vehicles selected
    %3rd row contains if neighbours of vehicles checked
    cluster_T = zeros(noOfVeh_T,3);
    
    %add nodes to the cluster array
    for i=1: noOfVeh_T
        if (isempty(vehicles_T{i,1}))
        else
            cluster_T(i,1) = vehicles_T{i,1};
        end
    end
    
    %% now check for clusters
    % 1th row = time when this measurement was taken 
    % 2st colum = Number of nodes
    % 3nd roa = Number of Edges
    % 4rd row = Node ID of all the nodes in the cluster
    clusters = cell(1,4);
    
    checkClusters = 1;
    clusterCount = 0;
    baseId = 0;
    baseNeigh = [];
    while checkClusters == 1
        checkClusters = -1;
        
        N = 0;
        E = 0;
        NODES = [];
        
        %check if the base vehicle exist
        for i= 1:noOfVeh_T
            if cluster_T(i,2) == 0 && cluster_T(i,3) == 0
                %vehicle selected
                cluster_T(i,2) = 1;
                cluster_T(i,3) = 1;
                N = N+1;
                %add neighbours
                baseId = cluster_T(i,1);
                NODES = [NODES baseId];
                baseNeigh = vehicles_T{i,2};
                checkClusters = 1;
                clusterCount = clusterCount+1;
                break;
            end
        end
        
        %check if the end has came
        if checkClusters == -1
            % no more clusters are there at this time so add to array
            %clusters = clusters((1:clusterCount),:);
            counterArray = counterArray+1;
            clusterCountArray{counterArray,1} = clusters;
            break;
        end
        
        %mark neighbors of base vehicle
        for i= 1: size(baseNeigh,2)
            selectedId = baseNeigh(1,i);
            %search for the neigh of base vehicle is cluster and mark
            for j = 1 : noOfVeh_T
                if cluster_T(j,1) == selectedId
                    if cluster_T(j,2) ~= 1
                        cluster_T(j,2) = 1;
                        %N = N + 1;
                    end
                    E = E + 1;
                    break;
                end
            end
        end
        
        clearvars baseNeigh;
        clearvars baseId;
        
        %check for all the vehicles that can be reached from here
        checkAdded = 1;
        while checkAdded == 1
            checkAdded = -1;
            %select the vehicle for base node again
            for i = 1 : noOfVeh_T
                if (cluster_T(i,2) == 1 && cluster_T(i,3) == 0)
                    baseId =  cluster_T(i,1);
                    baseNeigh = vehicles_T{i,2};
                    %base marked
                    cluster_T(i,3) = 1;
                    N = N + 1;
                    NODES = [NODES baseId];
                    checkAdded = 1;
                    break;
                end
            end
            
            %check if the end has came
            if checkAdded == -1
                clusters{clusterCount,1} = time;
                clusters{clusterCount,2} = N;
                clusters{clusterCount,3} = E;
                clusters{clusterCount,4} = NODES;
                break;
            end
            
            %now again mark the neighbours
            if isempty(baseNeigh)
               %nothing 
            else
                for i= 1: size(baseNeigh,2)
                    selectedId = baseNeigh(1,i);
                    
                    %search for the neigh of base vehicle is cluster and mark
                    for j = 1 : noOfVeh_T
                        if cluster_T(j,1) == selectedId
                            if cluster_T(j,2) ~= 1
                               cluster_T(j,2) = 1;
                            end
                            if cluster_T(j,3) ~= 1
                                E = E + 1;
                            end
                            break;
                        end
                    end
                end
            end    
            clearvars baseNeigh;
            clearvars baseId;
        end
        clearvars baseNeigh;
        clearvars baseId;
    end
    %clusterCountArray = [clusterCountArray clusterCount]
end


clusterCountArray_L500 = clusterCountArray;
save ('clusterCountArray_L500.mat' , 'clusterCountArray_L500');



%% for range 100 Log Model

load All_Neg_Data_Log.mat

AllNeighbours = All_Nodes_L100;


S_time = 1005;
offset = 10;
E_time = 1799;

sizeArray = size((S_time:offset:E_time),2);

clusterCountArray = cell(sizeArray,1);
counterArray = 0;

for time = S_time : offset :E_time
    
    %since we have data till 1799, I am taking 1800 as 1799
    if time == 1800
        time = 1799;
    end
    time
    vehicles_T = AllNeighbours{time,1} ; %first colum veh ID and 2nd colum their neighbours
    noOfVeh_T = size(vehicles_T,1);
    
    %cluster_T contains information that will help in identifying cluster
    %1st row contain ID of vehicles
    %2nd row contain if vehicles selected
    %3rd row contains if neighbours of vehicles checked
    cluster_T = zeros(noOfVeh_T,3);
    
    %add nodes to the cluster array
    for i=1: noOfVeh_T
        if (isempty(vehicles_T{i,1}))
        else
            cluster_T(i,1) = vehicles_T{i,1};
        end
    end
    
    %% now check for clusters
    % 1th row = time when this measurement was taken 
    % 2st colum = Number of nodes
    % 3nd roa = Number of Edges
    % 4rd row = Node ID of all the nodes in the cluster
    clusters = cell(1,4);
    
    checkClusters = 1;
    clusterCount = 0;
    baseId = 0;
    baseNeigh = [];
    while checkClusters == 1
        checkClusters = -1;
        
        N = 0;
        E = 0;
        NODES = [];
        
        %check if the base vehicle exist
        for i= 1:noOfVeh_T
            if cluster_T(i,2) == 0 && cluster_T(i,3) == 0
                %vehicle selected
                cluster_T(i,2) = 1;
                cluster_T(i,3) = 1;
                N = N+1;
                %add neighbours
                baseId = cluster_T(i,1);
                NODES = [NODES baseId];
                baseNeigh = vehicles_T{i,2};
                checkClusters = 1;
                clusterCount = clusterCount+1;
                break;
            end
        end
        
        %check if the end has came
        if checkClusters == -1
            % no more clusters are there at this time so add to array
            %clusters = clusters((1:clusterCount),:);
            counterArray = counterArray+1;
            clusterCountArray{counterArray,1} = clusters;
            break;
        end
        
        %mark neighbors of base vehicle
        for i= 1: size(baseNeigh,2)
            selectedId = baseNeigh(1,i);
            %search for the neigh of base vehicle is cluster and mark
            for j = 1 : noOfVeh_T
                if cluster_T(j,1) == selectedId
                    if cluster_T(j,2) ~= 1
                        cluster_T(j,2) = 1;
                        %N = N + 1;
                    end
                    E = E + 1;
                    break;
                end
            end
        end
        
        clearvars baseNeigh;
        clearvars baseId;
        
        %check for all the vehicles that can be reached from here
        checkAdded = 1;
        while checkAdded == 1
            checkAdded = -1;
            %select the vehicle for base node again
            for i = 1 : noOfVeh_T
                if (cluster_T(i,2) == 1 && cluster_T(i,3) == 0)
                    baseId =  cluster_T(i,1);
                    baseNeigh = vehicles_T{i,2};
                    %base marked
                    cluster_T(i,3) = 1;
                    N = N + 1;
                    NODES = [NODES baseId];
                    checkAdded = 1;
                    break;
                end
            end
            
            %check if the end has came
            if checkAdded == -1
                clusters{clusterCount,1} = time;
                clusters{clusterCount,2} = N;
                clusters{clusterCount,3} = E;
                clusters{clusterCount,4} = NODES;
                break;
            end
            
            %now again mark the neighbours
            if isempty(baseNeigh)
               %nothing 
            else
                for i= 1: size(baseNeigh,2)
                    selectedId = baseNeigh(1,i);
                    
                    %search for the neigh of base vehicle is cluster and mark
                    for j = 1 : noOfVeh_T
                        if cluster_T(j,1) == selectedId
                            if cluster_T(j,2) ~= 1
                               cluster_T(j,2) = 1;
                            end
                            if cluster_T(j,3) ~= 1
                                E = E + 1;
                            end
                            break;
                        end
                    end
                end
            end    
            clearvars baseNeigh;
            clearvars baseId;
        end
        clearvars baseNeigh;
        clearvars baseId;
    end
    %clusterCountArray = [clusterCountArray clusterCount]
end


clusterCountArray_L100 = clusterCountArray;
save ('clusterCountArray_L100.mat' , 'clusterCountArray_L100');


%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%% FOR LOG CLASSICAL MODEL %%

%% for range 500m log model
load All_Neg_Data_Log_C.mat

AllNeighbours = All_Nodes_L500;

S_time = 1005;
offset = 10;
E_time = 1799;

sizeArray = size((S_time:offset:E_time),2);

clusterCountArray = cell(sizeArray,1);
counterArray = 0;

for time = S_time : offset :E_time
    
    %since we have data till 1799, I am taking 1800 as 1799
    if time == 1800
        time = 1799;
    end
    time
    vehicles_T = AllNeighbours{time,1} ; %first colum veh ID and 2nd colum their neighbours
    noOfVeh_T = size(vehicles_T,1);
    
    %cluster_T contains information that will help in identifying cluster
    %1st row contain ID of vehicles
    %2nd row contain if vehicles selected
    %3rd row contains if neighbours of vehicles checked
    cluster_T = zeros(noOfVeh_T,3);
    
    %add nodes to the cluster array
    for i=1: noOfVeh_T
        if (isempty(vehicles_T{i,1}))
        else
            cluster_T(i,1) = vehicles_T{i,1};
        end
    end
    
    %% now check for clusters
    % 1th row = time when this measurement was taken 
    % 2st colum = Number of nodes
    % 3nd roa = Number of Edges
    % 4rd row = Node ID of all the nodes in the cluster
    clusters = cell(1,4);
    
    checkClusters = 1;
    clusterCount = 0;
    baseId = 0;
    baseNeigh = [];
    while checkClusters == 1
        checkClusters = -1;
        
        N = 0;
        E = 0;
        NODES = [];
        
        %check if the base vehicle exist
        for i= 1:noOfVeh_T
            if cluster_T(i,2) == 0 && cluster_T(i,3) == 0
                %vehicle selected
                cluster_T(i,2) = 1;
                cluster_T(i,3) = 1;
                N = N+1;
                %add neighbours
                baseId = cluster_T(i,1);
                NODES = [NODES baseId];
                baseNeigh = vehicles_T{i,2};
                checkClusters = 1;
                clusterCount = clusterCount+1;
                break;
            end
        end
        
        %check if the end has came
        if checkClusters == -1
            % no more clusters are there at this time so add to array
            %clusters = clusters((1:clusterCount),:);
            counterArray = counterArray+1;
            clusterCountArray{counterArray,1} = clusters;
            break;
        end
        
        %mark neighbors of base vehicle
        for i= 1: size(baseNeigh,2)
            selectedId = baseNeigh(1,i);
            %search for the neigh of base vehicle is cluster and mark
            for j = 1 : noOfVeh_T
                if cluster_T(j,1) == selectedId
                    if cluster_T(j,2) ~= 1
                        cluster_T(j,2) = 1;
                        %N = N + 1;
                    end
                    E = E + 1;
                    break;
                end
            end
        end
        
        clearvars baseNeigh;
        clearvars baseId;
        
        %check for all the vehicles that can be reached from here
        checkAdded = 1;
        while checkAdded == 1
            checkAdded = -1;
            %select the vehicle for base node again
            for i = 1 : noOfVeh_T
                if (cluster_T(i,2) == 1 && cluster_T(i,3) == 0)
                    baseId =  cluster_T(i,1);
                    baseNeigh = vehicles_T{i,2};
                    %base marked
                    cluster_T(i,3) = 1;
                    N = N + 1;
                    NODES = [NODES baseId];
                    checkAdded = 1;
                    break;
                end
            end
            
            %check if the end has came
            if checkAdded == -1
                clusters{clusterCount,1} = time;
                clusters{clusterCount,2} = N;
                clusters{clusterCount,3} = E;
                clusters{clusterCount,4} = NODES;
                break;
            end
            
            %now again mark the neighbours
            if isempty(baseNeigh)
               %nothing 
            else
                for i= 1: size(baseNeigh,2)
                    selectedId = baseNeigh(1,i);
                    
                    %search for the neigh of base vehicle is cluster and mark
                    for j = 1 : noOfVeh_T
                        if cluster_T(j,1) == selectedId
                            if cluster_T(j,2) ~= 1
                               cluster_T(j,2) = 1;
                            end
                            if cluster_T(j,3) ~= 1
                                E = E + 1;
                            end
                            break;
                        end
                    end
                end
            end    
            clearvars baseNeigh;
            clearvars baseId;
        end
        clearvars baseNeigh;
        clearvars baseId;
    end
    %clusterCountArray = [clusterCountArray clusterCount]
end


clusterCountArray_L500_C = clusterCountArray;
save ('clusterCountArray_L500_C.mat' , 'clusterCountArray_L500_C');



%% for range 100 Log Classical Model

load All_Neg_Data_Log_C.mat

AllNeighbours = All_Nodes_L100;


S_time = 1005;
offset = 10;
E_time = 1799;

sizeArray = size((S_time:offset:E_time),2);

clusterCountArray = cell(sizeArray,1);
counterArray = 0;

for time = S_time : offset :E_time
    
    %since we have data till 1799, I am taking 1800 as 1799
    if time == 1800
        time = 1799;
    end
    time
    vehicles_T = AllNeighbours{time,1} ; %first colum veh ID and 2nd colum their neighbours
    noOfVeh_T = size(vehicles_T,1);
    
    %cluster_T contains information that will help in identifying cluster
    %1st row contain ID of vehicles
    %2nd row contain if vehicles selected
    %3rd row contains if neighbours of vehicles checked
    cluster_T = zeros(noOfVeh_T,3);
    
    %add nodes to the cluster array
    for i=1: noOfVeh_T
        if (isempty(vehicles_T{i,1}))
        else
            cluster_T(i,1) = vehicles_T{i,1};
        end
    end
    
    %% now check for clusters
    % 1th row = time when this measurement was taken 
    % 2st colum = Number of nodes
    % 3nd roa = Number of Edges
    % 4rd row = Node ID of all the nodes in the cluster
    clusters = cell(1,4);
    
    checkClusters = 1;
    clusterCount = 0;
    baseId = 0;
    baseNeigh = [];
    while checkClusters == 1
        checkClusters = -1;
        
        N = 0;
        E = 0;
        NODES = [];
        
        %check if the base vehicle exist
        for i= 1:noOfVeh_T
            if cluster_T(i,2) == 0 && cluster_T(i,3) == 0
                %vehicle selected
                cluster_T(i,2) = 1;
                cluster_T(i,3) = 1;
                N = N+1;
                %add neighbours
                baseId = cluster_T(i,1);
                NODES = [NODES baseId];
                baseNeigh = vehicles_T{i,2};
                checkClusters = 1;
                clusterCount = clusterCount+1;
                break;
            end
        end
        
        %check if the end has came
        if checkClusters == -1
            % no more clusters are there at this time so add to array
            %clusters = clusters((1:clusterCount),:);
            counterArray = counterArray+1;
            clusterCountArray{counterArray,1} = clusters;
            break;
        end
        
        %mark neighbors of base vehicle
        for i= 1: size(baseNeigh,2)
            selectedId = baseNeigh(1,i);
            %search for the neigh of base vehicle is cluster and mark
            for j = 1 : noOfVeh_T
                if cluster_T(j,1) == selectedId
                    if cluster_T(j,2) ~= 1
                        cluster_T(j,2) = 1;
                        %N = N + 1;
                    end
                    E = E + 1;
                    break;
                end
            end
        end
        
        clearvars baseNeigh;
        clearvars baseId;
        
        %check for all the vehicles that can be reached from here
        checkAdded = 1;
        while checkAdded == 1
            checkAdded = -1;
            %select the vehicle for base node again
            for i = 1 : noOfVeh_T
                if (cluster_T(i,2) == 1 && cluster_T(i,3) == 0)
                    baseId =  cluster_T(i,1);
                    baseNeigh = vehicles_T{i,2};
                    %base marked
                    cluster_T(i,3) = 1;
                    N = N + 1;
                    NODES = [NODES baseId];
                    checkAdded = 1;
                    break;
                end
            end
            
            %check if the end has came
            if checkAdded == -1
                clusters{clusterCount,1} = time;
                clusters{clusterCount,2} = N;
                clusters{clusterCount,3} = E;
                clusters{clusterCount,4} = NODES;
                break;
            end
            
            %now again mark the neighbours
            if isempty(baseNeigh)
               %nothing 
            else
                for i= 1: size(baseNeigh,2)
                    selectedId = baseNeigh(1,i);
                    
                    %search for the neigh of base vehicle is cluster and mark
                    for j = 1 : noOfVeh_T
                        if cluster_T(j,1) == selectedId
                            if cluster_T(j,2) ~= 1
                               cluster_T(j,2) = 1;
                            end
                            if cluster_T(j,3) ~= 1
                                E = E + 1;
                            end
                            break;
                        end
                    end
                end
            end    
            clearvars baseNeigh;
            clearvars baseId;
        end
        clearvars baseNeigh;
        clearvars baseId;
    end
    %clusterCountArray = [clusterCountArray clusterCount]
end


clusterCountArray_L100_C = clusterCountArray;
save ('clusterCountArray_L100_C.mat' , 'clusterCountArray_L100_C');


%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%% FOR UNIT DISK MODEL %%

%% for range 500m log model
load All_Neg_Data_Obs.mat


AllNeighbours = All_Nodes_O500;


S_time = 1005;
offset = 10;
E_time = 1799;

sizeArray = size((S_time:offset:E_time),2);

clusterCountArray = cell(sizeArray,1);
counterArray = 0;

for time = S_time : offset :E_time
    
    %since we have data till 1799, I am taking 1800 as 1799
    if time == 1800
        time = 1799;
    end
    time
    vehicles_T = AllNeighbours{time,1} ; %first colum veh ID and 2nd colum their neighbours
    noOfVeh_T = size(vehicles_T,1);
    
    %cluster_T contains information that will help in identifying cluster
    %1st row contain ID of vehicles
    %2nd row contain if vehicles selected
    %3rd row contains if neighbours of vehicles checked
    cluster_T = zeros(noOfVeh_T,3);
    
    %add nodes to the cluster array
    for i=1: noOfVeh_T
        if (isempty(vehicles_T{i,1}))
        else
            cluster_T(i,1) = vehicles_T{i,1};
        end
    end
    
    %% now check for clusters
    % 1th row = time when this measurement was taken 
    % 2st colum = Number of nodes
    % 3nd roa = Number of Edges
    % 4rd row = Node ID of all the nodes in the cluster
    clusters = cell(1,4);
    
    checkClusters = 1;
    clusterCount = 0;
    baseId = 0;
    baseNeigh = [];
    while checkClusters == 1
        checkClusters = -1;
        
        N = 0;
        E = 0;
        NODES = [];
        
        %check if the base vehicle exist
        for i= 1:noOfVeh_T
            if cluster_T(i,2) == 0 && cluster_T(i,3) == 0
                %vehicle selected
                cluster_T(i,2) = 1;
                cluster_T(i,3) = 1;
                N = N+1;
                %add neighbours
                baseId = cluster_T(i,1);
                NODES = [NODES baseId];
                baseNeigh = vehicles_T{i,2};
                checkClusters = 1;
                clusterCount = clusterCount+1;
                break;
            end
        end
        
        %check if the end has came
        if checkClusters == -1
            % no more clusters are there at this time so add to array
            %clusters = clusters((1:clusterCount),:);
            counterArray = counterArray+1;
            clusterCountArray{counterArray,1} = clusters;
            break;
        end
        
        %mark neighbors of base vehicle
        for i= 1: size(baseNeigh,2)
            selectedId = baseNeigh(1,i);
            %search for the neigh of base vehicle is cluster and mark
            for j = 1 : noOfVeh_T
                if cluster_T(j,1) == selectedId
                    if cluster_T(j,2) ~= 1
                        cluster_T(j,2) = 1;
                        %N = N + 1;
                    end
                    E = E + 1;
                    break;
                end
            end
        end
        
        clearvars baseNeigh;
        clearvars baseId;
        
        %check for all the vehicles that can be reached from here
        checkAdded = 1;
        while checkAdded == 1
            checkAdded = -1;
            %select the vehicle for base node again
            for i = 1 : noOfVeh_T
                if (cluster_T(i,2) == 1 && cluster_T(i,3) == 0)
                    baseId =  cluster_T(i,1);
                    baseNeigh = vehicles_T{i,2};
                    %base marked
                    cluster_T(i,3) = 1;
                    N = N + 1;
                    NODES = [NODES baseId];
                    checkAdded = 1;
                    break;
                end
            end
            
            %check if the end has came
            if checkAdded == -1
                clusters{clusterCount,1} = time;
                clusters{clusterCount,2} = N;
                clusters{clusterCount,3} = E;
                clusters{clusterCount,4} = NODES;
                break;
            end
            
            %now again mark the neighbours
            if isempty(baseNeigh)
               %nothing 
            else
                for i= 1: size(baseNeigh,2)
                    selectedId = baseNeigh(1,i);
                    
                    %search for the neigh of base vehicle is cluster and mark
                    for j = 1 : noOfVeh_T
                        if cluster_T(j,1) == selectedId
                            if cluster_T(j,2) ~= 1
                               cluster_T(j,2) = 1;
                            end
                            if cluster_T(j,3) ~= 1
                                E = E + 1;
                            end
                            break;
                        end
                    end
                end
            end    
            clearvars baseNeigh;
            clearvars baseId;
        end
        clearvars baseNeigh;
        clearvars baseId;
    end
    %clusterCountArray = [clusterCountArray clusterCount]
end

clusterCountArray_O500 = clusterCountArray;
save ('clusterCountArray_O500.mat' , 'clusterCountArray_O500');

%% for range 100 Obs Model

load All_Neg_Data_Obs.mat


AllNeighbours = All_Nodes_O100;


S_time = 1005;
offset = 10;
E_time = 1799;

sizeArray = size((S_time:offset:E_time),2);

clusterCountArray = cell(sizeArray,1);
counterArray = 0;

for time = S_time : offset :E_time
    
    %since we have data till 1799, I am taking 1800 as 1799
    if time == 1800
        time = 1799;
    end
    time
    vehicles_T = AllNeighbours{time,1} ; %first colum veh ID and 2nd colum their neighbours
    noOfVeh_T = size(vehicles_T,1);
    
    %cluster_T contains information that will help in identifying cluster
    %1st row contain ID of vehicles
    %2nd row contain if vehicles selected
    %3rd row contains if neighbours of vehicles checked
    cluster_T = zeros(noOfVeh_T,3);
    
    %add nodes to the cluster array
    for i=1: noOfVeh_T
        if (isempty(vehicles_T{i,1}))
        else
            cluster_T(i,1) = vehicles_T{i,1};
        end
    end
    
    %% now check for clusters
    % 1th row = time when this measurement was taken 
    % 2st colum = Number of nodes
    % 3nd roa = Number of Edges
    % 4rd row = Node ID of all the nodes in the cluster
    clusters = cell(1,4);
    
    checkClusters = 1;
    clusterCount = 0;
    baseId = 0;
    baseNeigh = [];
    while checkClusters == 1
        checkClusters = -1;
        
        N = 0;
        E = 0;
        NODES = [];
        
        %check if the base vehicle exist
        for i= 1:noOfVeh_T
            if cluster_T(i,2) == 0 && cluster_T(i,3) == 0
                %vehicle selected
                cluster_T(i,2) = 1;
                cluster_T(i,3) = 1;
                N = N+1;
                %add neighbours
                baseId = cluster_T(i,1);
                NODES = [NODES baseId];
                baseNeigh = vehicles_T{i,2};
                checkClusters = 1;
                clusterCount = clusterCount+1;
                break;
            end
        end
        
        %check if the end has came
        if checkClusters == -1
            % no more clusters are there at this time so add to array
            %clusters = clusters((1:clusterCount),:);
            counterArray = counterArray+1;
            clusterCountArray{counterArray,1} = clusters;
            break;
        end
        
        %mark neighbors of base vehicle
        for i= 1: size(baseNeigh,2)
            selectedId = baseNeigh(1,i);
            %search for the neigh of base vehicle is cluster and mark
            for j = 1 : noOfVeh_T
                if cluster_T(j,1) == selectedId
                    if cluster_T(j,2) ~= 1
                        cluster_T(j,2) = 1;
                        %N = N + 1;
                    end
                    E = E + 1;
                    break;
                end
            end
        end
        
        clearvars baseNeigh;
        clearvars baseId;
        
        %check for all the vehicles that can be reached from here
        checkAdded = 1;
        while checkAdded == 1
            checkAdded = -1;
            %select the vehicle for base node again
            for i = 1 : noOfVeh_T
                if (cluster_T(i,2) == 1 && cluster_T(i,3) == 0)
                    baseId =  cluster_T(i,1);
                    baseNeigh = vehicles_T{i,2};
                    %base marked
                    cluster_T(i,3) = 1;
                    N = N + 1;
                    NODES = [NODES baseId];
                    checkAdded = 1;
                    break;
                end
            end
            
            %check if the end has came
            if checkAdded == -1
                clusters{clusterCount,1} = time;
                clusters{clusterCount,2} = N;
                clusters{clusterCount,3} = E;
                clusters{clusterCount,4} = NODES;
                break;
            end
            
            %now again mark the neighbours
            if isempty(baseNeigh)
               %nothing 
            else
                for i= 1: size(baseNeigh,2)
                    selectedId = baseNeigh(1,i);
                    
                    %search for the neigh of base vehicle is cluster and mark
                    for j = 1 : noOfVeh_T
                        if cluster_T(j,1) == selectedId
                            if cluster_T(j,2) ~= 1
                               cluster_T(j,2) = 1;
                            end
                            if cluster_T(j,3) ~= 1
                                E = E + 1;
                            end
                            break;
                        end
                    end
                end
            end    
            clearvars baseNeigh;
            clearvars baseId;
        end
        clearvars baseNeigh;
        clearvars baseId;
    end
    %clusterCountArray = [clusterCountArray clusterCount]
end


clusterCountArray_O100 = clusterCountArray;
save ('clusterCountArray_O100.mat' , 'clusterCountArray_O100');


%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%% FOR Unit Disk MODEL %%

%% for range 500m log model
load All_Neg_Data_Unit.mat


AllNeighbours = All_Nodes_U500;


S_time = 1005;
offset = 10;
E_time = 1799;

sizeArray = size((S_time:offset:E_time),2);

clusterCountArray = cell(sizeArray,1);
counterArray = 0;

for time = S_time : offset :E_time
    
    %since we have data till 1799, I am taking 1800 as 1799
    if time == 1800
        time = 1799;
    end
    time
    vehicles_T = AllNeighbours{time,1} ; %first colum veh ID and 2nd colum their neighbours
    noOfVeh_T = size(vehicles_T,1);
    
    %cluster_T contains information that will help in identifying cluster
    %1st row contain ID of vehicles
    %2nd row contain if vehicles selected
    %3rd row contains if neighbours of vehicles checked
    cluster_T = zeros(noOfVeh_T,3);
    
    %add nodes to the cluster array
    for i=1: noOfVeh_T
        if (isempty(vehicles_T{i,1}))
        else
            cluster_T(i,1) = vehicles_T{i,1};
        end
    end
    
    %% now check for clusters
    % 1th row = time when this measurement was taken 
    % 2st colum = Number of nodes
    % 3nd roa = Number of Edges
    % 4rd row = Node ID of all the nodes in the cluster
    clusters = cell(1,4);
    
    checkClusters = 1;
    clusterCount = 0;
    baseId = 0;
    baseNeigh = [];
    while checkClusters == 1
        checkClusters = -1;
        
        N = 0;
        E = 0;
        NODES = [];
        
        %check if the base vehicle exist
        for i= 1:noOfVeh_T
            if cluster_T(i,2) == 0 && cluster_T(i,3) == 0
                %vehicle selected
                cluster_T(i,2) = 1;
                cluster_T(i,3) = 1;
                N = N+1;
                %add neighbours
                baseId = cluster_T(i,1);
                NODES = [NODES baseId];
                baseNeigh = vehicles_T{i,2};
                checkClusters = 1;
                clusterCount = clusterCount+1;
                break;
            end
        end
        
        %check if the end has came
        if checkClusters == -1
            % no more clusters are there at this time so add to array
            %clusters = clusters((1:clusterCount),:);
            counterArray = counterArray+1;
            clusterCountArray{counterArray,1} = clusters;
            break;
        end
        
        %mark neighbors of base vehicle
        for i= 1: size(baseNeigh,2)
            selectedId = baseNeigh(1,i);
            %search for the neigh of base vehicle is cluster and mark
            for j = 1 : noOfVeh_T
                if cluster_T(j,1) == selectedId
                    if cluster_T(j,2) ~= 1
                        cluster_T(j,2) = 1;
                        %N = N + 1;
                    end
                    E = E + 1;
                    break;
                end
            end
        end
        
        clearvars baseNeigh;
        clearvars baseId;
        
        %check for all the vehicles that can be reached from here
        checkAdded = 1;
        while checkAdded == 1
            checkAdded = -1;
            %select the vehicle for base node again
            for i = 1 : noOfVeh_T
                if (cluster_T(i,2) == 1 && cluster_T(i,3) == 0)
                    baseId =  cluster_T(i,1);
                    baseNeigh = vehicles_T{i,2};
                    %base marked
                    cluster_T(i,3) = 1;
                    N = N + 1;
                    NODES = [NODES baseId];
                    checkAdded = 1;
                    break;
                end
            end
            
            %check if the end has came
            if checkAdded == -1
                clusters{clusterCount,1} = time;
                clusters{clusterCount,2} = N;
                clusters{clusterCount,3} = E;
                clusters{clusterCount,4} = NODES;
                break;
            end
            
            %now again mark the neighbours
            if isempty(baseNeigh)
               %nothing 
            else
                for i= 1: size(baseNeigh,2)
                    selectedId = baseNeigh(1,i);
                    
                    %search for the neigh of base vehicle is cluster and mark
                    for j = 1 : noOfVeh_T
                        if cluster_T(j,1) == selectedId
                            if cluster_T(j,2) ~= 1
                               cluster_T(j,2) = 1;
                            end
                            if cluster_T(j,3) ~= 1
                                E = E + 1;
                            end
                            break;
                        end
                    end
                end
            end    
            clearvars baseNeigh;
            clearvars baseId;
        end
        clearvars baseNeigh;
        clearvars baseId;
    end
    %clusterCountArray = [clusterCountArray clusterCount]
end

clusterCountArray_U500 = clusterCountArray;
save ('clusterCountArray_U500.mat' , 'clusterCountArray_U500');

%% for range 100 Unit Model
load All_Neg_Data_Unit.mat

AllNeighbours = All_Nodes_U100;

S_time = 1005;
offset = 10;
E_time = 1799;

sizeArray = size((S_time:offset:E_time),2);

clusterCountArray = cell(sizeArray,1);
counterArray = 0;

for time = S_time : offset :E_time
    
    %since we have data till 1799, I am taking 1800 as 1799
    if time == 1800
        time = 1799;
    end
    time
    vehicles_T = AllNeighbours{time,1} ; %first colum veh ID and 2nd colum their neighbours
    noOfVeh_T = size(vehicles_T,1);
    
    %cluster_T contains information that will help in identifying cluster
    %1st row contain ID of vehicles
    %2nd row contain if vehicles selected
    %3rd row contains if neighbours of vehicles checked
    cluster_T = zeros(noOfVeh_T,3);
    
    %add nodes to the cluster array
    for i=1: noOfVeh_T
        if (isempty(vehicles_T{i,1}))
        else
            cluster_T(i,1) = vehicles_T{i,1};
        end
    end
    
    %% now check for clusters
    % 1th row = time when this measurement was taken 
    % 2st colum = Number of nodes
    % 3nd roa = Number of Edges
    % 4rd row = Node ID of all the nodes in the cluster
    clusters = cell(1,4);
    
    checkClusters = 1;
    clusterCount = 0;
    baseId = 0;
    baseNeigh = [];
    while checkClusters == 1
        checkClusters = -1;
        
        N = 0;
        E = 0;
        NODES = [];
        
        %check if the base vehicle exist
        for i= 1:noOfVeh_T
            if cluster_T(i,2) == 0 && cluster_T(i,3) == 0
                %vehicle selected
                cluster_T(i,2) = 1;
                cluster_T(i,3) = 1;
                N = N+1;
                %add neighbours
                baseId = cluster_T(i,1);
                NODES = [NODES baseId];
                baseNeigh = vehicles_T{i,2};
                checkClusters = 1;
                clusterCount = clusterCount+1;
                break;
            end
        end
        
        %check if the end has came
        if checkClusters == -1
            % no more clusters are there at this time so add to array
            %clusters = clusters((1:clusterCount),:);
            counterArray = counterArray+1;
            clusterCountArray{counterArray,1} = clusters;
            break;
        end
        
        %mark neighbors of base vehicle
        for i= 1: size(baseNeigh,2)
            selectedId = baseNeigh(1,i);
            %search for the neigh of base vehicle is cluster and mark
            for j = 1 : noOfVeh_T
                if cluster_T(j,1) == selectedId
                    if cluster_T(j,2) ~= 1
                        cluster_T(j,2) = 1;
                        %N = N + 1;
                    end
                    E = E + 1;
                    break;
                end
            end
        end
        
        clearvars baseNeigh;
        clearvars baseId;
        
        %check for all the vehicles that can be reached from here
        checkAdded = 1;
        while checkAdded == 1
            checkAdded = -1;
            %select the vehicle for base node again
            for i = 1 : noOfVeh_T
                if (cluster_T(i,2) == 1 && cluster_T(i,3) == 0)
                    baseId =  cluster_T(i,1);
                    baseNeigh = vehicles_T{i,2};
                    %base marked
                    cluster_T(i,3) = 1;
                    N = N + 1;
                    NODES = [NODES baseId];
                    checkAdded = 1;
                    break;
                end
            end
            
            %check if the end has came
            if checkAdded == -1
                clusters{clusterCount,1} = time;
                clusters{clusterCount,2} = N;
                clusters{clusterCount,3} = E;
                clusters{clusterCount,4} = NODES;
                break;
            end
            
            %now again mark the neighbours
            if isempty(baseNeigh)
               %nothing 
            else
                for i= 1: size(baseNeigh,2)
                    selectedId = baseNeigh(1,i);
                    
                    %search for the neigh of base vehicle is cluster and mark
                    for j = 1 : noOfVeh_T
                        if cluster_T(j,1) == selectedId
                            if cluster_T(j,2) ~= 1
                               cluster_T(j,2) = 1;
                            end
                            if cluster_T(j,3) ~= 1
                                E = E + 1;
                            end
                            break;
                        end
                    end
                end
            end    
            clearvars baseNeigh;
            clearvars baseId;
        end
        clearvars baseNeigh;
        clearvars baseId;
    end
    %clusterCountArray = [clusterCountArray clusterCount]
end


clusterCountArray_U100 = clusterCountArray;
save ('clusterCountArray_U100.mat' , 'clusterCountArray_U100');

