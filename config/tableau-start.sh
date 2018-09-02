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

log start tsm 
su tsm -c "sudo /opt/tableau/tableau_server/packages/customer-bin.*/tsm start --username tsm --password ${TSM_PASSWORD}" 2>&1 1>> /var/log/tableau_docker.log
log start tsm done

