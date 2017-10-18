## STREaM - STochastic REsidential water end-use Model

This repository contains the code of **STREaM, the STochastic REsidential water end-use Model**, a stochastic simulation model to generate synthetic time series of water end uses with diverse sampling resolutions. **STREaM** allows the generation of residential water demand traces at the end-use level up to a 10-second resolution. Each water end-use fixture in our model is characterized by its signature (i.e., typical consumption pattern), as well as its probability distributions of number of uses per day, single use durations, water demand contribution and time of use during the day. STREaM is calibrated on a large dataset including observed and disaggregated water end-uses from over 300 single-family households in nine U.S. cities.

**Getting started**

**Authors**
- Andrea Cominola, Matteo Giuliani, Andrea Castelletti - [NRM Group](http://www.nrm.deib.polimi.it/) | Department of Electronics, Information, and Bioengineering | Politecnico di Milano
- [David E. Rosenberg](http://rosenberg.usu.edu/), Adel M. Abdallah - Department of Civil and Environmental Engineering | Utah State University

**References**
- **STREaM** is fully presented and tested in "Cominola, A., Giuliani, M., Castelletti, A., Rosenberg, D. E., and Abdallah, A. M., (*under review*). Implications of data sampling resolution on water use simulation, end-use disaggregation, and demand management"
- **STREaM** derives from the prototype of stochastic simulation model presented in "Cominola, A., Giuliani, M., Castelletti, A., Abdallah, A. M., and Rosenberg, D. E., 2016. Developing a stochastic simulation model for the generation of residential water end-use demand time series. In Proceedings of the 8th International Congress on Environmental Modelling and Software (iEMSs 2016), Toulouse, FR, 10-14 July 2016." ([download here](http://scholarsarchive.byu.edu/cgi/viewcontent.cgi?article=1606&context=iemssconference))

**License**

Copyright (C) 2017 Andrea Cominola, Matteo Giuliani, Andrea Castelletti, David E. Rosenberg, and Adel M. Abdallah. Released under the [GNU General Public License v3.0](LICENSE).
The code is distributed in the hope that it will be useful, but WITHOUT ANY WARRANTY; without even the implied warranty of MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE. See the GNU General Public License for more details.
You should have received a copy of the GNU General Public License along with STREaM. If not, see http://www.gnu.org/licenses/licenses.en.html.
