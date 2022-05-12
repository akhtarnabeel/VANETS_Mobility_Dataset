clear all
clc

load Clustering_Information_L100.mat
Clustering_Information_L100 = Clustering_Information;

load Clustering_Information_L500.mat
Clustering_Information_L500 = Clustering_Information;

%%{
load Clustering_Information_L100_C.mat
Clustering_Information_L100_C = Clustering_Information;

load Clustering_Information_L500_C.mat
Clustering_Information_L500_C = Clustering_Information;
%%}

load Clustering_Information_O100.mat
Clustering_Information_O100 = Clustering_Information;

load Clustering_Information_O500.mat
Clustering_Information_O500 = Clustering_Information;

load Clustering_Information_U100.mat
Clustering_Information_U100 = Clustering_Information;

load Clustering_Information_U500.mat
Clustering_Information_U500 = Clustering_Information;

%% make it less data
Clustering_Information_L100 = Clustering_Information_L100((1:7:end),:);
Clustering_Information_L500 = Clustering_Information_L500((1:7:end),:);
%%{
Clustering_Information_L100_C = Clustering_Information_L100_C((1:7:end),:);
Clustering_Information_L500_C = Clustering_Information_L500_C((1:7:end),:);
%%}
Clustering_Information_U100 = Clustering_Information_U100((1:7:end),:);
Clustering_Information_U500 = Clustering_Information_U500((1:7:end),:);
Clustering_Information_O100 = Clustering_Information_O100((1:7:end),:);
Clustering_Information_O500 = Clustering_Information_O500((1:7:end),:);
%%


x = Clustering_Information_L100(:,1);

%% Clustering coeffcient

yy_L100 = Clustering_Information_L100(:,3);
yy_L500 = Clustering_Information_L500(:,3);
%%{
yy_L100_C = Clustering_Information_L100_C(:,3);
yy_L500_C = Clustering_Information_L500_C(:,3);
%%}
yy_U100 = Clustering_Information_U100(:,3);
yy_U500 = Clustering_Information_U500(:,3);
yy_O100 = Clustering_Information_O100(:,3);
yy_O500 = Clustering_Information_O500(:,3);

figure
axis([1000 1800 0 2])
hold on;
box on;

U100 = plot (x,yy_U100,'-b');
U500 = plot (x,yy_U500,'-b');
set(U100,'color','b','LineStyle','-','Marker','o','LineWidth',1)
set(U500,'color','b','LineStyle',':','Marker','o','LineWidth', 2)


L100 = plot (x,yy_L100,'-g');
L500 = plot (x,yy_L500,'-g');
set(L100,'color','g','LineStyle','-','Marker','*','LineWidth',1)
set(L500,'color','g','LineStyle',':','Marker','*','LineWidth', 2)

%%{
L100_C = plot (x,yy_L100_C,'-m');
L500_C = plot (x,yy_L500_C,'-m');
set(L100_C,'color','m','LineStyle','-','Marker','^','LineWidth',1)
set(L500_C,'color','m','LineStyle',':','Marker','^','LineWidth', 2)
%%}

O100 = plot (x,yy_O100,'-r');
O500 = plot (x,yy_O500,'-r');
set(O100,'color','r','LineStyle','-','Marker','s','LineWidth',1)
set(O500,'color','r','LineStyle',':','Marker','s','LineWidth', 2)

xlabel('Time(seconds)');
ylabel('Clustering Coefficient');
legend('Unit R=100m','Unit R=500m','Log_M R=100m', 'Log_M R=500m','Log_C R=100m', 'Log_C R=500m','Obs R=100m', 'Obs R=500m');


%% Number of clusters

yy_L100 = Clustering_Information_L100(:,2);
yy_L500 = Clustering_Information_L500(:,2);
%%{
yy_L100_C = Clustering_Information_L100_C(:,2);
yy_L500_C = Clustering_Information_L500_C(:,2);
%%}
yy_U100 = Clustering_Information_U100(:,2);
yy_U500 = Clustering_Information_U500(:,2);
yy_O100 = Clustering_Information_O100(:,2);
yy_O500 = Clustering_Information_O500(:,2);

figure
%axis([0 650 0 15000])
hold on;
box on;

U100 = plot (x,yy_U100,'-b');
U500 = plot (x,yy_U500,'-b');
set(U100,'color','b','LineStyle','-','Marker','o','LineWidth',1)
set(U500,'color','b','LineStyle',':','Marker','o','LineWidth', 2)


L100 = plot (x,yy_L100,'-g');
L500 = plot (x,yy_L500,'-g');
set(L100,'color','g','LineStyle','-','Marker','*','LineWidth',1)
set(L500,'color','g','LineStyle',':','Marker','*','LineWidth', 2)

%%{
L100_C = plot (x,yy_L100_C,'-m');
L500_C = plot (x,yy_L500_C,'-m');
set(L100_C,'color','m','LineStyle','-','Marker','^','LineWidth',1)
set(L500_C,'color','m','LineStyle',':','Marker','^','LineWidth', 2)
%%}

O100 = plot (x,yy_O100,'-r');
O500 = plot (x,yy_O500,'-r');
set(O100,'color','r','LineStyle','-','Marker','s','LineWidth',1)
set(O500,'color','r','LineStyle',':','Marker','s','LineWidth', 2)

xlabel('Time(seconds)');
ylabel('Number of Clusters');
legend('Unit R=100m','Unit R=500m','Log_M R=100m', 'Log_M R=500m','Log_C R=100m', 'Log_C R=500m','Obs R=100m', 'Obs R=500m');

%% Closeness Centrality

