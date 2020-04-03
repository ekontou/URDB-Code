## Utility Rate Database Data Processing for EV Charging Costs Analysis
This code was used to analyze 7,506 electricity rates applicable to direct current fast charging from the [Utility Rate Database](https://openei.org/wiki/Utility_Rate_Database). The outcomes of this study have been published at the [Renewable and Sustainable Energy Reviews](https://www.journals.elsevier.com/renewable-and-sustainable-energy-reviews) journal and the work can be cited as follows:\
Muratori, M., **Kontou, E.**, & Eichman, J. (2019). Electricity rates for electric vehicle direct current fast charging in the United States. Renewable and Sustainable Energy Reviews, 113, 109235. 

More info on the matlab code
* DataURDB.mat includes all the variables required for this analysis including energy and demand charges of rates and their time of day and seasonal variations (please note that in this analysis we only include rates that have energy and demand charges structure and we exclude other rates with critical peak pricing, locational marginal pricing, etc.)
* StackedBarGraphs.m is the main file that generates the graphic outcomes portraying the median costs of electricity under different electricity rates schemes for various electric vehicle recharging scenarios.


