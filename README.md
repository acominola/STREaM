# STREaM - STochastic Residential water End-use Model

This repository contains the code of **STREaM, the STochastic Residential water End-use Model**, a stochastic simulation model to generate synthetic time series of water end uses with diverse sampling resolutions. 

**STREaM** allows the generation of residential water demand traces at the end-use level up to a 10-second resolution. Each water end-use fixture in our model is characterized by its signature (i.e., typical consumption pattern), as well as its probability distributions of number of uses per day, single use durations, water demand contribution and time of use during the day. **STREaM**  is calibrated on a large dataset including observed and disaggregated water end-uses from over 300 single-family households in nine U.S. cities [(DeOreo, 2011)](http://www.aquacraft.com/wp-content/uploads/2015/10/Analysis-of-Water-Use-in-New-Single-Family-Homes.pdf).

**Requirements:** Matlab - STREaM has been developed and tested on Matlab R2016a

**Citation:** [Cominola, A., Giuliani, M., Castelletti, A., Rosenberg, D. E., & Abdallah, A. M. (2018). Implications of data sampling resolution on water use simulation, end-use disaggregation, and demand management. Environmental Modelling & Software, 102, 199-212.](https://www.sciencedirect.com/science/article/pii/S1364815217311301)

### Getting started
The main Matlab file to run STREaM is [```MAIN_STREAM.m```](https://github.com/acominola/STREaM/blob/master/MAIN_STREaM.m).

Users should set the following input settings, before running the file:
- HOUSEHOLD SIZE
```matlab
% --- A. Household size setting
param.HHsize = 2; % This parameter should be in the interval (1,6).
% From 1 to 5, it indicates the number of people living in the
% house. 6 means ">5".
```
- PRESENCE OF END USES (available fixtures in this version of STREaM are toilet, shower, faucet, clothes washer, dishwasher, bathtub) AND THEIR EFFICIENCY (in the code below "St" refers to "Standard" fixtures, "HE" to "High-efficiency" fixtures):

```matlab
% --- B. Water consuming fixtures selection
% Legend:
% 0 = not present
% 1 = present

param.appliances.StToilet = 1;
param.appliances.HEToilet = 0;

param.appliances.StShower = 1;
param.appliances.HEShower = 0;

param.appliances.StFaucet = 1;
param.appliances.HEFaucet = 0;

param.appliances.StClothesWasher = 1;
param.appliances.HEClothesWasher = 0;

param.appliances.StDishwasher = 1;
param.appliances.HEDishwasher = 0;

param.appliances.StBathtub = 1;
param.appliances.HEBathtub = 0;
```
- LENGTH OF THE SIMULATION HORIZON
```matlab
% --- C. Time horizon length setting
param.H = 365; % It is measured in [days]
```
- TIME SAMPLING RESOLUTION for synthetic data generation. It must be set in [10 seconds] units, e.g., for a desired sampling resolution of 1 minute, ```param.ts``` should be set to 6, for a resolution of 1 hour it should be set to 360, etc.
```matlab
% --- D. Time sampling resolution
param.ts = 1; % It is measured in [10 seconds] units. The maximum resolution allowed is 10 seconds (param.ts = 1).
```
After the above settings are defined, users can run the [```MAIN_STREAM.m```](https://github.com/acominola/STREaM/blob/master/MAIN_STREaM.m) script and it will produce as output the ```outputTrajectory.mat``` matlab structure. It contains the time series of water consumption for the defined house, simulation horizon, and sampling resolution for each end-use fixture, as well as their aggregate consumption.

All statistics, probability distributions, and end-use signatures needed by STREaM to run are contained in the [```database.mat```](https://github.com/acominola/STREaM/tree/master/_DATA.database.mat) file, in the [```DATA```](https://github.com/acominola/STREaM/tree/master/_DATA) subfolder.

### Authors
- [Andrea Cominola, Matteo Giuliani, Andrea Castelletti](http://www.nrm.deib.polimi.it/)  - NRM Group | Department of Electronics, Information, and Bioengineering | Politecnico di Milano
- [David E. Rosenberg, Adel M. Abdallah](http://rosenberg.usu.edu/) - Department of Civil and Environmental Engineering | Utah State University

### References
- **STREaM** is fully presented and tested in "Cominola, A., Giuliani, M., Castelletti, A., Rosenberg, D. E., & Abdallah, A. M. (2018). Implications of data sampling resolution on water use simulation, end-use disaggregation, and demand management. Environmental Modelling & Software, 102, 199-212."([download here](https://www.sciencedirect.com/science/article/pii/S1364815217311301))
- **STREaM** derives from the prototype of stochastic simulation model presented in "Cominola, A., Giuliani, M., Castelletti, A., Abdallah, A. M., and Rosenberg, D. E., 2016. Developing a stochastic simulation model for the generation of residential water end-use demand time series. In Proceedings of the 8th International Congress on Environmental Modelling and Software (iEMSs 2016), Toulouse, FR, 10-14 July 2016." ([download here](http://scholarsarchive.byu.edu/cgi/viewcontent.cgi?article=1606&context=iemssconference))

### License

Copyright (C) 2017 Andrea Cominola, Matteo Giuliani, Andrea Castelletti, David E. Rosenberg, and Adel M. Abdallah. Released under the [GNU General Public License v3.0](LICENSE).
The code is distributed in the hope that it will be useful, but WITHOUT ANY WARRANTY; without even the implied warranty of MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE. See the GNU General Public License for more details.
You should have received a copy of the GNU General Public License along with STREaM. If not, see http://www.gnu.org/licenses/licenses.en.html.