yy_L100 = Clustering_Information_L100(:,4);
yy_L500 = Clustering_Information_L500(:,4);
%%{
yy_L100_C = Clustering_Information_L100_C(:,4);
yy_L500_C = Clustering_Information_L500_C(:,4);
%%}
yy_U100 = Clustering_Information_U100(:,4);
yy_U500 = Clustering_Information_U500(:,4);
yy_O100 = Clustering_Information_O100(:,4);
yy_O500 = Clustering_Information_O500(:,4);

figure
axis([1000 1800 0 1])
hold on;
box on;

U100 = plot (x,yy_U100,'-b');
U500 = plot (x,yy_U500,'-b');
set(U100,'color','b','LineStyle','-','Marker','o','LineWidth',1)
set(U500,'color','b','LineStyle',':','Marker','o','LineWidth', 2)


L100 = plot (x,yy_L100,'-g');
L500 = plot (x,yy_L500,'-g');
set(L100,'color','g','LineStyle','-','Marker','*','LineWidth',1)
set(L500,'color','g','LineStyle',':','Marker','*','LineWidth', 2)

%%{
L100_C = plot (x,yy_L100_C,'-g');
L500_C = plot (x,yy_L500_C,'-g');
set(L100_C,'color','m','LineStyle','-','Marker','^','LineWidth',1)
set(L500_C,'color','m','LineStyle',':','Marker','^','LineWidth', 2)
%%}

O100 = plot (x,yy_O100,'-r');
O500 = plot (x,yy_O500,'-r');
set(O100,'color','r','LineStyle','-','Marker','s','LineWidth',1)
set(O500,'color','r','LineStyle',':','Marker','s','LineWidth', 2)

xlabel('Time(seconds)');
ylabel('Closeness Centrality');
legend('Unit R=100m','Unit R=500m','Log_M R=100m', 'Log_M R=500m','Log_C R=100m', 'Log_C R=500m','Obs R=100m', 'Obs R=500m');


%% Size of Largest Cluster

yy_L100 = Clustering_Information_L100(:,5);
yy_L500 = Clustering_Information_L500(:,5);
%%{
yy_L100_C = Clustering_Information_L100_C(:,5);
yy_L500_C = Clustering_Information_L500_C(:,5);
%%}
yy_U100 = Clustering_Information_U100(:,5);
yy_U500 = Clustering_Information_U500(:,5);
yy_O100 = Clustering_Information_O100(:,5);
yy_O500 = Clustering_Information_O500(:,5);

figure
axis([1000 1800 0 100])
hold on;
box on;

U100 = plot (x,yy_U100,'-b');
U500 = plot (x,yy_U500,'-b');
set(U100,'color','b','LineStyle','-','Marker','o','LineWidth',1)
set(U500,'color','b','LineStyle',':','Marker','o','LineWidth', 2)


L100 = plot (x,yy_L100,'-g');
L500 = plot (x,yy_L500,'-g');
set(L100,'color','g','LineStyle','-','Marker','*','LineWidth',1)
set(L500,'color','g','LineStyle',':','Marker','*','LineWidth', 2)

%%{
L100_C = plot (x,yy_L100_C,'-m');
L500_C = plot (x,yy_L500_C,'-m');
set(L100_C,'color','m','LineStyle','-','Marker','^','LineWidth',1)
set(L500_C,'color','m','LineStyle',':','Marker','^','LineWidth', 2)
%%}

O100 = plot (x,yy_O100,'-r');
O500 = plot (x,yy_O500,'-r');
set(O100,'color','r','LineStyle','-','Marker','s','LineWidth',1)
set(O500,'color','r','LineStyle',':','Marker','s','LineWidth', 2)

xlabel('Time (seconds)');
ylabel('Size of Largest Cluster');
legend('Unit R=100m','Unit R=500m','Log_M R=100m', 'Log_M R=500m','Log_C R=100m', 'Log_C R=500m','Obs R=100m', 'Obs R=500m');


%% Diameter of Clusters

yy_L100 = Clustering_Information_L100(:,6);
yy_L500 = Clustering_Information_L500(:,6);
%%{
yy_L100_C = Clustering_Information_L100_C(:,6);
yy_L500_C = Clustering_Information_L500_C(:,6);
%%}
yy_U100 = Clustering_Information_U100(:,6);
yy_U500 = Clustering_Information_U500(:,6);
yy_O100 = Clustering_Information_O100(:,6);
yy_O500 = Clustering_Information_O500(:,6);

figure
axis([1000 1800 0 20])
hold on;
box on;

U100 = plot (x,yy_U100,'-b');
U500 = plot (x,yy_U500,'-b');
set(U100,'color','b','LineStyle','-','Marker','o','LineWidth',1)
set(U500,'color','b','LineStyle',':','Marker','o','LineWidth', 2)


L100 = plot (x,yy_L100,'-g');
L500 = plot (x,yy_L500,'-g');
set(L100,'color','g','LineStyle','-','Marker','*','LineWidth',1)
set(L500,'color','g','LineStyle',':','Marker','*','LineWidth', 2)

%%{
L100_C = plot (x,yy_L100_C,'-m');
L500_C = plot (x,yy_L500_C,'-m');
set(L100_C,'color','m','LineStyle','-','Marker','^','LineWidth',1)
set(L500_C,'color','m','LineStyle',':','Marker','^','LineWidth', 2)
%%}

O100 = plot (x,yy_O100,'-r');
O500 = plot (x,yy_O500,'-r');
set(O100,'color','r','LineStyle','-','Marker','s','LineWidth',1)
set(O500,'color','r','LineStyle',':','Marker','s','LineWidth', 2)

xlabel('Time (seconds)');
ylabel('Diameter');
legend('Unit Range=100m','Unit Range=500m','Log Range=100m', 'Log Range=500m','Obstacle Range=100m', 'Obstacle Range=500m');



