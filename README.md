This repository contains scripts that will automatically pull all of the necessary libraries to install an Open5Gs core, UHD version 3.15.0.0, ZeroMQ, and srsRAN gNB. The context behind this set of scripts is that I need to create gNBs that can connect to a Near-RT RIC. I _do not_ plan on using them to connect to any UEs, or actually simulate network traffic. As such, these scripts will not actually go through the full procedure to allow for those capabilities from the core and gNB side. However, _the UHD and ZMQ installations are legit_. Aside from the core and gNB installation scripts, the other three scripts (init.sh, uhd315.sh, zmq.sh) will be quite useful in any actual deployment involving real SDRs or UEs. Please feel free to use them.  
  
_**One thing to note is that the official documentation for srsRAN gNB and Open5Gs core are missing a few libaries in their procedure. My init.sh script takes care of that. This is up to date as of 3/3/2024, and works for the latest version of Open5Gs and srsRAN gNB.**_ 
  
# Scripts Overview  
The setup process involves the following scripts, which must be run in the order specified:
  
**1. init.sh**  
This script initializes your system by updating and upgrading existing packages. It installs the prerequisites for the aforementioned tools. It ensures that all necessary libraries are installed before proceeding with the core network and radio access network (RAN) configurations.
  
**2. uhd315.sh**  
The uhd315.sh script focuses on installing UHD (USRP Hardware Driver) version 3.15.0.0, which is crucial for ensuring compatibility with certain SDR (Software Defined Radio) hardware. This step is vital for setups that involve actual SDR hardware for signal processing, although it might be skipped in purely simulated environments.
  
**3. zmq.sh**  
zmq.sh is dedicated to installing ZeroMQ (ZMQ) libraries from source. ZMQ is a high-performance asynchronous messaging library, used here to simulate radio interfaces in the absence of physical SDR hardware. This script clones and builds libzmq and czmq, laying the groundwork for srsRAN's ZMQ-based radio access network simulation.
  
**4. coreNoUEs.sh**  
This script installs and configures Open5GS, a core network software package. It involves cloning the Open5GS repository, building the software, and modifying a configuration file. Note that this installation is developed for an Ubuntu server based deployment of a gNB. Open5Gs, as far as I am aware, requires a WebUI in order to actually add UEs. As such, this script is not beneficial for anyone hoping to deploy a setup where COTS UEs are involved. As for what changes you need to make to the configuration file, they should be available by digging through the official documentation. Feel free to contact me if you're having any issues.
  
**5. srsRANgNBZMQ.sh**  
Finally, srsRANgNBZMQ.sh script clones, builds, and installs srsRAN with ZMQ support, specifically configuring it to function as a gNB. It leverages a pre-configured gnb_zmq.yaml file, which should be present in the repository. This file is crucial for defining the gNB's operational parameters and its interaction with the core network and simulated UE (User Equipment) environment.
  
# Execution Order  
To set up your environment, follow these steps in order:  
  
Run ./init.sh to install all necessary dependencies and tools.  
Execute ./uhd315.sh to install the UHD software compatible with our setup.  
Use ./zmq.sh to prepare ZMQ libraries for radio interface simulation.  
Proceed with ./coreNoUEs.sh to set up the Open5GS core network.  
Finally, deploy ./srsRANgNBZMQ.sh to establish the gNB with ZMQ support.  
  
Ensure that each script completes successfully before proceeding to the next. Should any issues arise during execution, consult the script output for troubleshooting insights.
