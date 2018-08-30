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


id -u tableau || sudo adduser tableau -u 999 -g tableau && sudo cp /opt/tableau/tableau_server/packages/scripts.${TABLEAU_SERVER_DATA_DIR_VERSION}/user-at.service /etc/systemd/system/user@`id -u tableau`.service && systemctl enable user@`id -u tableau`.service

log systemctl start user@`id -u tableau`.service
systemctl start user@`id -u tableau`.service 2>&1 1>> /var/log/tableau_docker.log

# log waiting 300s before starting tsm
sleep 60

su tsm -c "sudo /opt/tableau/tableau_server/packages/customer-bin.${TABLEAU_SERVER_DATA_DIR_VERSION}/tsm start --username tsm --password ${TSM_PASSWORD}" 2>&1 1>> /var/log/tableau_docker.log

#log start tsm done
