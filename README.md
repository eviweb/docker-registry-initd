Docker Registry Startup Script
==============================
Script to start a docker registry at boot time and to stop it during shutdown.

> This assumes :
> * the docker compose config file is installed under the home directory of a docker user: `/home/docker/config/docker-compose.yml`
> * the docker compose tool is installed

How to
------
### Install the script
* Clone this repository `git clone  https://github.com/eviweb/docker-registry-initd`
* From within the `docker-registry-initd` directory, run the installer with root privileges: `sudo ./install.sh`

### Uninstall the script
* From within the `docker-registry-initd` directory, run the installer with root privileges, using the `-u` flag: `sudo ./install.sh -u`

Manage the service manually
---------------------------
### Start the registry service
Run: `sudo service docker-registry start`

### Stop the registry service
Run: `sudo service docker-registry stop`

### Restart the registry service
Run: `sudo service docker-registry restart`

### Check the registry service status
Run: `sudo service docker-registry status`

Credits
-------
* The start-up script is inspired by [**Felix H. Dahlke's** init-script-template](https://github.com/fhd/init-script-template.git)
* Docker compose can be found at: [https://github.com/docker/compose]()
