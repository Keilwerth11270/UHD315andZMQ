#!/bin/bash

# Bash script to install UHD version 3.15.0.0

cd

# Exit script if any command fails
set -e

# Clone the UHD repository
echo ""
echo ""
echo ""
echo "Cloning UHD repository..."
sleep 3
git clone https://github.com/EttusResearch/uhd.git

# Change directory to the cloned repository
cd uhd

# Checkout the specified version
echo ""
echo ""
echo ""
echo "Checking out UHD version 3.15.0.0..."
sleep 3
git checkout v3.15.0.0

# Change directory to host and prepare for building
echo ""
echo ""
echo ""
cd host
mkdir build
cd build

# Generate Makefiles with CMake, build, and install
echo ""
echo ""
echo ""
echo "Configuring, building, and installing UHD..."
sleep 3
cmake ..
make

# Install UHD (requires root privileges)
echo ""
echo ""
echo ""
echo "Installing UHD, please enter your password if prompted..."
sleep 3
sudo make install

# Update the shared library cache
echo ""
echo ""
echo ""
echo "Updating the shared library cache..."
sleep 3
sudo ldconfig

echo "UHD installation completed successfully."
