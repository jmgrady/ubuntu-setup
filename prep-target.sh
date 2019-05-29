#!/bin/bash

sudo apt-get -y update
sudo apt-get -y upgrade
sudo apt-get -y install software-properties-common python python-pip apt-transport-https aptitude

echo -e "\n\n\tTarget Prep script has run.\n\tYou may now 'exit'.\n"
