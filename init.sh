#!/bin/bash

cd

# Ensure the system is up-to-date
echo "Updating and upgrading your system..."
sleep 3
sudo apt update && sudo apt upgrade -y

echo ""
echo ""
echo ""

# Install MongoDB and its prerequisites
echo "Installing MongoDB and its prerequisites..."
sleep 3
sudo apt install -y gnupg mongodb

echo ""
echo ""
echo ""

# Install dependencies for Open5GS
echo "Installing dependencies for Open5GS..."
sleep 3
sudo apt install -y python3-pip python3-setuptools python3-wheel ninja-build build-essential flex bison git cmake libsctp-dev libgnutls28-dev libgcrypt-dev libssl-dev libidn11-dev libmongoc-dev libbson-dev libyaml-dev libnghttp2-dev libmicrohttpd-dev libcurl4-gnutls-dev libnghttp2-dev libtins-dev libtalloc-dev meson libtool libdw-dev binutils-dev libdwarf-dev doxygen libmbedtls-dev libfftw3-dev libgtest-dev libyaml-cpp-dev libsctp-dev libboost-program-options-dev libconfig++-dev ca-certificates curl

echo ""
echo ""
echo ""

# Install UHD dependencies
echo "Installing UHD dependencies..."
sleep 3
sudo apt install -y cmake git libboost-all-dev libusb-1.0-0-dev libudev-dev libncurses5-dev libuhd-dev uhd-host

echo ""
echo ""
echo ""

# Install dependencies for srsRAN
echo "Installing dependencies for srsRAN..."
sleep 3
sudo apt-get install -y cmake make gcc g++ pkg-config libfftw3-dev libmbedtls-dev libsctp-dev libyaml-cpp-dev libgtest-dev

echo ""
echo ""
echo ""

# Install missing libraries for srsRAN
echo "Installing missing libraries for srsRAN..."
sleep 3
sudo apt-get install -y libyaml-cpp-dev libdw-dev binutils-dev libdwarf-dev libelf-dev

echo ""
echo ""
echo ""

# Install iPerf3 for network testing
echo "Installing iPerf3..."
sleep 3
sudo apt -y install iperf3

echo ""
echo ""
echo ""

echo "Installation of all dependencies is complete."
