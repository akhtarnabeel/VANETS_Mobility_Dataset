clear all;
clc;

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%% OBSTACLE
load All_Neg_Data_Log.mat;
load clusterCountArray_L100.mat;

AllNeighbours = All_Nodes_L100;
clusterCountArray = clusterCountArray_L100;
FileName1 = 'Clustering_Information_L100.mat';
FileName2 = 'Clustering_Information_L500.mat';



% 1st time
% 2nd no of clusters
% 3rd clustering coefficient
% 4th closeness centrality
% 5th size of largest cluster
% 6th Diameter
Clustering_Information = zeros(1800,6);
counterCI = 0;
for i = 1 : size(clusterCountArray,1)
%for i = 1 : 10

    Clusters = clusterCountArray{i,1};
    time = Clusters{1,1};
    
    maxClusterSize = 0;   
    
    ClosenessC_array = zeros(10000,1);
    counterCC = 0;
    
    ClusteringC_array = zeros(1000,1);
    counterClusterCo = 0;
    
    Diameter_array = zeros(1000,1);
    counterDia = 0;
    
    for j = 1 : size(Clusters,1)
    %for j = 6 : 6    
       N = Clusters{j,2};
       E = Clusters{j,3};
       Nodes = Clusters{j,4};
       edgeArray = zeros(N,N);
       
       % getting data for all vehicles
       ALL_NODES_DATA = AllNeighbours{time,1};
       No_Veh = size(ALL_NODES_DATA,1);
       
       for k = 1 : N
           Node_C_id = Nodes(1,k);
           for kk = 1 : No_Veh
                nodes_id =  ALL_NODES_DATA{kk,1};
                if nodes_id == Node_C_id
                    Node_C_neg = ALL_NODES_DATA{kk,2};
                    break;
                end
           end
           
           Node_C_id;
           Node_C_neg;
           
           x = k;
           for kk = 1 : size(Node_C_neg,2)
               neg_id = Node_C_neg(1,kk);
               for y = 1 : N
                   if neg_id == Nodes(1,y);
                        edgeArray(x,y) = 1;
                        break;
                   end
               end
           end    
       end
       edgeArray;
       [costs, path] = dijkstra(edgeArray,edgeArray);
       costs;
       path;
       %% Clustering coefficient
       CCO = (2*E)/(N*(N-1));
       counterClusterCo = counterClusterCo + 1;
       if  isnan(CCO) || (CCO == inf)
            ClusteringC_array(counterClusterCo,1) = 0;
       else
            ClusteringC_array(counterClusterCo,1) = CCO;
       end
       
       %% Diameter of cluster
       dimeter = max(max(costs));
       counterDia = counterDia+1;
       if dimeter == inf
            Diameter_array(counterDia,1) = 0; 
       else
           Diameter_array(counterDia,1) = dimeter; 
       end
       %% Size of large Cluster
       if N > maxClusterSize 
           maxClusterSize = N;
       end
       
       %% Closeness Centrality
       for ccc = 1 : N
            counterCC = counterCC+1;
            sumAll = sum(costs(ccc,:));
            if sumAll == 0
                ClosenessC_array(counterCC,1) = 0;
            else
                ClosenessC_array(counterCC,1) = 1/ sumAll;
            end
       end
       
       %% Betweenness Centrality
       
       
       
    end
    
    %% number of clusters
    No_of_clusters = size(Clusters,1)
    
    %% Closeness Centrality Final
    ClosenessC_array= ClosenessC_array(1:counterCC);
    Closeness_C = mean(ClosenessC_array)
    
    %% Clustering coefficient Final
    ClusteringC_array = ClusteringC_array(1:counterClusterCo);
    Clustering_Co = mean(ClusteringC_array)
    
    %% Diameter final
    Diameter_array = Diameter_array(1:counterDia);
    dimeter = mean(Diameter_array)
    
    %% size of largest cluster
    maxClusterSize
    
    % 1st time
    % 2nd no of clusters
    % 3rd clustering coefficient
    % 4th closeness centrality
    % 5th size of largest cluster
    % 6th Diameter
    counterCI = counterCI+1;
    Clustering_Information(counterCI, 1) = time;
    Clustering_Information(counterCI, 2) = No_of_clusters;
    Clustering_Information(counterCI, 3) = Clustering_Co;
    Clustering_Information(counterCI, 4) = Closeness_C;
    Clustering_Information(counterCI, 5) = maxClusterSize;
    Clustering_Information(counterCI, 6) = dimeter;
end

