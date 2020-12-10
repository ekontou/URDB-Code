## Utility Rate Database Data Processing for EV Public Charging Operational Cost Analysis
This code was used to analyze 7,506 electricity rates applicable to direct current fast charging from the [Utility Rate Database](https://openei.org/wiki/Utility_Rate_Database). The outcomes of this study have been published at the **[Renewable and Sustainable Energy Reviews (RSER)](https://www.journals.elsevier.com/renewable-and-sustainable-energy-reviews)** journal and the work can be cited as follows:

Muratori, M., **Kontou, E.**, & Eichman, J. (2019). Electricity rates for electric vehicle direct current fast charging in the United States. Renewable and Sustainable Energy Reviews, 113, 109235. **[Link](https://doi.org/10.1016/j.rser.2019.06.042)**

### More information on the matlab code
* DataURDB.mat includes all the variables required for this analysis such as energy and demand charges of the electricity rates and their time of day and seasonal variations. Please note that in this analysis we only include rates that have energy and demand tariff structures and we exclude other tariffs with, for example, critical peak pricing, locational marginal pricing, and other tariff structures) for comparison purposes.
* StackedBarGraphs.m is the main file that calls functions from the rest and simulates the utility billing process. It generates the RSER paper's graphs, portraying median costs of electricity under different electricity tariff schemes for various electric vehicle charging scenarios and specifications. 


