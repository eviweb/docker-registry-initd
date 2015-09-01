#! /bin/bash
DIR=$(dirname $(readlink -f "$0"))
INITD=/etc/init.d
UNINSTALL=0

# installer usage
usage() {
    echo "
    Usage:
        ./install.sh [OPTIONS]

    Options:
        -u      uninstall docker-registry start-up script
        -h      display this message

    Install/uninstall docker-registry start-up script
"
}

# check for root privileges
check_root() {
    if [ `whoami` != "root" ]
    then
        echo "Please grant root privileges before running this script..."
        exit 1
    fi
}

# install the start-up script
install() {
    ln -s ${DIR}/docker-registry ${INITD}/
    update-rc.d docker-registry defaults
}

# uninstall the start-up script
uninstall() {    
    update-rc.d docker-registry remove
    unlink ${INITD}/docker-registry
}

OPTIONS=":hsu"
# get command line options
while getopts $OPTIONS option
do
    case $option in
        u) UNINSTALL=1;;
        *) usage && exit 1;;
    esac
done
shift $(($OPTIND - 1 ))

check_root

if [ ${UNINSTALL} -eq 0 ]
then
    install
else
    uninstall
fi
