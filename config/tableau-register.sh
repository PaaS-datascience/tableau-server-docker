#!/bin/bash

# Exit on first error:w
set -e

source /etc/profile.d/tableau_server.sh

LOGFILE=/var/log/tableau_docker.log
RETAIN_NUM_LINES=10000

function logsetup {  
    TMP=$(tail -n $RETAIN_NUM_LINES $LOGFILE 2>/dev/null) && echo "${TMP}" > $LOGFILE
    exec > >(tee -a $LOGFILE)
    exec 2>&1
}

function log {  
    echo "[$(date --rfc-3339=seconds)]: $*"
}

su tsm -c "sudo -E /opt/tableau/tableau_server/packages/customer-bin.*/tsm login --username tsm --password ${TSM_PASSWORD}" 2>&1 1>> /var/log/tableau_docker.log
log login tsm done

log register
su tsm -c "sudo -E /opt/tableau/tableau_server/packages/customer-bin.*/tsm register --file /opt/tableau/docker_build/registration_file.json" 2>&1 1>> /var/log/tableau_docker.log
log register done


