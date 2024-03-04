#!/bin/bash

cd

# Install libzmq from source
echo ""
echo ""
echo ""
echo "Installing libzmq from source..."
sleep 3
git clone https://github.com/zeromq/libzmq.git
cd libzmq
sudo ./autogen.sh
sudo ./configure
sudo make
sudo make install
sudo ldconfig
cd


# Install czmq from source
echo ""
echo ""
echo ""
echo "Installing czmq from source..."
sleep 3
git clone https://github.com/zeromq/czmq.git
cd czmq
sudo ./autogen.sh
sudo ./configure
sudo make
sudo make install
sudo ldconfig
cd

echo "ZMQ libraries installation from source completed."
