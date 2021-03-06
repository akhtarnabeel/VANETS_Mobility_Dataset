# VANETS Mobility Dataset

## Data Sets for "Vehicle Mobility and Communication Channel Models for Realistic and Effcient VANET Highway Simulation"

### Abstract:

Developing real-time safety and non-safety applications for vehicular ad hoc networks (VANETs) requires understanding the dynamics of the network topology characteristics since these dynamics determine both the performance of routing protocols and the feasibility of an application over VANET. Using various key metrics of interest including node degree, neighbor distribution, number of clusters and link duration, we provide a realistic analysis of the VANET topology characteristics over time and space for highway scenario. In this analysis, we integrate realworld road topology and real-time data extracted from the Freeway Performance Measurement System (PeMS) database into a microscopic mobility model to generate realistic traffic flows along the highway. Moreover, we use a more realistic, recently proposed, obstacle-based channel model and compare the performance of this sophisticated model to the most commonly used more simplistic channel models including the unit disc and log-normal shadowing models. Our investigation on the key metrics reveal that both log normal and unit disc models fail to provide realistic VANET topology characteristics. We therefore propose a matching mechanism to tune the parameters of the lognormal model according to the vehicle density and a correlation model to take into account the evolution of the link characteristics over time. The proposed method has been demonstrated to provide a good match with more sophisticated but computationally expensive and difficult to implement obstacle based model and validated over the real data of two different highways in California.

### Paper Details:
- Nabeel Akhtar, Sinem Coleri Ergen, and Oznur Ozkasap <br>
  **Vehicle Mobility and Communication Channel Models for Realistic and Efficient Highway VANET Simulation** <br>
  *IEEE Transactions on Vehicular Technology (TVT), vol. 64, no. 1, pp. 248-262, January 2015* <br>
  ***:trophy:`[IEEE Vehicular Technology Society 2020 Neal Shepherd Memorial Best Propagation Paper Award]`:1st_place_medal:***<br>
  [\[PDF\]](https://akhtarnabeel.github.io/papers/TVT.pdf) [\[Bibtex\]](https://akhtarnabeel.github.io/papers/bib/TVT.txt)

## Dataset:
We have included dataset here for Mobility of vehicles and results collected after running different channel models.

### Mobility Dataset:
Mobility dataset includes the mobility of vehicles on the road. You can use the files provided to generate realistic mobility of vehicles on SUMO. 
Data is provided for seven different densities of traffic on road I880-S and I5-S in the state of Califiornia. 
For each density of traffic, we provide "Mobility.tcl" file which is generated by SUMO and contains the mobility traces of the vehicles on the road. We have also provided "output.rou.xml" file, which contains the routing information for each vehciles on the road. This file is given to SUMO as input to generate "Mobility.tcl" file. 

Dataset are arranged in desending order of vehicle density i.e. Density 1 is highest density while Density 7 is the low density. 
Go to ["Highway/MOBILITY/"](Highway/MOBILITY/) folder for the dataset. 

### Performance Metrics:
Here we provide files that can be used to analyze data generated after running different channel models on the "Mobility.tcl" file generated by SUMO for Highway I880-S. 

Data is provided for 'High Density' and 'Low Density' traffic. For each of the two densities, we provide "Metrics" and "Mobility". 

"Metrics" contains code for genrating graphs for different performance metrics like Neighbour Distance Distirbution, Node Degree, Link Duration, No. of Clusters, Closeness Centrality, Clustering Coefficient and Size of Largest Cluster. The code can be run on any machine which has Matlab installed in it. 

"Mobility" contains code for generating figures related with mobility of vehicles like for generating graphs for 'Flow', 'Speed' and 'Error in flow and speed'. It also contains input files for the SUMO that can be used to generate traces for vehicles for low and high density traffic. 

Go to [Highway/PERFORMANCE_METRICS/](/Highway/PERFORMANCE_METRICS/) folder for this dataset. 




