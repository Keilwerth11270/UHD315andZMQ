#!/bin/bash

cd

# Step 1: Clone srsRAN_Project from the specified repository
echo ""
echo ""
echo ""
echo "Cloning srsRAN_Project for our gNB"
sleep 3
git clone https://github.com/srsran/srsRAN_Project.git
cd srsRAN_Project

# Step 2: Build srsRAN_Project
echo ""
echo ""
echo ""
echo "Building srsRAN_Project..."
sleep 3
mkdir build
cd build
cmake ../ -DENABLE_EXPORT=ON -DENABLE_ZEROMQ=ON
make -j`nproc`
sudo make install
sleep 3

# Step 3: Move the gnb_zmq.yaml configuration file to srsRAN_Project/configs
echo ""
echo ""
echo ""
echo "Moving the gnb_zmq.yaml configuration file to srsRAN_Project/configs..."
cd ../configs
mv ../../UHD315andZMQ/gnb_zmq.yaml ./
sleep 3

echo "srsRAN gNB setup completed. Configuration file is in place."
