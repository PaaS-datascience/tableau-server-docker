#!/bin/bash

# Exit on first error:w
set -e

LOGFILE=/var/log/tableau_docker.log
RETAIN_NUM_LINES=10000
#RANDOM_PASSWORD=`date +%s | sha256sum | base64 | head -c 32 ; echo` 
echo TSM_PASSWORD ${TSM_PASSWORD}

function logsetup {  
    TMP=$(tail -n $RETAIN_NUM_LINES $LOGFILE 2>/dev/null) && echo "${TMP}" > $LOGFILE
    exec > >(tee -a $LOGFILE)
    exec 2>&1
}

function log {  
    echo "[$(date --rfc-3339=seconds)]: $*"
}

logsetup

if [ -f /opt/tableau/docker_build/.init-done ]; then

log tsm already initialized

log reinitialize user systemd and httpd rights
export unprivileged_username=tableau
export unprivileged_uid=`id -u ${unprivileged_username}`
source /opt/tableau/tableau_server/packages/scripts.*/after-install-common
setup_basic_variables
echo $version_string
setup_systemd
su tsm -c "sudo -E setcap cap_net_bind_service+ep /opt/tableau/tableau_server/packages/apache.*/bin/httpd"
log systemd ok

log start tsm
su tsm -c "sudo /opt/tableau/tableau_server/packages/customer-bin.*/tsm start --username tsm --password ${TSM_PASSWORD}" 2>&1 1>> /var/log/tableau_docker.log
log start tsm done

else


source /etc/profile.d/tableau_server.sh
`cat /proc/1/environ | tr '\0' '\n' | sed 's/^\s*/export /g' | egrep 'http_proxy|https_proxy|ADMIN_PASSWORD|TSM_PASSWORD'`

log update TSM_PASSWORD
echo tsm:${TSM_PASSWORD} | chpasswd

log start initalize tsm
log `date`
su tsm -c "sudo chown tableau:tableau /var/opt/tableau/. "
su tsm -c "sudo -E sh -x /opt/tableau/tableau_server/packages/scripts.*/initialize-tsm --http_proxy=$http_proxy --https_proxy=$https_proxy -f --accepteula" 2>&1 1>> /var/log/tableau_docker.log
log initalize done 

log login tsm ... 
su tsm -c "sudo -E /opt/tableau/tableau_server/packages/customer-bin.*/tsm login --username tsm --password ${TSM_PASSWORD}" 2>&1 1>> /var/log/tableau_docker.log
log login tsm done

log licenses activate
su tsm -c "sudo -E /opt/tableau/tableau_server/packages/customer-bin.*/tsm licenses activate -t" 2>&1 1>> /var/log/tableau_docker.log
log licenses activate done 

log register 
su tsm -c "sudo -E /opt/tableau/tableau_server/packages/customer-bin.*/tsm register --file /opt/tableau/docker_build/registration_file.json" 2>&1 1>> /var/log/tableau_docker.log
log register done

log settings import
su tsm -c "sudo -E /opt/tableau/tableau_server/packages/customer-bin.*/tsm settings import -f /opt/tableau/docker_build/tableau_config.json" 2>&1 1>> /var/log/tableau_docker.log
log settings import done

log pending-changes apply
su tsm -c "sudo -E /opt/tableau/tableau_server/packages/customer-bin.*/tsm pending-changes apply --ignore-prompt" 2>&1 1>> /var/log/tableau_docker.log
log penging-changes apply done

log initalize server
#((su tsm -c "sudo /opt/tableau/tableau_server/packages/customer-bin.${TABLEAU_SERVER_DATA_DIR_VERSION}/tsm initialize" 2>&1 1>> /var/log/tableau_docker.log) && log initalize server done) &
(su tsm -c "sudo /opt/tableau/tableau_server/packages/customer-bin.*/tsm initialize --start-server --request-timeout 2000" 2>&1 1>> /var/log/tableau_docker.log) && log initialize server done || log initialize server shortened

log initialuser 
su tsm -c "sudo -E /opt/tableau/tableau_server/packages/bin.*/tabcmd initialuser --server localhost:80 --username latelier_admin --password ${ADMIN_PASSWORD}" 2>&1 1>> /var/log/tableau_docker.log
log initial user login is latelier_admin password ${ADMIN_PASSWORD}

log backup services conf
tar cvzf /opt/tableau/docker_build/services.after.install.tgz /etc/security/limits.d/*tableau_server* /etc/systemd/logind.conf.d/tableau_server* /etc/systemd/system/user@*.service /etc/systemd/system/default.target.wants/user@*.service 
log all done

touch /opt/tableau/docker_build/.init-done

fi
