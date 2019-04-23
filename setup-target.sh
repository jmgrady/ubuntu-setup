#!/bin/bash

##########################
#
# setup-target.sh
#
# setup-target.sh will initialize an Ubuntu machine so that it can be used
# as an Ubuntu SERVER for the Rapid Language Collection tool.  It will install
# and run a simple script to prep the target for ansible scripts that will be
# run to complete the setup.
#
# Requirements
#  - target
#    * ssh-server
#
#  - host
#    * ssh-client
#    * ansible
#    * git
#
# Usage:
#    setup-target.sh user@machinename
#
# To Do:
#  - consider adding -d & -s options to specify whether installing on Ubuntu
#    Desktop or Server respectively.
#

if [ $# -ne 1 ] ; then
  echo "Usage: $0 user@machinename"
else
  TARGET=$1;
  USER=`expr $TARGET : '\([^@]*\)@.*'`
  MACHINE=`expr $TARGET : '.*@\([^@]*\)$'`
  if [[ ! ( -n "$USER" && -n "$MACHINE" ) ]] ; then
    echo "Usage: $0 user@machinename"
    exit 1
  fi
  #echo "USER == $USER"
  #echo "MACHINE == $MACHINE"
  #exit 0
  echo "Setting up $TARGET"
  # Copy the actual setup script to the target machine
  rsync -avz prep-target.sh $TARGET:/tmp
  ssh $TARGET chmod +x /tmp/prep-target.sh

  echo "*************************************************************"
  echo -e "\nOpening a secure shell connection to $TARGET. Run:"
  echo -e "\n\t/tmp/prep-target.sh"
  echo -e "\n\tExit the secure shell when complete."
  echo "*************************************************************"
  ssh $TARGET
  ssh $TARGET rm /tmp/prep-target.sh

  ansible-playbook -i hosts playbook_setup.yml --limit $MACHINE -K
fi