Clustering_Information = Clustering_Information((1:counterCI),:);

save(FileName1, 'Clustering_Information' );


%% 500 M OBS
%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%% 
%CHANGE
load clusterCountArray_L500.mat;
AllNeighbours = All_Nodes_L500;
clusterCountArray = clusterCountArray_L500;
%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%


% 1st time
% 2nd no of clusters
% 3rd clustering coefficient
% 4th closeness centrality
% 5th size of largest cluster
% 6th Diameter
Clustering_Information = zeros(1800,6);
counterCI = 0;
for i = 1 : size(clusterCountArray,1)
%for i = 1 : 10

    Clusters = clusterCountArray{i,1};
    time = Clusters{1,1};
    
    maxClusterSize = 0;   
    
    ClosenessC_array = zeros(10000,1);
    counterCC = 0;
    
    ClusteringC_array = zeros(1000,1);
    counterClusterCo = 0;
    
    Diameter_array = zeros(1000,1);
    counterDia = 0;
    
    for j = 1 : size(Clusters,1)
    %for j = 6 : 6    
       N = Clusters{j,2};
       E = Clusters{j,3};
       Nodes = Clusters{j,4};
       edgeArray = zeros(N,N);
       
       % getting data for all vehicles
       ALL_NODES_DATA = AllNeighbours{time,1};
       No_Veh = size(ALL_NODES_DATA,1);
       
       for k = 1 : N
           Node_C_id = Nodes(1,k);
           for kk = 1 : No_Veh
                nodes_id =  ALL_NODES_DATA{kk,1};
                if nodes_id == Node_C_id
                    Node_C_neg = ALL_NODES_DATA{kk,2};
                    break;
                end
           end
           
           Node_C_id;
           Node_C_neg;
           
           x = k;
           for kk = 1 : size(Node_C_neg,2)
               neg_id = Node_C_neg(1,kk);
               for y = 1 : N
                   if neg_id == Nodes(1,y);
                        edgeArray(x,y) = 1;
                        break;
                   end
               end
           end    
       end
       edgeArray;
       [costs, path] = dijkstra(edgeArray,edgeArray);
       costs;
       path;
       %% Clustering coefficient
       CCO = (2*E)/(N*(N-1));
       counterClusterCo = counterClusterCo + 1;
       if  isnan(CCO) || (CCO == inf)
            ClusteringC_array(counterClusterCo,1) = 0;
       else
            ClusteringC_array(counterClusterCo,1) = CCO;
       end
       
       %% Diameter of cluster
       dimeter = max(max(costs));
       counterDia = counterDia+1;
       if dimeter == inf
            Diameter_array(counterDia,1) = 0; 
       else
           Diameter_array(counterDia,1) = dimeter; 
       end
       %% Size of large Cluster
       if N > maxClusterSize 
           maxClusterSize = N;
       end
       
       %% Closeness Centrality
       for ccc = 1 : N
            counterCC = counterCC+1;
            sumAll = sum(costs(ccc,:));
            if sumAll == 0
                ClosenessC_array(counterCC,1) = 0;
            else
                ClosenessC_array(counterCC,1) = 1/ sumAll;
            end
       end
       
       %% Betweenness Centrality

    end
    
    %% number of clusters
    No_of_clusters = size(Clusters,1)
    
    %% Closeness Centrality Final
    ClosenessC_array= ClosenessC_array(1:counterCC);
    Closeness_C = mean(ClosenessC_array)
    
    %% Clustering coefficient Final
    ClusteringC_array = ClusteringC_array(1:counterClusterCo);
    Clustering_Co = mean(ClusteringC_array)
    
    %% Diameter final
    Diameter_array = Diameter_array(1:counterDia);
    dimeter = mean(Diameter_array)
    
    %% size of largest cluster
    maxClusterSize
    
    % 1st time
    % 2nd no of clusters
    % 3rd clustering coefficient
    % 4th closeness centrality
    % 5th size of largest cluster
    % 6th Diameter
    counterCI = counterCI+1;
    Clustering_Information(counterCI, 1) = time;
    Clustering_Information(counterCI, 2) = No_of_clusters;
    Clustering_Information(counterCI, 3) = Clustering_Co;
    Clustering_Information(counterCI, 4) = Closeness_C;
    Clustering_Information(counterCI, 5) = maxClusterSize;
    Clustering_Information(counterCI, 6) = dimeter;
end

Clustering_Information = Clustering_Information((1:counterCI),:);

save(FileName2, 'Clustering_Information' );

