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


su tsm -c "sudo /opt/tableau/tableau_server/packages/customer-bin.${TABLEAU_SERVER_DATA_DIR_VERSION}/tsm maintenance restore -u tsm -p {TSM_PASSWORD} -f `ls -tr /var/opt/tableau/tableau_server/data/tabsvc/files/backups/ | sort | egrep 'tsbak$' | tail -1`" # 2>&1 1>> /var/log/tableau_docker.log
