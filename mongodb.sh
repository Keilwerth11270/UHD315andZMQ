#!/bin/bash

# Exit script on any error
set -e

cd

# Update packages and install dependencies
echo "Updating packages and installing dependencies..."
sudo apt update
sudo apt install -y gnupg python3-pip python3-setuptools python3-wheel ninja-build build-essential flex bison git cmake libsctp-dev libgnutls28-dev libgcrypt-dev libssl-dev libidn11-dev libmongoc-dev libbson-dev libyaml-dev libnghttp2-dev libmicrohttpd-dev libcurl4-gnutls-dev libnghttp2-dev libtins-dev libtalloc-dev meson
sleep 5

# Install MongoDB
echo "Installing MongoDB..."
curl -fsSL https://pgp.mongodb.com/server-6.0.asc | sudo gpg -o /usr/share/keyrings/mongodb-server-6.0.gpg --dearmor
echo "deb [ arch=amd64,arm64 signed-by=/usr/share/keyrings/mongodb-server-6.0.gpg] https://repo.mongodb.org/apt/ubuntu focal/mongodb-org/6.0 multiverse" | sudo tee /etc/apt/sources.list.d/mongodb-org-6.0.list
sudo apt update
sudo apt install -y mongodb-org
sudo systemctl start mongod
sudo systemctl enable mongod
sleep 5

# Set up TUN device (not persistent after rebooting)
echo "Setting up TUN device..."
sudo ip tuntap add name ogstun mode tun
sudo ip addr add 10.45.0.1/16 dev ogstun
sudo ip addr add 2001:db8:cafe::1/48 dev ogstun
sudo ip link set ogstun up
sleep 5

# Clone Open5GS repository
echo "Cloning Open5GS repository..."
git clone https://github.com/open5gs/open5gs
cd open5gs
sleep 5

# Compile with meson
echo "Compiling with meson..."
meson build --prefix=`pwd`/install
ninja -C build
sleep 5

# Run test programs
echo "Running test programs..."
./build/tests/registration/registration
sleep 5

# Install Open5GS
echo "Installing Open5GS..."
cd build
ninja install
cd ../
sleep 5

echo "Open5GS installation completed successfully!"
