# ubuntu-setup #

**ubuntu-setup** is a collection of Ansible playbooks that can be use to configure a new installation of Ubuntu Desktop.  Each playbook uses a set of Ansible roles to drive the configurations.  Some roles are also appropriate for Ubuntu Server.

## Setup Script ##
A setup script, setup-target.sh is provided to perform the installation.  Its usage is:
```
./setup-target [-c|--copyid-h|--help|-t] user@machinename
```

### Arguments: ###

#### -c or --copyid ####

use ```ssh-copy-id``` to copy your ssh id to the target machine before running the playbook to setup the machine.  This obviates the need to enter your password every time that you connect to the machine.

#### -h or --help ####
print the basic usage message.  The usage message is also printed if the script is run without a user@machine name argument.

#### -t ####
for *testing*.  Prints internal script variables after parsing the arguments and exits.  No set up will be done if the -t option is specified.

## Roles ##

  **ansible-depends** - installs the packages required to run subsequent Ansible
  modules

  **headless** - sets configuration options that make sense when the device will be used as a headless node, such as, configuring the power button to shutdown when there is no display to confirm or to choose between Shutdown, Restart and Cancel.  This is intended for a Server installation.

  **mediaplayer** - installs various media tools, such as spotify and clementine.  This role requires a Desktop installation.

  **setup_apache** - installs the apache2 web server

  **setup_mongodb** - installs the MongoDB database (from mongodb.org, *not* the Ubuntu package) and installs it as a service

  **wifi_ap** - sets up the wifi interface as a wifi access point (hotspot)
