#!/bin/bash
# Bash script to install UHD version 3.15.0.0

# Exit script if any command fails
set -e

# Clone the UHD repository
echo -e "\n\nCloning UHD repository..."
sleep 3
git clone https://github.com/EttusResearch/uhd.git

# Change directory to the cloned repository
cd uhd

# Checkout the specified version
echo -e "\n\nChecking out UHD version 3.15.0.0..."
sleep 3
git checkout v3.15.0.0

# Change directory to host and prepare for building
echo -e "\n\nPreparing build environment..."
cd host
mkdir build
cd build

# Set compiler to gcc-10 and g++-10
echo -e "\n\nSetting compiler to GCC 10..."
export CC=$(which gcc-10)
export CXX=$(which g++-10)

# Generate Makefiles with CMake, build, and install
echo -e "\n\nConfiguring, building, and installing UHD..."
sleep 3
cmake .. -DCMAKE_BUILD_TYPE=Release
make -j$(nproc)

# Install UHD (requires root privileges)
echo -e "\n\nInstalling UHD, please enter your password if prompted..."
sleep 3
sudo make install

# Update the shared library cache
echo -e "\n\nUpdating the shared library cache..."
sleep 3
sudo ldconfig

echo "UHD installation completed successfully."
