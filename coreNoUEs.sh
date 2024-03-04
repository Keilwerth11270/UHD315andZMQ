#!/bin/bash

# Install MongoDB and required packages for Open5GS
echo ""
echo ""
echo ""
echo "Starting MongoDB services..."
sleep 3
sudo systemctl start mongodb
sudo systemctl enable mongodb

cd

# Clone Open5GS from the GitHub repository
echo ""
echo ""
echo ""
echo "Cloning Open5GS from GitHub..."
sleep 3
git clone https://github.com/open5gs/open5gs
cd open5gs

# Build Open5GS
echo ""
echo ""
echo ""
echo "Building Open5GS..."
sleep 3
meson build --prefix=`pwd`/install
ninja -C build

# Edit the configuration file
echo ""
echo ""
echo ""
echo "Opening configuration file for editing..."
sleep 3
cd build/configs
sudo nano sample.yaml
# The script pauses here, allowing the user to edit the file in nano.
# Once the user saves their changes and exits nano, the script will continue.

# Continue with the Open5GS installation
echo ""
echo ""
echo ""
echo "Continuing with Open5GS installation..."
sleep 3
cd ..
ninja install
cd tests/app
# Run the Open5GS core

echo ""
echo ""
echo ""
echo "Running the 5G core to test the deployment..."
sleep 3
sudo ./5gc
