EDITOR=vim

export PORT=8080
export COMPOSE_PROJECT_NAME=latelier

include /etc/os-release
export TABLEAU_VERSION=2018-2-0
#TARGET_OS=ubuntu
export TARGET_OS=centos
export TSM_PASSWORD=*ch4NG_m3!
export ADMIN_PASSWORD=*ch4NG_m3:t00!

dummy               := $(shell touch artifacts)
include ./artifacts

clean:
	docker stop tableau-server || echo 
	docker container rm tableau-server || echo
	docker image prune -f
	docker system prune -f
	docker image rm tableau-server || echo
	sudo rm -rf data/ run/ etc/ log/ 
	sudo mkdir -p etc/opt/ etc/systemd/system
	sudo mkdir -p etc/systemd/system/multi-user.target.wants 
	sudo chmod 777 data/. run/. etc/. log/. etc/opt/. etc/systemd/system/. etc/systemd/system/multi-user.target.wants/.
	sudo ln -s /lib/systemd/system/multi-user.target etc/systemd/system/default.target
	sudo cp config/tableau_server_install.service etc/systemd/system/
	sudo rm config/.init-done || echo

download:
ifeq ($(TARGET_OS),ubuntu)
	@echo downloading packages for Tableau ${TABLEAU_VERSION} for ${TARGET_OS}
	@mkdir -p download
	@wget -q -P download/ -c https://downloads.tableau.com/esdalt/${TABLEAU_VERSION}/tableau-tabcmd-${TABLEAU_VERSION}_all.deb
	@wget -q -P download/ -c https://downloads.tableau.com/esdalt/${TABLEAU_VERSION}/tableau-server-${TABLEAU_VERSION}_amd64.deb
endif
ifeq ($(TARGET_OS),centos) 
	@echo downloading packages for Tableau ${TABLEAU_VERSION} for ${TARGET_OS}
	@mkdir -p download
	@wget -q -P download/ -c https://downloads.tableau.com/esdalt/`echo ${TABLEAU_VERSION} | sed 's/-/\./g'`/tableau-server-${TABLEAU_VERSION}.x86_64.rpm
	@wget -q -P download/ -c https://downloads.tableau.com/esdalt/`echo ${TABLEAU_VERSION} | sed 's/-/\./g'`/tableau-tabcmd-${TABLEAU_VERSION}.noarch.rpm
endif

install-prerequisites:
ifeq ("$(wildcard /usr/bin/docker)", "")
        @echo install docker-ce, still to be tested
        sudo apt-get update
        sudo apt-get install \
        apt-transport-https \
        ca-certificates \
        curl \
        software-properties-common

        curl -fsSL https://download.docker.com/linux/${ID}/gpg | sudo apt-key add -
        sudo add-apt-repository \
                "deb https://download.docker.com/linux/ubuntu \
                `lsb_release -cs` \
                stable"
        sudo apt-get update
        sudo apt-get install -y docker-ce
        sudo curl -L https://github.com/docker/compose/releases/download/1.19.0/docker-compose-`uname -s`-`uname -m` -o /usr/local/bin/docker-compose
        sudo chmod +x /usr/local/bin/docker-compose
endif

network: 
	@docker network create latelier 2> /dev/null; true

rebuild: clean
	docker-compose -f docker-compose-${TARGET_OS}.yml --verbose build --force-rm --no-cache

build:
	docker-compose -f docker-compose-${TARGET_OS}.yml --verbose build 

init:
	docker exec -it tableau-server /opt/tableau/docker_build/tableau-init-configure.sh

status:
	docker exec -it tableau-server /opt/tableau/docker_build/tableau-status.sh

up: network
	docker-compose -f docker-compose-${TARGET_OS}.yml up -d

start: up
	docker exec -it tableau-server /opt/tableau/docker_build/tableau-start.sh

stop:
	docker exec -it tableau-server /opt/tableau/docker_build/tableau-stop.sh || echo stop failed

down: stop
	docker-compose -f docker-compose-${TARGET_OS}.yml down

restart: stop start

config/registration_file.json: 
	cp config/registration_file.json.templ config/registration_file.json
	$(EDITOR) config/registration_file.json

regconfig: config/registration_file.json

all: download install-prerequisites regconfig build

