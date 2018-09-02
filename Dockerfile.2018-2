# Run `make run` to get things started

# our image is centos default image with systemd
FROM centos/systemd
ARG TABLEAU_VERSION
ENV TABLEAU_VERSION $TABLEAU_VERSION
ARG proxy
ENV http_proxy $proxy
ENV https_proxy $proxy
ARG TSM_PASSWORD
ENV TSM_PASSWORD ${TSM_PASSWORD}
ARG ADMIN_PASSWORD
ENV ADMIN_PASSWORD ${ADMIN_PASSWORD}

MAINTAINER "Fabien ANTOINE" <fabien.antoine@m4x.org>

# this is the version what we're building
ENV LANG=en_US.UTF-8

# make systemd dbus visible 
VOLUME /sys/fs/cgroup /run /tmp /var/opt/tableau 

COPY download/tableau-tabcmd-${TABLEAU_VERSION}.noarch.rpm /var/tmp/
COPY download/tableau-server-${TABLEAU_VERSION}.x86_64.rpm /var/tmp/

RUN mkdir -p /etc/systemd/system/

# Install core bits and their deps:w
RUN rpm -Uvh https://dl.fedoraproject.org/pub/epel/epel-release-latest-7.noarch.rpm && \
    yum install -y iproute curl sudo vim && \
    adduser tsm && \
    (echo tsm:${TSM_PASSWORD} | chpasswd) && \
    (echo 'tsm ALL=(ALL) NOPASSWD:ALL' > /etc/sudoers.d/tsm) && \
    mkdir -p  /run/systemd/system /opt/tableau/docker_build && \
    yum install -y \
	    /var/tmp/tableau-tabcmd-${TABLEAU_VERSION}.noarch.rpm \
	    /var/tmp/tableau-server-${TABLEAU_VERSION}.x86_64.rpm &&\
    rm -rf /var/tmp/*rpm 



RUN groupadd tableau && \
    groupadd tsmadmin && \
    usermod tsm -aG tableau,tsmadmin && \
    useradd --system --comment "Tableau Server" --shell /bin/bash --create-home --home-dir /var/opt/tableau -g tableau tableau && \
    chown tableau /var/opt/tableau/.

COPY config/* /opt/tableau/docker_build/

RUN cp /opt/tableau/docker_build/tableau_server_install.service /etc/systemd/system/ 
RUN systemctl enable tableau_server_install

# Expose TSM and Gateway ports
EXPOSE 80 8850

CMD /sbin/init
