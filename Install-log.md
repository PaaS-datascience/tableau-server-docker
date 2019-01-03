# install log

This is a real execution log, as should be runned for the first time

## first step: build image and run it

```
>make up
2ee25eee9f2fa40c8b5dac9169b3884f421fc8df474dc90c5a3207f253bbff60
docker-compose -f docker-compose-centos.yml up -d
Building tableau-server
Step 1/28 : FROM centos/systemd
 ---> 78c36a71df7e
Step 2/28 : ARG TABLEAU_VERSION
 ---> Using cache
 ---> c359a61eda16
Step 3/28 : ENV TABLEAU_VERSION $TABLEAU_VERSION
 ---> Running in 1c91e815b7c7
Removing intermediate container 1c91e815b7c7
 ---> 8ebf83aef413
Step 4/28 : ARG proxy
 ---> Running in eb18b884a0f6
Removing intermediate container eb18b884a0f6
 ---> 0c48cd4d613c
Step 5/28 : ENV http_proxy $proxy
 ---> Running in c23dba622d32
Removing intermediate container c23dba622d32
 ---> b00d767c2c8f
Step 6/28 : ENV https_proxy $proxy
 ---> Running in f3e836c28817
Removing intermediate container f3e836c28817
 ---> b1c9309f1b13
Step 7/28 : ARG TSM_PASSWORD
 ---> Running in ca16ddd6135b
Removing intermediate container ca16ddd6135b
 ---> b779f2490fa2
Step 8/28 : ENV TSM_PASSWORD ${TSM_PASSWORD}
 ---> Running in 2b1f26c57383
Removing intermediate container 2b1f26c57383
 ---> 47a5861298c4
Step 9/28 : ARG ADMIN_PASSWORD
 ---> Running in dae46176f076
Removing intermediate container dae46176f076
 ---> 9b458f526b03
Step 10/28 : ENV ADMIN_PASSWORD ${ADMIN_PASSWORD}
 ---> Running in 82d9cf1d8935
Removing intermediate container 82d9cf1d8935
 ---> f57093fd7fde
Step 11/28 : MAINTAINER "Fabien ANTOINE" <fabien.antoine@m4x.org>
 ---> Running in a8febda2d76c
Removing intermediate container a8febda2d76c
 ---> 3766e5f0a926
Step 12/28 : ENV LANG=en_US.UTF-8
 ---> Running in 59dfd4d2af6b
Removing intermediate container 59dfd4d2af6b
 ---> 8415bd218820
Step 13/28 : VOLUME /sys/fs/cgroup /run /tmp /var/opt/tableau
 ---> Running in e81dea1dce18
Removing intermediate container e81dea1dce18
 ---> 942051f36476
Step 14/28 : COPY download/tableau-tabcmd-${TABLEAU_VERSION}.noarch.rpm /var/tmp/
 ---> 35720f370fe4
Step 15/28 : COPY download/tableau-server-${TABLEAU_VERSION}.x86_64.rpm /var/tmp/
 ---> c641752b97a6
Step 16/28 : COPY download/vertica-client-9.1.1-0.x86_64.rpm /var/tmp
 ---> 0ef11fbd71d0
Step 17/28 : RUN rpm -Uvh https://dl.fedoraproject.org/pub/epel/epel-release-latest-7.noarch.rpm &&     yum install -y iproute curl sudo vim &&     adduser tsm &&     (echo tsm:${TSM_PASSWORD} | chpasswd) &&     (echo 'tsm ALL=(ALL) NOPASSWD:ALL' > /etc/sudoers.d/tsm) &&     mkdir -p  /run/systemd/system /opt/tableau/docker_build &&     yum install -y 	    /var/tmp/tableau-server-tabcmd-${TABLEAU_VERSION}.noarch.rpm 	    /var/tmp/tableau-server-${TABLEAU_VERSION}.x86_64.rpm 	    /var/tmp/vertica-client-9.1.1-0.x86_64.rpm &&    rm -rf /var/tmp/*rpm
 ---> Running in e4d3105b88f4
warning: /var/tmp/rpm-tmp.6R9Xj8: Header V3 RSA/SHA256 Signature, key ID 352c64e5: NOKEY
Retrieving https://dl.fedoraproject.org/pub/epel/epel-release-latest-7.noarch.rpm
Preparing...                          ########################################
Updating / installing...
epel-release-7-11                     ########################################
Loaded plugins: fastestmirror, ovl
Determining fastest mirrors
 * base: centos.mirror.fr.planethoster.net
 * epel: epel.mirror.far.fi
 * extras: centos.mirror.ate.info
 * updates: centos.mirror.ate.info
http://epel.mirror.far.fi/7/x86_64/repodata/repomd.xml: [Errno -1] Error importing repomd.xml for epel: Damaged repomd.xml file
Trying other mirror.
http://epel.mirror.srv.magticom.ge/7/x86_64/repodata/repomd.xml: [Errno -1] Error importing repomd.xml for epel: Damaged repomd.xml file
Trying other mirror.
http://fedora-mirror.zerocopy.io/epel/7/x86_64/repodata/repomd.xml: [Errno -1] Error importing repomd.xml for epel: Damaged repomd.xml file
Trying other mirror.
http://fedora.uib.no/epel/7/x86_64/repodata/repomd.xml: [Errno -1] Error importing repomd.xml for epel: Damaged repomd.xml file
Trying other mirror.
http://ftp.cica.es/epel/7/x86_64/repodata/repomd.xml: [Errno -1] Error importing repomd.xml for epel: Damaged repomd.xml file
Trying other mirror.
http://ftp.fi.muni.cz/pub/linux/fedora/epel/7/x86_64/repodata/repomd.xml: [Errno -1] Error importing repomd.xml for epel: Damaged repomd.xml file
Trying other mirror.
http://ftp.linux.org.tr/epel/7/x86_64/repodata/repomd.xml: [Errno -1] Error importing repomd.xml for epel: Damaged repomd.xml file
Trying other mirror.
http://ftp.uni-stuttgart.de/epel/7/x86_64/repodata/cf588d8a8db0347a8a50a33167239a39f7a2d2b787f16e9ffcb95930cde7ef0b-updateinfo.xml.bz2: [Errno -1] Metadata file does not match checksum
Trying other mirror.
http://mirror.23media.de/epel/7/x86_64/repodata/1fbb9e4465edac8ce1bb967702a5ace1abf5997eba510fef5d6cc5e60216f784-primary.xml.gz: [Errno -1] Metadata file does not match checksum
Trying other mirror.
http://mirror.23media.de/epel/7/x86_64/repodata/cf588d8a8db0347a8a50a33167239a39f7a2d2b787f16e9ffcb95930cde7ef0b-updateinfo.xml.bz2: [Errno -1] Metadata file does not match checksum
Trying other mirror.
http://ftp.uni-stuttgart.de/epel/7/x86_64/repodata/1fbb9e4465edac8ce1bb967702a5ace1abf5997eba510fef5d6cc5e60216f784-primary.xml.gz: [Errno -1] Metadata file does not match checksum
Trying other mirror.
http://mirror.airenetworks.es/epel/7/x86_64/repodata/cf588d8a8db0347a8a50a33167239a39f7a2d2b787f16e9ffcb95930cde7ef0b-updateinfo.xml.bz2: [Errno -1] Metadata file does not match checksum
Trying other mirror.
http://mirror.awanti.com/epel/7/x86_64/repodata/cf588d8a8db0347a8a50a33167239a39f7a2d2b787f16e9ffcb95930cde7ef0b-updateinfo.xml.bz2: [Errno -1] Metadata file does not match checksum
Trying other mirror.
http://mirror.bytemark.co.uk/fedora/epel/7/x86_64/repodata/cf588d8a8db0347a8a50a33167239a39f7a2d2b787f16e9ffcb95930cde7ef0b-updateinfo.xml.bz2: [Errno -1] Metadata file does not match checksum
Trying other mirror.
http://mirror.cherryservers.com/epel/7/x86_64/repodata/cf588d8a8db0347a8a50a33167239a39f7a2d2b787f16e9ffcb95930cde7ef0b-updateinfo.xml.bz2: [Errno -1] Metadata file does not match checksum
Trying other mirror.
http://mirror.datacenter.by/pub/fedoraproject.org/epel/7/x86_64/repodata/cf588d8a8db0347a8a50a33167239a39f7a2d2b787f16e9ffcb95930cde7ef0b-updateinfo.xml.bz2: [Errno -1] Metadata file does not match checksum
Trying other mirror.
http://mirror.etf.bg.ac.rs/epel/7/x86_64/repodata/cf588d8a8db0347a8a50a33167239a39f7a2d2b787f16e9ffcb95930cde7ef0b-updateinfo.xml.bz2: [Errno -1] Metadata file does not match checksum
Trying other mirror.
Resolving Dependencies
--> Running transaction check
---> Package curl.x86_64 0:7.29.0-46.el7 will be updated
---> Package curl.x86_64 0:7.29.0-51.el7 will be an update
--> Processing Dependency: libcurl = 7.29.0-51.el7 for package: curl-7.29.0-51.el7.x86_64
---> Package iproute.x86_64 0:4.11.0-14.el7 will be installed
--> Processing Dependency: libmnl.so.0(LIBMNL_1.0)(64bit) for package: iproute-4.11.0-14.el7.x86_64
--> Processing Dependency: libxtables.so.10()(64bit) for package: iproute-4.11.0-14.el7.x86_64
--> Processing Dependency: libmnl.so.0()(64bit) for package: iproute-4.11.0-14.el7.x86_64
---> Package sudo.x86_64 0:1.8.23-3.el7 will be installed
---> Package vim-enhanced.x86_64 2:7.4.160-5.el7 will be installed
--> Processing Dependency: vim-common = 2:7.4.160-5.el7 for package: 2:vim-enhanced-7.4.160-5.el7.x86_64
--> Processing Dependency: which for package: 2:vim-enhanced-7.4.160-5.el7.x86_64
--> Processing Dependency: perl(:MODULE_COMPAT_5.16.3) for package: 2:vim-enhanced-7.4.160-5.el7.x86_64
--> Processing Dependency: libperl.so()(64bit) for package: 2:vim-enhanced-7.4.160-5.el7.x86_64
--> Processing Dependency: libgpm.so.2()(64bit) for package: 2:vim-enhanced-7.4.160-5.el7.x86_64
--> Running transaction check
---> Package gpm-libs.x86_64 0:1.20.7-5.el7 will be installed
---> Package iptables.x86_64 0:1.4.21-28.el7 will be installed
--> Processing Dependency: libnfnetlink.so.0()(64bit) for package: iptables-1.4.21-28.el7.x86_64
--> Processing Dependency: libnetfilter_conntrack.so.3()(64bit) for package: iptables-1.4.21-28.el7.x86_64
---> Package libcurl.x86_64 0:7.29.0-46.el7 will be updated
---> Package libcurl.x86_64 0:7.29.0-51.el7 will be an update
--> Processing Dependency: nss-pem(x86-64) >= 1.0.3-5 for package: libcurl-7.29.0-51.el7.x86_64
---> Package libmnl.x86_64 0:1.0.3-7.el7 will be installed
---> Package perl.x86_64 4:5.16.3-293.el7 will be installed
--> Processing Dependency: perl(Socket) >= 1.3 for package: 4:perl-5.16.3-293.el7.x86_64
--> Processing Dependency: perl(Scalar::Util) >= 1.10 for package: 4:perl-5.16.3-293.el7.x86_64
--> Processing Dependency: perl-macros for package: 4:perl-5.16.3-293.el7.x86_64
--> Processing Dependency: perl(threads::shared) for package: 4:perl-5.16.3-293.el7.x86_64
--> Processing Dependency: perl(threads) for package: 4:perl-5.16.3-293.el7.x86_64
--> Processing Dependency: perl(constant) for package: 4:perl-5.16.3-293.el7.x86_64
--> Processing Dependency: perl(Time::Local) for package: 4:perl-5.16.3-293.el7.x86_64
--> Processing Dependency: perl(Time::HiRes) for package: 4:perl-5.16.3-293.el7.x86_64
--> Processing Dependency: perl(Storable) for package: 4:perl-5.16.3-293.el7.x86_64
--> Processing Dependency: perl(Socket) for package: 4:perl-5.16.3-293.el7.x86_64
--> Processing Dependency: perl(Scalar::Util) for package: 4:perl-5.16.3-293.el7.x86_64
--> Processing Dependency: perl(Pod::Simple::XHTML) for package: 4:perl-5.16.3-293.el7.x86_64
--> Processing Dependency: perl(Pod::Simple::Search) for package: 4:perl-5.16.3-293.el7.x86_64
--> Processing Dependency: perl(Getopt::Long) for package: 4:perl-5.16.3-293.el7.x86_64
--> Processing Dependency: perl(Filter::Util::Call) for package: 4:perl-5.16.3-293.el7.x86_64
--> Processing Dependency: perl(File::Temp) for package: 4:perl-5.16.3-293.el7.x86_64
--> Processing Dependency: perl(File::Spec::Unix) for package: 4:perl-5.16.3-293.el7.x86_64
--> Processing Dependency: perl(File::Spec::Functions) for package: 4:perl-5.16.3-293.el7.x86_64
--> Processing Dependency: perl(File::Spec) for package: 4:perl-5.16.3-293.el7.x86_64
--> Processing Dependency: perl(File::Path) for package: 4:perl-5.16.3-293.el7.x86_64
--> Processing Dependency: perl(Exporter) for package: 4:perl-5.16.3-293.el7.x86_64
--> Processing Dependency: perl(Cwd) for package: 4:perl-5.16.3-293.el7.x86_64
--> Processing Dependency: perl(Carp) for package: 4:perl-5.16.3-293.el7.x86_64
---> Package perl-libs.x86_64 4:5.16.3-293.el7 will be installed
---> Package vim-common.x86_64 2:7.4.160-5.el7 will be installed
--> Processing Dependency: vim-filesystem for package: 2:vim-common-7.4.160-5.el7.x86_64
---> Package which.x86_64 0:2.20-7.el7 will be installed
--> Running transaction check
---> Package libnetfilter_conntrack.x86_64 0:1.0.6-1.el7_3 will be installed
---> Package libnfnetlink.x86_64 0:1.0.1-4.el7 will be installed
---> Package nss-pem.x86_64 0:1.0.3-4.el7 will be updated
---> Package nss-pem.x86_64 0:1.0.3-5.el7 will be an update
---> Package perl-Carp.noarch 0:1.26-244.el7 will be installed
---> Package perl-Exporter.noarch 0:5.68-3.el7 will be installed
---> Package perl-File-Path.noarch 0:2.09-2.el7 will be installed
---> Package perl-File-Temp.noarch 0:0.23.01-3.el7 will be installed
---> Package perl-Filter.x86_64 0:1.49-3.el7 will be installed
---> Package perl-Getopt-Long.noarch 0:2.40-3.el7 will be installed
--> Processing Dependency: perl(Pod::Usage) >= 1.14 for package: perl-Getopt-Long-2.40-3.el7.noarch
--> Processing Dependency: perl(Text::ParseWords) for package: perl-Getopt-Long-2.40-3.el7.noarch
---> Package perl-PathTools.x86_64 0:3.40-5.el7 will be installed
---> Package perl-Pod-Simple.noarch 1:3.28-4.el7 will be installed
--> Processing Dependency: perl(Pod::Escapes) >= 1.04 for package: 1:perl-Pod-Simple-3.28-4.el7.noarch
--> Processing Dependency: perl(Encode) for package: 1:perl-Pod-Simple-3.28-4.el7.noarch
---> Package perl-Scalar-List-Utils.x86_64 0:1.27-248.el7 will be installed
---> Package perl-Socket.x86_64 0:2.010-4.el7 will be installed
---> Package perl-Storable.x86_64 0:2.45-3.el7 will be installed
---> Package perl-Time-HiRes.x86_64 4:1.9725-3.el7 will be installed
---> Package perl-Time-Local.noarch 0:1.2300-2.el7 will be installed
---> Package perl-constant.noarch 0:1.27-2.el7 will be installed
---> Package perl-macros.x86_64 4:5.16.3-293.el7 will be installed
---> Package perl-threads.x86_64 0:1.87-4.el7 will be installed
---> Package perl-threads-shared.x86_64 0:1.43-6.el7 will be installed
---> Package vim-filesystem.x86_64 2:7.4.160-5.el7 will be installed
--> Running transaction check
---> Package perl-Encode.x86_64 0:2.51-7.el7 will be installed
---> Package perl-Pod-Escapes.noarch 1:1.04-293.el7 will be installed
---> Package perl-Pod-Usage.noarch 0:1.63-3.el7 will be installed
--> Processing Dependency: perl(Pod::Text) >= 3.15 for package: perl-Pod-Usage-1.63-3.el7.noarch
--> Processing Dependency: perl-Pod-Perldoc for package: perl-Pod-Usage-1.63-3.el7.noarch
---> Package perl-Text-ParseWords.noarch 0:3.29-4.el7 will be installed
--> Running transaction check
---> Package perl-Pod-Perldoc.noarch 0:3.20-4.el7 will be installed
--> Processing Dependency: perl(parent) for package: perl-Pod-Perldoc-3.20-4.el7.noarch
--> Processing Dependency: perl(HTTP::Tiny) for package: perl-Pod-Perldoc-3.20-4.el7.noarch
--> Processing Dependency: groff-base for package: perl-Pod-Perldoc-3.20-4.el7.noarch
---> Package perl-podlators.noarch 0:2.5.1-3.el7 will be installed
--> Running transaction check
---> Package groff-base.x86_64 0:1.22.2-8.el7 will be installed
---> Package perl-HTTP-Tiny.noarch 0:0.033-3.el7 will be installed
---> Package perl-parent.noarch 1:0.225-244.el7 will be installed
--> Finished Dependency Resolution

Dependencies Resolved

================================================================================
 Package                     Arch        Version                Repository
                                                                           Size
================================================================================
Installing:
 iproute                     x86_64      4.11.0-14.el7          base      763 k
 sudo                        x86_64      1.8.23-3.el7           base      841 k
 vim-enhanced                x86_64      2:7.4.160-5.el7        base      1.0 M
Updating:
 curl                        x86_64      7.29.0-51.el7          base      269 k
Installing for dependencies:
 gpm-libs                    x86_64      1.20.7-5.el7           base       32 k
 groff-base                  x86_64      1.22.2-8.el7           base      942 k
 iptables                    x86_64      1.4.21-28.el7          base      433 k
 libmnl                      x86_64      1.0.3-7.el7            base       23 k
 libnetfilter_conntrack      x86_64      1.0.6-1.el7_3          base       55 k
 libnfnetlink                x86_64      1.0.1-4.el7            base       26 k
 perl                        x86_64      4:5.16.3-293.el7       base      8.0 M
 perl-Carp                   noarch      1.26-244.el7           base       19 k
 perl-Encode                 x86_64      2.51-7.el7             base      1.5 M
 perl-Exporter               noarch      5.68-3.el7             base       28 k
 perl-File-Path              noarch      2.09-2.el7             base       26 k
 perl-File-Temp              noarch      0.23.01-3.el7          base       56 k
 perl-Filter                 x86_64      1.49-3.el7             base       76 k
 perl-Getopt-Long            noarch      2.40-3.el7             base       56 k
 perl-HTTP-Tiny              noarch      0.033-3.el7            base       38 k
 perl-PathTools              x86_64      3.40-5.el7             base       82 k
 perl-Pod-Escapes            noarch      1:1.04-293.el7         base       51 k
 perl-Pod-Perldoc            noarch      3.20-4.el7             base       87 k
 perl-Pod-Simple             noarch      1:3.28-4.el7           base      216 k
 perl-Pod-Usage              noarch      1.63-3.el7             base       27 k
 perl-Scalar-List-Utils      x86_64      1.27-248.el7           base       36 k
 perl-Socket                 x86_64      2.010-4.el7            base       49 k
 perl-Storable               x86_64      2.45-3.el7             base       77 k
 perl-Text-ParseWords        noarch      3.29-4.el7             base       14 k
 perl-Time-HiRes             x86_64      4:1.9725-3.el7         base       45 k
 perl-Time-Local             noarch      1.2300-2.el7           base       24 k
 perl-constant               noarch      1.27-2.el7             base       19 k
 perl-libs                   x86_64      4:5.16.3-293.el7       base      688 k
 perl-macros                 x86_64      4:5.16.3-293.el7       base       44 k
 perl-parent                 noarch      1:0.225-244.el7        base       12 k
 perl-podlators              noarch      2.5.1-3.el7            base      112 k
 perl-threads                x86_64      1.87-4.el7             base       49 k
 perl-threads-shared         x86_64      1.43-6.el7             base       39 k
 vim-common                  x86_64      2:7.4.160-5.el7        base      5.9 M
 vim-filesystem              x86_64      2:7.4.160-5.el7        base       10 k
 which                       x86_64      2.20-7.el7             base       41 k
Updating for dependencies:
 libcurl                     x86_64      7.29.0-51.el7          base      221 k
 nss-pem                     x86_64      1.0.3-5.el7            base       74 k

Transaction Summary
================================================================================
Install  3 Packages (+36 Dependent packages)
Upgrade  1 Package  (+ 2 Dependent packages)

Total download size: 22 M
Downloading packages:
Delta RPMs disabled because /usr/bin/applydeltarpm not installed.
warning: /var/cache/yum/x86_64/7/base/packages/curl-7.29.0-51.el7.x86_64.rpm: Header V3 RSA/SHA256 Signature, key ID f4a80eb5: NOKEY
Public key for curl-7.29.0-51.el7.x86_64.rpm is not installed
--------------------------------------------------------------------------------
Total                                              2.6 MB/s |  22 MB  00:08     
Retrieving key from file:///etc/pki/rpm-gpg/RPM-GPG-KEY-CentOS-7
Importing GPG key 0xF4A80EB5:
 Userid     : "CentOS-7 Key (CentOS 7 Official Signing Key) <security@centos.org>"
 Fingerprint: 6341 ab27 53d7 8a78 a7c2 7bb1 24c6 a8a7 f4a8 0eb5
 Package    : centos-release-7-5.1804.el7.centos.2.x86_64 (@Updates)
 From       : /etc/pki/rpm-gpg/RPM-GPG-KEY-CentOS-7
Running transaction check
Running transaction test
Transaction test succeeded
Running transaction
Warning: RPMDB altered outside of yum.
  Installing : libnfnetlink-1.0.1-4.el7.x86_64                             1/45 
  Installing : libmnl-1.0.3-7.el7.x86_64                                   2/45 
  Installing : libnetfilter_conntrack-1.0.6-1.el7_3.x86_64                 3/45 
  Installing : iptables-1.4.21-28.el7.x86_64                               4/45 
  Installing : 2:vim-filesystem-7.4.160-5.el7.x86_64                       5/45 
  Installing : 2:vim-common-7.4.160-5.el7.x86_64                           6/45 
  Installing : gpm-libs-1.20.7-5.el7.x86_64                                7/45 
  Installing : groff-base-1.22.2-8.el7.x86_64                              8/45 
  Installing : 1:perl-parent-0.225-244.el7.noarch                          9/45 
  Installing : perl-HTTP-Tiny-0.033-3.el7.noarch                          10/45 
  Installing : perl-podlators-2.5.1-3.el7.noarch                          11/45 
  Installing : perl-Pod-Perldoc-3.20-4.el7.noarch                         12/45 
  Installing : 1:perl-Pod-Escapes-1.04-293.el7.noarch                     13/45 
  Installing : perl-Encode-2.51-7.el7.x86_64                              14/45 
  Installing : perl-Text-ParseWords-3.29-4.el7.noarch                     15/45 
  Installing : perl-Pod-Usage-1.63-3.el7.noarch                           16/45 
  Installing : 4:perl-macros-5.16.3-293.el7.x86_64                        17/45 
  Installing : 4:perl-Time-HiRes-1.9725-3.el7.x86_64                      18/45 
  Installing : perl-Exporter-5.68-3.el7.noarch                            19/45 
  Installing : perl-constant-1.27-2.el7.noarch                            20/45 
  Installing : perl-Time-Local-1.2300-2.el7.noarch                        21/45 
  Installing : perl-Socket-2.010-4.el7.x86_64                             22/45 
  Installing : perl-Carp-1.26-244.el7.noarch                              23/45 
  Installing : perl-Storable-2.45-3.el7.x86_64                            24/45 
  Installing : perl-PathTools-3.40-5.el7.x86_64                           25/45 
  Installing : perl-Scalar-List-Utils-1.27-248.el7.x86_64                 26/45 
  Installing : 1:perl-Pod-Simple-3.28-4.el7.noarch                        27/45 
  Installing : perl-File-Temp-0.23.01-3.el7.noarch                        28/45 
  Installing : perl-File-Path-2.09-2.el7.noarch                           29/45 
  Installing : perl-threads-shared-1.43-6.el7.x86_64                      30/45 
  Installing : perl-threads-1.87-4.el7.x86_64                             31/45 
  Installing : perl-Filter-1.49-3.el7.x86_64                              32/45 
  Installing : 4:perl-libs-5.16.3-293.el7.x86_64                          33/45 
  Installing : perl-Getopt-Long-2.40-3.el7.noarch                         34/45 
  Installing : 4:perl-5.16.3-293.el7.x86_64                               35/45 
  Updating   : nss-pem-1.0.3-5.el7.x86_64                                 36/45 
  Updating   : libcurl-7.29.0-51.el7.x86_64                               37/45 
  Installing : which-2.20-7.el7.x86_64                                    38/45 
install-info: No such file or directory for /usr/share/info/which.info.gz
  Installing : 2:vim-enhanced-7.4.160-5.el7.x86_64                        39/45 
  Updating   : curl-7.29.0-51.el7.x86_64                                  40/45 
  Installing : iproute-4.11.0-14.el7.x86_64                               41/45 
  Installing : sudo-1.8.23-3.el7.x86_64                                   42/45 
  Cleanup    : curl-7.29.0-46.el7.x86_64                                  43/45 
  Cleanup    : libcurl-7.29.0-46.el7.x86_64                               44/45 
  Cleanup    : nss-pem-1.0.3-4.el7.x86_64                                 45/45 
  Verifying  : perl-HTTP-Tiny-0.033-3.el7.noarch                           1/45 
  Verifying  : libmnl-1.0.3-7.el7.x86_64                                   2/45 
  Verifying  : perl-threads-shared-1.43-6.el7.x86_64                       3/45 
  Verifying  : 4:perl-Time-HiRes-1.9725-3.el7.x86_64                       4/45 
  Verifying  : perl-Exporter-5.68-3.el7.noarch                             5/45 
  Verifying  : perl-constant-1.27-2.el7.noarch                             6/45 
  Verifying  : perl-PathTools-3.40-5.el7.x86_64                            7/45 
  Verifying  : libnetfilter_conntrack-1.0.6-1.el7_3.x86_64                 8/45 
  Verifying  : iproute-4.11.0-14.el7.x86_64                                9/45 
  Verifying  : 4:perl-macros-5.16.3-293.el7.x86_64                        10/45 
  Verifying  : 1:perl-parent-0.225-244.el7.noarch                         11/45 
  Verifying  : sudo-1.8.23-3.el7.x86_64                                   12/45 
  Verifying  : which-2.20-7.el7.x86_64                                    13/45 
  Verifying  : nss-pem-1.0.3-5.el7.x86_64                                 14/45 
  Verifying  : groff-base-1.22.2-8.el7.x86_64                             15/45 
  Verifying  : perl-File-Temp-0.23.01-3.el7.noarch                        16/45 
  Verifying  : 1:perl-Pod-Simple-3.28-4.el7.noarch                        17/45 
  Verifying  : perl-Time-Local-1.2300-2.el7.noarch                        18/45 
  Verifying  : gpm-libs-1.20.7-5.el7.x86_64                               19/45 
  Verifying  : 1:perl-Pod-Escapes-1.04-293.el7.noarch                     20/45 
  Verifying  : 2:vim-common-7.4.160-5.el7.x86_64                          21/45 
  Verifying  : perl-Socket-2.010-4.el7.x86_64                             22/45 
  Verifying  : 2:vim-enhanced-7.4.160-5.el7.x86_64                        23/45 
  Verifying  : perl-Carp-1.26-244.el7.noarch                              24/45 
  Verifying  : perl-Storable-2.45-3.el7.x86_64                            25/45 
  Verifying  : perl-Scalar-List-Utils-1.27-248.el7.x86_64                 26/45 
  Verifying  : libcurl-7.29.0-51.el7.x86_64                               27/45 
  Verifying  : perl-Pod-Usage-1.63-3.el7.noarch                           28/45 
  Verifying  : iptables-1.4.21-28.el7.x86_64                              29/45 
  Verifying  : perl-Encode-2.51-7.el7.x86_64                              30/45 
  Verifying  : libnfnetlink-1.0.1-4.el7.x86_64                            31/45 
  Verifying  : perl-Pod-Perldoc-3.20-4.el7.noarch                         32/45 
  Verifying  : perl-podlators-2.5.1-3.el7.noarch                          33/45 
  Verifying  : 4:perl-5.16.3-293.el7.x86_64                               34/45 
  Verifying  : perl-File-Path-2.09-2.el7.noarch                           35/45 
  Verifying  : perl-threads-1.87-4.el7.x86_64                             36/45 
  Verifying  : curl-7.29.0-51.el7.x86_64                                  37/45 
  Verifying  : perl-Filter-1.49-3.el7.x86_64                              38/45 
  Verifying  : perl-Getopt-Long-2.40-3.el7.noarch                         39/45 
  Verifying  : perl-Text-ParseWords-3.29-4.el7.noarch                     40/45 
  Verifying  : 4:perl-libs-5.16.3-293.el7.x86_64                          41/45 
  Verifying  : 2:vim-filesystem-7.4.160-5.el7.x86_64                      42/45 
  Verifying  : nss-pem-1.0.3-4.el7.x86_64                                 43/45 
  Verifying  : curl-7.29.0-46.el7.x86_64                                  44/45 
  Verifying  : libcurl-7.29.0-46.el7.x86_64                               45/45 

Installed:
  iproute.x86_64 0:4.11.0-14.el7              sudo.x86_64 0:1.8.23-3.el7        
  vim-enhanced.x86_64 2:7.4.160-5.el7        

Dependency Installed:
  gpm-libs.x86_64 0:1.20.7-5.el7                                                
  groff-base.x86_64 0:1.22.2-8.el7                                              
  iptables.x86_64 0:1.4.21-28.el7                                               
  libmnl.x86_64 0:1.0.3-7.el7                                                   
  libnetfilter_conntrack.x86_64 0:1.0.6-1.el7_3                                 
  libnfnetlink.x86_64 0:1.0.1-4.el7                                             
  perl.x86_64 4:5.16.3-293.el7                                                  
  perl-Carp.noarch 0:1.26-244.el7                                               
  perl-Encode.x86_64 0:2.51-7.el7                                               
  perl-Exporter.noarch 0:5.68-3.el7                                             
  perl-File-Path.noarch 0:2.09-2.el7                                            
  perl-File-Temp.noarch 0:0.23.01-3.el7                                         
  perl-Filter.x86_64 0:1.49-3.el7                                               
  perl-Getopt-Long.noarch 0:2.40-3.el7                                          
  perl-HTTP-Tiny.noarch 0:0.033-3.el7                                           
  perl-PathTools.x86_64 0:3.40-5.el7                                            
  perl-Pod-Escapes.noarch 1:1.04-293.el7                                        
  perl-Pod-Perldoc.noarch 0:3.20-4.el7                                          
  perl-Pod-Simple.noarch 1:3.28-4.el7                                           
  perl-Pod-Usage.noarch 0:1.63-3.el7                                            
  perl-Scalar-List-Utils.x86_64 0:1.27-248.el7                                  
  perl-Socket.x86_64 0:2.010-4.el7                                              
  perl-Storable.x86_64 0:2.45-3.el7                                             
  perl-Text-ParseWords.noarch 0:3.29-4.el7                                      
  perl-Time-HiRes.x86_64 4:1.9725-3.el7                                         
  perl-Time-Local.noarch 0:1.2300-2.el7                                         
  perl-constant.noarch 0:1.27-2.el7                                             
  perl-libs.x86_64 4:5.16.3-293.el7                                             
  perl-macros.x86_64 4:5.16.3-293.el7                                           
  perl-parent.noarch 1:0.225-244.el7                                            
  perl-podlators.noarch 0:2.5.1-3.el7                                           
  perl-threads.x86_64 0:1.87-4.el7                                              
  perl-threads-shared.x86_64 0:1.43-6.el7                                       
  vim-common.x86_64 2:7.4.160-5.el7                                             
  vim-filesystem.x86_64 2:7.4.160-5.el7                                         
  which.x86_64 0:2.20-7.el7                                                     

Updated:
  curl.x86_64 0:7.29.0-51.el7                                                   

Dependency Updated:
  libcurl.x86_64 0:7.29.0-51.el7          nss-pem.x86_64 0:1.0.3-5.el7         

Complete!
Loaded plugins: fastestmirror, ovl
Loading mirror speeds from cached hostfile
 * base: centos.mirror.fr.planethoster.net
 * epel: epel.mirror.far.fi
 * extras: centos.mirror.ate.info
 * updates: centos.mirror.ate.info
No package /var/tmp/tableau-server-tabcmd-2018-3-2.noarch.rpm available.
Examining /var/tmp/tableau-server-2018-3-2.x86_64.rpm: tableau-server-20183.18.1214.0808-20183-18.1214.0808.x86_64
Marking /var/tmp/tableau-server-2018-3-2.x86_64.rpm to be installed
Examining /var/tmp/vertica-client-9.1.1-0.x86_64.rpm: vertica-client-9.1.1-0.x86_64
Marking /var/tmp/vertica-client-9.1.1-0.x86_64.rpm to be installed
Resolving Dependencies
--> Running transaction check
---> Package tableau-server-20183.18.1214.0808.x86_64 0:20183-18.1214.0808 will be installed
--> Processing Dependency: fontconfig for package: tableau-server-20183.18.1214.0808-20183-18.1214.0808.x86_64
--> Processing Dependency: fuse for package: tableau-server-20183.18.1214.0808-20183-18.1214.0808.x86_64
--> Processing Dependency: net-tools for package: tableau-server-20183.18.1214.0808-20183-18.1214.0808.x86_64
--> Processing Dependency: bash-completion for package: tableau-server-20183.18.1214.0808-20183-18.1214.0808.x86_64
--> Processing Dependency: gdb for package: tableau-server-20183.18.1214.0808-20183-18.1214.0808.x86_64
--> Processing Dependency: freeglut for package: tableau-server-20183.18.1214.0808-20183-18.1214.0808.x86_64
--> Processing Dependency: freetype for package: tableau-server-20183.18.1214.0808-20183-18.1214.0808.x86_64
--> Processing Dependency: fuse-libs for package: tableau-server-20183.18.1214.0808-20183-18.1214.0808.x86_64
--> Processing Dependency: libXcomposite for package: tableau-server-20183.18.1214.0808-20183-18.1214.0808.x86_64
--> Processing Dependency: libXrender for package: tableau-server-20183.18.1214.0808-20183-18.1214.0808.x86_64
--> Processing Dependency: libxslt for package: tableau-server-20183.18.1214.0808-20183-18.1214.0808.x86_64
--> Processing Dependency: mesa-libEGL for package: tableau-server-20183.18.1214.0808-20183-18.1214.0808.x86_64
--> Processing Dependency: redhat-lsb-core for package: tableau-server-20183.18.1214.0808-20183-18.1214.0808.x86_64
---> Package vertica-client.x86_64 0:9.1.1-0 will be installed
--> Running transaction check
---> Package bash-completion.noarch 1:2.1-6.el7 will be installed
---> Package fontconfig.x86_64 0:2.13.0-4.3.el7 will be installed
--> Processing Dependency: fontpackages-filesystem for package: fontconfig-2.13.0-4.3.el7.x86_64
--> Processing Dependency: dejavu-sans-fonts for package: fontconfig-2.13.0-4.3.el7.x86_64
---> Package freeglut.x86_64 0:3.0.0-8.el7 will be installed
--> Processing Dependency: libXxf86vm.so.1()(64bit) for package: freeglut-3.0.0-8.el7.x86_64
--> Processing Dependency: libXi.so.6()(64bit) for package: freeglut-3.0.0-8.el7.x86_64
--> Processing Dependency: libXext.so.6()(64bit) for package: freeglut-3.0.0-8.el7.x86_64
--> Processing Dependency: libX11.so.6()(64bit) for package: freeglut-3.0.0-8.el7.x86_64
--> Processing Dependency: libICE.so.6()(64bit) for package: freeglut-3.0.0-8.el7.x86_64
--> Processing Dependency: libGL.so.1()(64bit) for package: freeglut-3.0.0-8.el7.x86_64
---> Package freetype.x86_64 0:2.8-12.el7 will be installed
--> Processing Dependency: libpng15.so.15(PNG15_0)(64bit) for package: freetype-2.8-12.el7.x86_64
--> Processing Dependency: libpng15.so.15()(64bit) for package: freetype-2.8-12.el7.x86_64
---> Package fuse.x86_64 0:2.9.2-11.el7 will be installed
---> Package fuse-libs.x86_64 0:2.9.2-11.el7 will be installed
---> Package gdb.x86_64 0:7.6.1-114.el7 will be installed
---> Package libXcomposite.x86_64 0:0.4.4-4.1.el7 will be installed
---> Package libXrender.x86_64 0:0.9.10-1.el7 will be installed
---> Package libxslt.x86_64 0:1.1.28-5.el7 will be installed
---> Package mesa-libEGL.x86_64 0:18.0.5-3.el7 will be installed
--> Processing Dependency: mesa-libgbm = 18.0.5-3.el7 for package: mesa-libEGL-18.0.5-3.el7.x86_64
--> Processing Dependency: libglvnd-egl(x86-64) for package: mesa-libEGL-18.0.5-3.el7.x86_64
--> Processing Dependency: libxshmfence.so.1()(64bit) for package: mesa-libEGL-18.0.5-3.el7.x86_64
--> Processing Dependency: libxcb.so.1()(64bit) for package: mesa-libEGL-18.0.5-3.el7.x86_64
--> Processing Dependency: libxcb-xfixes.so.0()(64bit) for package: mesa-libEGL-18.0.5-3.el7.x86_64
--> Processing Dependency: libxcb-sync.so.1()(64bit) for package: mesa-libEGL-18.0.5-3.el7.x86_64
--> Processing Dependency: libxcb-present.so.0()(64bit) for package: mesa-libEGL-18.0.5-3.el7.x86_64
--> Processing Dependency: libxcb-dri3.so.0()(64bit) for package: mesa-libEGL-18.0.5-3.el7.x86_64
--> Processing Dependency: libxcb-dri2.so.0()(64bit) for package: mesa-libEGL-18.0.5-3.el7.x86_64
--> Processing Dependency: libwayland-server.so.0()(64bit) for package: mesa-libEGL-18.0.5-3.el7.x86_64
--> Processing Dependency: libwayland-client.so.0()(64bit) for package: mesa-libEGL-18.0.5-3.el7.x86_64
--> Processing Dependency: libglapi.so.0()(64bit) for package: mesa-libEGL-18.0.5-3.el7.x86_64
--> Processing Dependency: libgbm.so.1()(64bit) for package: mesa-libEGL-18.0.5-3.el7.x86_64
--> Processing Dependency: libdrm.so.2()(64bit) for package: mesa-libEGL-18.0.5-3.el7.x86_64
---> Package net-tools.x86_64 0:2.0-0.24.20131004git.el7 will be installed
---> Package redhat-lsb-core.x86_64 0:4.1-27.el7.centos.1 will be installed
--> Processing Dependency: redhat-lsb-submod-security(x86-64) = 4.1-27.el7.centos.1 for package: redhat-lsb-core-4.1-27.el7.centos.1.x86_64
--> Processing Dependency: spax for package: redhat-lsb-core-4.1-27.el7.centos.1.x86_64
--> Processing Dependency: /usr/sbin/sendmail for package: redhat-lsb-core-4.1-27.el7.centos.1.x86_64
--> Processing Dependency: /usr/sbin/fuser for package: redhat-lsb-core-4.1-27.el7.centos.1.x86_64
--> Processing Dependency: /usr/bin/time for package: redhat-lsb-core-4.1-27.el7.centos.1.x86_64
--> Processing Dependency: /usr/bin/patch for package: redhat-lsb-core-4.1-27.el7.centos.1.x86_64
--> Processing Dependency: /usr/bin/msgfmt for package: redhat-lsb-core-4.1-27.el7.centos.1.x86_64
--> Processing Dependency: /usr/bin/man for package: redhat-lsb-core-4.1-27.el7.centos.1.x86_64
--> Processing Dependency: /usr/bin/make for package: redhat-lsb-core-4.1-27.el7.centos.1.x86_64
--> Processing Dependency: /usr/bin/m4 for package: redhat-lsb-core-4.1-27.el7.centos.1.x86_64
--> Processing Dependency: /usr/bin/lpr for package: redhat-lsb-core-4.1-27.el7.centos.1.x86_64
--> Processing Dependency: /usr/bin/lp for package: redhat-lsb-core-4.1-27.el7.centos.1.x86_64
--> Processing Dependency: /usr/bin/killall for package: redhat-lsb-core-4.1-27.el7.centos.1.x86_64
--> Processing Dependency: /usr/bin/gettext for package: redhat-lsb-core-4.1-27.el7.centos.1.x86_64
--> Processing Dependency: /usr/bin/file for package: redhat-lsb-core-4.1-27.el7.centos.1.x86_64
--> Processing Dependency: /usr/bin/crontab for package: redhat-lsb-core-4.1-27.el7.centos.1.x86_64
--> Processing Dependency: /usr/bin/bc for package: redhat-lsb-core-4.1-27.el7.centos.1.x86_64
--> Processing Dependency: /usr/bin/batch for package: redhat-lsb-core-4.1-27.el7.centos.1.x86_64
--> Processing Dependency: /usr/bin/at for package: redhat-lsb-core-4.1-27.el7.centos.1.x86_64
--> Processing Dependency: /sbin/pidof for package: redhat-lsb-core-4.1-27.el7.centos.1.x86_64
--> Processing Dependency: /bin/mailx for package: redhat-lsb-core-4.1-27.el7.centos.1.x86_64
--> Processing Dependency: /bin/ed for package: redhat-lsb-core-4.1-27.el7.centos.1.x86_64
--> Running transaction check
---> Package at.x86_64 0:3.1.13-24.el7 will be installed
---> Package bc.x86_64 0:1.06.95-13.el7 will be installed
---> Package cronie.x86_64 0:1.4.11-20.el7_6 will be installed
--> Processing Dependency: dailyjobs for package: cronie-1.4.11-20.el7_6.x86_64
---> Package cups-client.x86_64 1:1.6.3-35.el7 will be installed
--> Processing Dependency: cups-libs(x86-64) = 1:1.6.3-35.el7 for package: 1:cups-client-1.6.3-35.el7.x86_64
--> Processing Dependency: libcups.so.2()(64bit) for package: 1:cups-client-1.6.3-35.el7.x86_64
--> Processing Dependency: libavahi-common.so.3()(64bit) for package: 1:cups-client-1.6.3-35.el7.x86_64
--> Processing Dependency: libavahi-client.so.3()(64bit) for package: 1:cups-client-1.6.3-35.el7.x86_64
---> Package dejavu-sans-fonts.noarch 0:2.33-6.el7 will be installed
--> Processing Dependency: dejavu-fonts-common = 2.33-6.el7 for package: dejavu-sans-fonts-2.33-6.el7.noarch
---> Package ed.x86_64 0:1.9-4.el7 will be installed
---> Package file.x86_64 0:5.11-35.el7 will be installed
--> Processing Dependency: file-libs = 5.11-35.el7 for package: file-5.11-35.el7.x86_64
---> Package fontpackages-filesystem.noarch 0:1.44-8.el7 will be installed
---> Package gettext.x86_64 0:0.19.8.1-2.el7 will be installed
--> Processing Dependency: gettext-libs(x86-64) = 0.19.8.1-2.el7 for package: gettext-0.19.8.1-2.el7.x86_64
--> Processing Dependency: libgomp.so.1(GOMP_1.0)(64bit) for package: gettext-0.19.8.1-2.el7.x86_64
--> Processing Dependency: libunistring.so.0()(64bit) for package: gettext-0.19.8.1-2.el7.x86_64
--> Processing Dependency: libgomp.so.1()(64bit) for package: gettext-0.19.8.1-2.el7.x86_64
--> Processing Dependency: libgettextsrc-0.19.8.1.so()(64bit) for package: gettext-0.19.8.1-2.el7.x86_64
--> Processing Dependency: libgettextlib-0.19.8.1.so()(64bit) for package: gettext-0.19.8.1-2.el7.x86_64
--> Processing Dependency: libcroco-0.6.so.3()(64bit) for package: gettext-0.19.8.1-2.el7.x86_64
---> Package libICE.x86_64 0:1.0.9-9.el7 will be installed
---> Package libX11.x86_64 0:1.6.5-2.el7 will be installed
--> Processing Dependency: libX11-common >= 1.6.5-2.el7 for package: libX11-1.6.5-2.el7.x86_64
---> Package libXext.x86_64 0:1.3.3-3.el7 will be installed
---> Package libXi.x86_64 0:1.7.9-1.el7 will be installed
---> Package libXxf86vm.x86_64 0:1.1.4-1.el7 will be installed
---> Package libdrm.x86_64 0:2.4.91-3.el7 will be installed
--> Processing Dependency: libpciaccess.so.0()(64bit) for package: libdrm-2.4.91-3.el7.x86_64
---> Package libglvnd-egl.x86_64 1:1.0.1-0.8.git5baa1e5.el7 will be installed
--> Processing Dependency: libglvnd(x86-64) = 1:1.0.1-0.8.git5baa1e5.el7 for package: 1:libglvnd-egl-1.0.1-0.8.git5baa1e5.el7.x86_64
--> Processing Dependency: libGLdispatch.so.0()(64bit) for package: 1:libglvnd-egl-1.0.1-0.8.git5baa1e5.el7.x86_64
---> Package libglvnd-glx.x86_64 1:1.0.1-0.8.git5baa1e5.el7 will be installed
--> Processing Dependency: mesa-libGL(x86-64) >= 13.0.4-1 for package: 1:libglvnd-glx-1.0.1-0.8.git5baa1e5.el7.x86_64
---> Package libpng.x86_64 2:1.5.13-7.el7_2 will be installed
---> Package libwayland-client.x86_64 0:1.15.0-1.el7 will be installed
---> Package libwayland-server.x86_64 0:1.15.0-1.el7 will be installed
---> Package libxcb.x86_64 0:1.13-1.el7 will be installed
--> Processing Dependency: libXau.so.6()(64bit) for package: libxcb-1.13-1.el7.x86_64
---> Package libxshmfence.x86_64 0:1.2-1.el7 will be installed
---> Package m4.x86_64 0:1.4.16-10.el7 will be installed
---> Package mailx.x86_64 0:12.5-19.el7 will be installed
---> Package make.x86_64 1:3.82-23.el7 will be installed
---> Package man-db.x86_64 0:2.6.3-11.el7 will be installed
--> Processing Dependency: less for package: man-db-2.6.3-11.el7.x86_64
--> Processing Dependency: libpipeline.so.1()(64bit) for package: man-db-2.6.3-11.el7.x86_64
---> Package mesa-libgbm.x86_64 0:18.0.5-3.el7 will be installed
---> Package mesa-libglapi.x86_64 0:18.0.5-3.el7 will be installed
---> Package patch.x86_64 0:2.7.1-10.el7_5 will be installed
---> Package psmisc.x86_64 0:22.20-15.el7 will be installed
---> Package redhat-lsb-submod-security.x86_64 0:4.1-27.el7.centos.1 will be installed
---> Package spax.x86_64 0:1.5.2-13.el7 will be installed
---> Package ssmtp.x86_64 0:2.64-14.el7 will be installed
---> Package sysvinit-tools.x86_64 0:2.88-14.dsf.el7 will be installed
---> Package time.x86_64 0:1.7-45.el7 will be installed
--> Running transaction check
---> Package avahi-libs.x86_64 0:0.6.31-19.el7 will be installed
---> Package cronie-anacron.x86_64 0:1.4.11-20.el7_6 will be installed
--> Processing Dependency: crontabs for package: cronie-anacron-1.4.11-20.el7_6.x86_64
---> Package cups-libs.x86_64 1:1.6.3-35.el7 will be installed
---> Package dejavu-fonts-common.noarch 0:2.33-6.el7 will be installed
---> Package file-libs.x86_64 0:5.11-33.el7 will be updated
---> Package file-libs.x86_64 0:5.11-35.el7 will be an update
---> Package gettext-libs.x86_64 0:0.19.8.1-2.el7 will be installed
---> Package less.x86_64 0:458-9.el7 will be installed
---> Package libX11-common.noarch 0:1.6.5-2.el7 will be installed
---> Package libXau.x86_64 0:1.0.8-2.1.el7 will be installed
---> Package libcroco.x86_64 0:0.6.12-4.el7 will be installed
---> Package libglvnd.x86_64 1:1.0.1-0.8.git5baa1e5.el7 will be installed
---> Package libgomp.x86_64 0:4.8.5-36.el7 will be installed
---> Package libpciaccess.x86_64 0:0.14-1.el7 will be installed
--> Processing Dependency: hwdata for package: libpciaccess-0.14-1.el7.x86_64
---> Package libpipeline.x86_64 0:1.2.3-3.el7 will be installed
---> Package libunistring.x86_64 0:0.9.3-9.el7 will be installed
---> Package mesa-libGL.x86_64 0:18.0.5-3.el7 will be installed
--> Processing Dependency: libXfixes.so.3()(64bit) for package: mesa-libGL-18.0.5-3.el7.x86_64
--> Processing Dependency: libXdamage.so.1()(64bit) for package: mesa-libGL-18.0.5-3.el7.x86_64
--> Running transaction check
---> Package crontabs.noarch 0:1.11-6.20121102git.el7 will be installed
---> Package hwdata.x86_64 0:0.252-9.1.el7 will be installed
---> Package libXdamage.x86_64 0:1.1.4-4.1.el7 will be installed
---> Package libXfixes.x86_64 0:5.0.3-1.el7 will be installed
--> Finished Dependency Resolution

Dependencies Resolved

================================================================================
 Package                      Arch   Version                    Repository
                                                                           Size
================================================================================
Installing:
 tableau-server-20183.18.1214.0808
                              x86_64 20183-18.1214.0808         /tableau-server-2018-3-2.x86_64
                                                                          3.2 G
 vertica-client               x86_64 9.1.1-0                    /vertica-client-9.1.1-0.x86_64
                                                                          238 M
Installing for dependencies:
 at                           x86_64 3.1.13-24.el7              base       51 k
 avahi-libs                   x86_64 0.6.31-19.el7              base       61 k
 bash-completion              noarch 1:2.1-6.el7                base       85 k
 bc                           x86_64 1.06.95-13.el7             base      115 k
 cronie                       x86_64 1.4.11-20.el7_6            updates    91 k
 cronie-anacron               x86_64 1.4.11-20.el7_6            updates    36 k
 crontabs                     noarch 1.11-6.20121102git.el7     base       13 k
 cups-client                  x86_64 1:1.6.3-35.el7             base      151 k
 cups-libs                    x86_64 1:1.6.3-35.el7             base      357 k
 dejavu-fonts-common          noarch 2.33-6.el7                 base       64 k
 dejavu-sans-fonts            noarch 2.33-6.el7                 base      1.4 M
 ed                           x86_64 1.9-4.el7                  base       72 k
 file                         x86_64 5.11-35.el7                base       57 k
 fontconfig                   x86_64 2.13.0-4.3.el7             base      254 k
 fontpackages-filesystem      noarch 1.44-8.el7                 base      9.9 k
 freeglut                     x86_64 3.0.0-8.el7                base      185 k
 freetype                     x86_64 2.8-12.el7                 base      380 k
 fuse                         x86_64 2.9.2-11.el7               base       86 k
 fuse-libs                    x86_64 2.9.2-11.el7               base       93 k
 gdb                          x86_64 7.6.1-114.el7              base      2.4 M
 gettext                      x86_64 0.19.8.1-2.el7             base      1.0 M
 gettext-libs                 x86_64 0.19.8.1-2.el7             base      501 k
 hwdata                       x86_64 0.252-9.1.el7              base      2.3 M
 less                         x86_64 458-9.el7                  base      120 k
 libICE                       x86_64 1.0.9-9.el7                base       66 k
 libX11                       x86_64 1.6.5-2.el7                base      606 k
 libX11-common                noarch 1.6.5-2.el7                base      164 k
 libXau                       x86_64 1.0.8-2.1.el7              base       29 k
 libXcomposite                x86_64 0.4.4-4.1.el7              base       22 k
 libXdamage                   x86_64 1.1.4-4.1.el7              base       20 k
 libXext                      x86_64 1.3.3-3.el7                base       39 k
 libXfixes                    x86_64 5.0.3-1.el7                base       18 k
 libXi                        x86_64 1.7.9-1.el7                base       40 k
 libXrender                   x86_64 0.9.10-1.el7               base       26 k
 libXxf86vm                   x86_64 1.1.4-1.el7                base       18 k
 libcroco                     x86_64 0.6.12-4.el7               base      105 k
 libdrm                       x86_64 2.4.91-3.el7               base      153 k
 libglvnd                     x86_64 1:1.0.1-0.8.git5baa1e5.el7 base       89 k
 libglvnd-egl                 x86_64 1:1.0.1-0.8.git5baa1e5.el7 base       44 k
 libglvnd-glx                 x86_64 1:1.0.1-0.8.git5baa1e5.el7 base      125 k
 libgomp                      x86_64 4.8.5-36.el7               base      157 k
 libpciaccess                 x86_64 0.14-1.el7                 base       26 k
 libpipeline                  x86_64 1.2.3-3.el7                base       53 k
 libpng                       x86_64 2:1.5.13-7.el7_2           base      213 k
 libunistring                 x86_64 0.9.3-9.el7                base      293 k
 libwayland-client            x86_64 1.15.0-1.el7               base       33 k
 libwayland-server            x86_64 1.15.0-1.el7               base       39 k
 libxcb                       x86_64 1.13-1.el7                 base      214 k
 libxshmfence                 x86_64 1.2-1.el7                  base      7.2 k
 libxslt                      x86_64 1.1.28-5.el7               base      242 k
 m4                           x86_64 1.4.16-10.el7              base      256 k
 mailx                        x86_64 12.5-19.el7                base      245 k
 make                         x86_64 1:3.82-23.el7              base      420 k
 man-db                       x86_64 2.6.3-11.el7               base      832 k
 mesa-libEGL                  x86_64 18.0.5-3.el7               base      101 k
 mesa-libGL                   x86_64 18.0.5-3.el7               base      162 k
 mesa-libgbm                  x86_64 18.0.5-3.el7               base       38 k
 mesa-libglapi                x86_64 18.0.5-3.el7               base       44 k
 net-tools                    x86_64 2.0-0.24.20131004git.el7   base      306 k
 patch                        x86_64 2.7.1-10.el7_5             base      110 k
 psmisc                       x86_64 22.20-15.el7               base      141 k
 redhat-lsb-core              x86_64 4.1-27.el7.centos.1        base       38 k
 redhat-lsb-submod-security   x86_64 4.1-27.el7.centos.1        base       15 k
 spax                         x86_64 1.5.2-13.el7               base      260 k
 ssmtp                        x86_64 2.64-14.el7                epel       50 k
 sysvinit-tools               x86_64 2.88-14.dsf.el7            base       63 k
 time                         x86_64 1.7-45.el7                 base       30 k
Updating for dependencies:
 file-libs                    x86_64 5.11-35.el7                base      340 k

Transaction Summary
================================================================================
Install  2 Packages (+67 Dependent packages)
Upgrade             (  1 Dependent package)

Total size: 3.5 G
Total download size: 16 M
Downloading packages:
Delta RPMs disabled because /usr/bin/applydeltarpm not installed.
http://centos.mirrors.proxad.net/7.6.1810/os/x86_64/Packages/spax-1.5.2-13.el7.x86_64.rpm: [Errno -1] Package does not match intended download. Suggestion: run yum --enablerepo=base clean metadata
Trying other mirror.
warning: /var/cache/yum/x86_64/7/epel/packages/ssmtp-2.64-14.el7.x86_64.rpm: Header V3 RSA/SHA256 Signature, key ID 352c64e5: NOKEY
Public key for ssmtp-2.64-14.el7.x86_64.rpm is not installed
http://ftp.pasteur.fr/mirrors/CentOS/7.6.1810/os/x86_64/Packages/spax-1.5.2-13.el7.x86_64.rpm: [Errno -1] Package does not match intended download. Suggestion: run yum --enablerepo=base clean metadata
Trying other mirror.
--------------------------------------------------------------------------------
Total                                              2.1 MB/s |  16 MB  00:07     
Retrieving key from file:///etc/pki/rpm-gpg/RPM-GPG-KEY-EPEL-7
Importing GPG key 0x352C64E5:
 Userid     : "Fedora EPEL (7) <epel@fedoraproject.org>"
 Fingerprint: 91e9 7d7c 4a5e 96f1 7f3e 888f 6a2f aea2 352c 64e5
 Package    : epel-release-7-11.noarch (installed)
 From       : /etc/pki/rpm-gpg/RPM-GPG-KEY-EPEL-7
Running transaction check
Running transaction test
Transaction test succeeded
Running transaction
  Installing : mesa-libglapi-18.0.5-3.el7.x86_64                           1/71 
  Installing : libxshmfence-1.2-1.el7.x86_64                               2/71 
  Installing : libunistring-0.9.3-9.el7.x86_64                             3/71 
  Installing : libgomp-4.8.5-36.el7.x86_64                                 4/71 
  Installing : 1:libglvnd-1.0.1-0.8.git5baa1e5.el7.x86_64                  5/71 
  Installing : libcroco-0.6.12-4.el7.x86_64                                6/71 
  Installing : avahi-libs-0.6.31-19.el7.x86_64                             7/71 
  Installing : fontpackages-filesystem-1.44-8.el7.noarch                   8/71 
  Installing : libwayland-server-1.15.0-1.el7.x86_64                       9/71 
  Installing : dejavu-fonts-common-2.33-6.el7.noarch                      10/71 
  Installing : dejavu-sans-fonts-2.33-6.el7.noarch                        11/71 
  Installing : 1:cups-libs-1.6.3-35.el7.x86_64                            12/71 
  Installing : 1:cups-client-1.6.3-35.el7.x86_64                          13/71 
  Installing : gettext-libs-0.19.8.1-2.el7.x86_64                         14/71 
  Installing : gettext-0.19.8.1-2.el7.x86_64                              15/71 
install-info: No such file or directory for /usr/share/info/gettext.info.gz
  Installing : cronie-1.4.11-20.el7_6.x86_64                              16/71 
  Installing : crontabs-1.11-6.20121102git.el7.noarch                     17/71 
  Installing : cronie-anacron-1.4.11-20.el7_6.x86_64                      18/71 
  Installing : less-458-9.el7.x86_64                                      19/71 
  Installing : time-1.7-45.el7.x86_64                                     20/71 
  Installing : 1:make-3.82-23.el7.x86_64                                  21/71 
  Installing : ssmtp-2.64-14.el7.x86_64                                   22/71 
  Installing : libX11-common-1.6.5-2.el7.noarch                           23/71 
  Installing : spax-1.5.2-13.el7.x86_64                                   24/71 
  Installing : libXau-1.0.8-2.1.el7.x86_64                                25/71 
  Installing : libxcb-1.13-1.el7.x86_64                                   26/71 
  Installing : libX11-1.6.5-2.el7.x86_64                                  27/71 
  Installing : libXext-1.3.3-3.el7.x86_64                                 28/71 
  Installing : libXxf86vm-1.1.4-1.el7.x86_64                              29/71 
  Installing : libXfixes-5.0.3-1.el7.x86_64                               30/71 
  Installing : libXdamage-1.1.4-4.1.el7.x86_64                            31/71 
  Installing : libXi-1.7.9-1.el7.x86_64                                   32/71 
  Installing : libXrender-0.9.10-1.el7.x86_64                             33/71 
  Installing : libXcomposite-0.4.4-4.1.el7.x86_64                         34/71 
  Installing : fuse-libs-2.9.2-11.el7.x86_64                              35/71 
  Installing : psmisc-22.20-15.el7.x86_64                                 36/71 
  Installing : patch-2.7.1-10.el7_5.x86_64                                37/71 
  Installing : redhat-lsb-submod-security-4.1-27.el7.centos.1.x86_64      38/71 
  Installing : libxslt-1.1.28-5.el7.x86_64                                39/71 
  Installing : at-3.1.13-24.el7.x86_64                                    40/71 
  Installing : libpipeline-1.2.3-3.el7.x86_64                             41/71 
  Installing : man-db-2.6.3-11.el7.x86_64                                 42/71 
  Installing : net-tools-2.0-0.24.20131004git.el7.x86_64                  43/71 
  Installing : gdb-7.6.1-114.el7.x86_64                                   44/71 
  Installing : mailx-12.5-19.el7.x86_64                                   45/71 
  Updating   : file-libs-5.11-35.el7.x86_64                               46/71 
  Installing : file-5.11-35.el7.x86_64                                    47/71 
  Installing : 1:bash-completion-2.1-6.el7.noarch                         48/71 
  Installing : libwayland-client-1.15.0-1.el7.x86_64                      49/71 
  Installing : bc-1.06.95-13.el7.x86_64                                   50/71 
  Installing : libICE-1.0.9-9.el7.x86_64                                  51/71 
  Installing : sysvinit-tools-2.88-14.dsf.el7.x86_64                      52/71 
  Installing : m4-1.4.16-10.el7.x86_64                                    53/71 
  Installing : 2:libpng-1.5.13-7.el7_2.x86_64                             54/71 
  Installing : freetype-2.8-12.el7.x86_64                                 55/71 
  Installing : fontconfig-2.13.0-4.3.el7.x86_64                           56/71 
  Installing : ed-1.9-4.el7.x86_64                                        57/71 
install-info: No such file or directory for /usr/share/info/ed.info.gz
  Installing : redhat-lsb-core-4.1-27.el7.centos.1.x86_64                 58/71 
  Installing : hwdata-0.252-9.1.el7.x86_64                                59/71 
  Installing : libpciaccess-0.14-1.el7.x86_64                             60/71 
  Installing : libdrm-2.4.91-3.el7.x86_64                                 61/71 
  Installing : 1:libglvnd-glx-1.0.1-0.8.git5baa1e5.el7.x86_64             62/71 
  Installing : mesa-libGL-18.0.5-3.el7.x86_64                             63/71 
  Installing : freeglut-3.0.0-8.el7.x86_64                                64/71 
  Installing : mesa-libgbm-18.0.5-3.el7.x86_64                            65/71 
  Installing : 1:libglvnd-egl-1.0.1-0.8.git5baa1e5.el7.x86_64             66/71 
  Installing : mesa-libEGL-18.0.5-3.el7.x86_64                            67/71 
  Installing : fuse-2.9.2-11.el7.x86_64                                   68/71 
This system meets or exceeds the minimum recommended Tableau Server requirements
  Installing : tableau-server-20183.18.1214.0808-20183-18.1214.0808.x86   69/71 
Creating /usr/lib64/libcrypt.so (a workaround for some RHEL 7-based installations)
sysctl: setting key "kernel.core_pattern": Read-only file system
sysctl: setting key "kernel.sem": Read-only file system
warning: %post(tableau-server-20183.18.1214.0808-20183-18.1214.0808.x86_64) scriptlet failed, exit status 255
Non-fatal POSTIN scriptlet failure in rpm package tableau-server-20183.18.1214.0808-20183-18.1214.0808.x86_64
  Installing : vertica-client-9.1.1-0.x86_64                              70/71 

Vertica Analytic Database Clients V9.1.1-0 successfully installed on host e4d3105b88f4

To download the latest Vertica documentation in zip or tar format:
http://my.vertica.com/documentation/vertica/

  Cleanup    : file-libs-5.11-33.el7.x86_64                               71/71 
  Verifying  : libXext-1.3.3-3.el7.x86_64                                  1/71 
  Verifying  : libpciaccess-0.14-1.el7.x86_64                              2/71 
  Verifying  : libXi-1.7.9-1.el7.x86_64                                    3/71 
  Verifying  : fontconfig-2.13.0-4.3.el7.x86_64                            4/71 
  Verifying  : fuse-2.9.2-11.el7.x86_64                                    5/71 
  Verifying  : libXrender-0.9.10-1.el7.x86_64                              6/71 
  Verifying  : crontabs-1.11-6.20121102git.el7.noarch                      7/71 
  Verifying  : 1:libglvnd-glx-1.0.1-0.8.git5baa1e5.el7.x86_64              8/71 
  Verifying  : libXxf86vm-1.1.4-1.el7.x86_64                               9/71 
  Verifying  : hwdata-0.252-9.1.el7.x86_64                                10/71 
  Verifying  : libwayland-server-1.15.0-1.el7.x86_64                      11/71 
  Verifying  : mesa-libGL-18.0.5-3.el7.x86_64                             12/71 
  Verifying  : ed-1.9-4.el7.x86_64                                        13/71 
  Verifying  : 2:libpng-1.5.13-7.el7_2.x86_64                             14/71 
  Verifying  : m4-1.4.16-10.el7.x86_64                                    15/71 
  Verifying  : sysvinit-tools-2.88-14.dsf.el7.x86_64                      16/71 
  Verifying  : libICE-1.0.9-9.el7.x86_64                                  17/71 
  Verifying  : dejavu-fonts-common-2.33-6.el7.noarch                      18/71 
  Verifying  : fontpackages-filesystem-1.44-8.el7.noarch                  19/71 
  Verifying  : gettext-libs-0.19.8.1-2.el7.x86_64                         20/71 
  Verifying  : bc-1.06.95-13.el7.x86_64                                   21/71 
  Verifying  : freetype-2.8-12.el7.x86_64                                 22/71 
  Verifying  : libwayland-client-1.15.0-1.el7.x86_64                      23/71 
  Verifying  : avahi-libs-0.6.31-19.el7.x86_64                            24/71 
  Verifying  : 1:bash-completion-2.1-6.el7.noarch                         25/71 
  Verifying  : libcroco-0.6.12-4.el7.x86_64                               26/71 
  Verifying  : libdrm-2.4.91-3.el7.x86_64                                 27/71 
  Verifying  : mesa-libgbm-18.0.5-3.el7.x86_64                            28/71 
  Verifying  : gettext-0.19.8.1-2.el7.x86_64                              29/71 
  Verifying  : file-libs-5.11-35.el7.x86_64                               30/71 
  Verifying  : mailx-12.5-19.el7.x86_64                                   31/71 
  Verifying  : libXcomposite-0.4.4-4.1.el7.x86_64                         32/71 
  Verifying  : 1:libglvnd-1.0.1-0.8.git5baa1e5.el7.x86_64                 33/71 
  Verifying  : libxcb-1.13-1.el7.x86_64                                   34/71 
  Verifying  : gdb-7.6.1-114.el7.x86_64                                   35/71 
  Verifying  : mesa-libglapi-18.0.5-3.el7.x86_64                          36/71 
  Verifying  : man-db-2.6.3-11.el7.x86_64                                 37/71 
  Verifying  : tableau-server-20183.18.1214.0808-20183-18.1214.0808.x86   38/71 
  Verifying  : file-5.11-35.el7.x86_64                                    39/71 
  Verifying  : net-tools-2.0-0.24.20131004git.el7.x86_64                  40/71 
  Verifying  : libpipeline-1.2.3-3.el7.x86_64                             41/71 
  Verifying  : libgomp-4.8.5-36.el7.x86_64                                42/71 
  Verifying  : at-3.1.13-24.el7.x86_64                                    43/71 
  Verifying  : cronie-1.4.11-20.el7_6.x86_64                              44/71 
  Verifying  : libxslt-1.1.28-5.el7.x86_64                                45/71 
  Verifying  : libX11-1.6.5-2.el7.x86_64                                  46/71 
  Verifying  : dejavu-sans-fonts-2.33-6.el7.noarch                        47/71 
  Verifying  : redhat-lsb-submod-security-4.1-27.el7.centos.1.x86_64      48/71 
  Verifying  : patch-2.7.1-10.el7_5.x86_64                                49/71 
  Verifying  : psmisc-22.20-15.el7.x86_64                                 50/71 
  Verifying  : cronie-anacron-1.4.11-20.el7_6.x86_64                      51/71 
  Verifying  : vertica-client-9.1.1-0.x86_64                              52/71 
  Verifying  : 1:cups-client-1.6.3-35.el7.x86_64                          53/71 
  Verifying  : libXfixes-5.0.3-1.el7.x86_64                               54/71 
  Verifying  : mesa-libEGL-18.0.5-3.el7.x86_64                            55/71 
  Verifying  : libunistring-0.9.3-9.el7.x86_64                            56/71 
  Verifying  : 1:cups-libs-1.6.3-35.el7.x86_64                            57/71 
  Verifying  : libxshmfence-1.2-1.el7.x86_64                              58/71 
  Verifying  : fuse-libs-2.9.2-11.el7.x86_64                              59/71 
  Verifying  : libXau-1.0.8-2.1.el7.x86_64                                60/71 
  Verifying  : 1:libglvnd-egl-1.0.1-0.8.git5baa1e5.el7.x86_64             61/71 
  Verifying  : spax-1.5.2-13.el7.x86_64                                   62/71 
  Verifying  : libX11-common-1.6.5-2.el7.noarch                           63/71 
  Verifying  : ssmtp-2.64-14.el7.x86_64                                   64/71 
  Verifying  : libXdamage-1.1.4-4.1.el7.x86_64                            65/71 
  Verifying  : redhat-lsb-core-4.1-27.el7.centos.1.x86_64                 66/71 
  Verifying  : 1:make-3.82-23.el7.x86_64                                  67/71 
  Verifying  : freeglut-3.0.0-8.el7.x86_64                                68/71 
  Verifying  : time-1.7-45.el7.x86_64                                     69/71 
  Verifying  : less-458-9.el7.x86_64                                      70/71 
  Verifying  : file-libs-5.11-33.el7.x86_64                               71/71 

Installed:
  tableau-server-20183.18.1214.0808.x86_64 0:20183-18.1214.0808                 
  vertica-client.x86_64 0:9.1.1-0                                               

Dependency Installed:
  at.x86_64 0:3.1.13-24.el7                                                     
  avahi-libs.x86_64 0:0.6.31-19.el7                                             
  bash-completion.noarch 1:2.1-6.el7                                            
  bc.x86_64 0:1.06.95-13.el7                                                    
  cronie.x86_64 0:1.4.11-20.el7_6                                               
  cronie-anacron.x86_64 0:1.4.11-20.el7_6                                       
  crontabs.noarch 0:1.11-6.20121102git.el7                                      
  cups-client.x86_64 1:1.6.3-35.el7                                             
  cups-libs.x86_64 1:1.6.3-35.el7                                               
  dejavu-fonts-common.noarch 0:2.33-6.el7                                       
  dejavu-sans-fonts.noarch 0:2.33-6.el7                                         
  ed.x86_64 0:1.9-4.el7                                                         
  file.x86_64 0:5.11-35.el7                                                     
  fontconfig.x86_64 0:2.13.0-4.3.el7                                            
  fontpackages-filesystem.noarch 0:1.44-8.el7                                   
  freeglut.x86_64 0:3.0.0-8.el7                                                 
  freetype.x86_64 0:2.8-12.el7                                                  
  fuse.x86_64 0:2.9.2-11.el7                                                    
  fuse-libs.x86_64 0:2.9.2-11.el7                                               
  gdb.x86_64 0:7.6.1-114.el7                                                    
  gettext.x86_64 0:0.19.8.1-2.el7                                               
  gettext-libs.x86_64 0:0.19.8.1-2.el7                                          
  hwdata.x86_64 0:0.252-9.1.el7                                                 
  less.x86_64 0:458-9.el7                                                       
  libICE.x86_64 0:1.0.9-9.el7                                                   
  libX11.x86_64 0:1.6.5-2.el7                                                   
  libX11-common.noarch 0:1.6.5-2.el7                                            
  libXau.x86_64 0:1.0.8-2.1.el7                                                 
  libXcomposite.x86_64 0:0.4.4-4.1.el7                                          
  libXdamage.x86_64 0:1.1.4-4.1.el7                                             
  libXext.x86_64 0:1.3.3-3.el7                                                  
  libXfixes.x86_64 0:5.0.3-1.el7                                                
  libXi.x86_64 0:1.7.9-1.el7                                                    
  libXrender.x86_64 0:0.9.10-1.el7                                              
  libXxf86vm.x86_64 0:1.1.4-1.el7                                               
  libcroco.x86_64 0:0.6.12-4.el7                                                
  libdrm.x86_64 0:2.4.91-3.el7                                                  
  libglvnd.x86_64 1:1.0.1-0.8.git5baa1e5.el7                                    
  libglvnd-egl.x86_64 1:1.0.1-0.8.git5baa1e5.el7                                
  libglvnd-glx.x86_64 1:1.0.1-0.8.git5baa1e5.el7                                
  libgomp.x86_64 0:4.8.5-36.el7                                                 
  libpciaccess.x86_64 0:0.14-1.el7                                              
  libpipeline.x86_64 0:1.2.3-3.el7                                              
  libpng.x86_64 2:1.5.13-7.el7_2                                                
  libunistring.x86_64 0:0.9.3-9.el7                                             
  libwayland-client.x86_64 0:1.15.0-1.el7                                       
  libwayland-server.x86_64 0:1.15.0-1.el7                                       
  libxcb.x86_64 0:1.13-1.el7                                                    
  libxshmfence.x86_64 0:1.2-1.el7                                               
  libxslt.x86_64 0:1.1.28-5.el7                                                 
  m4.x86_64 0:1.4.16-10.el7                                                     
  mailx.x86_64 0:12.5-19.el7                                                    
  make.x86_64 1:3.82-23.el7                                                     
  man-db.x86_64 0:2.6.3-11.el7                                                  
  mesa-libEGL.x86_64 0:18.0.5-3.el7                                             
  mesa-libGL.x86_64 0:18.0.5-3.el7                                              
  mesa-libgbm.x86_64 0:18.0.5-3.el7                                             
  mesa-libglapi.x86_64 0:18.0.5-3.el7                                           
  net-tools.x86_64 0:2.0-0.24.20131004git.el7                                   
  patch.x86_64 0:2.7.1-10.el7_5                                                 
  psmisc.x86_64 0:22.20-15.el7                                                  
  redhat-lsb-core.x86_64 0:4.1-27.el7.centos.1                                  
  redhat-lsb-submod-security.x86_64 0:4.1-27.el7.centos.1                       
  spax.x86_64 0:1.5.2-13.el7                                                    
  ssmtp.x86_64 0:2.64-14.el7                                                    
  sysvinit-tools.x86_64 0:2.88-14.dsf.el7                                       
  time.x86_64 0:1.7-45.el7                                                      

Dependency Updated:
  file-libs.x86_64 0:5.11-35.el7                                                

Complete!
Removing intermediate container e4d3105b88f4
 ---> 6463e64edb9e
Step 18/28 : RUN groupadd tableau &&     groupadd tsmadmin &&     usermod tsm -aG tableau,tsmadmin &&     useradd --system --comment "Tableau Server" --shell /bin/bash --create-home --home-dir /var/opt/tableau -g tableau tableau &&     chown tableau /var/opt/tableau/.
 ---> Running in baa33cdaae46
useradd: warning: the home directory already exists.
Not copying any file from skel directory into it.
Removing intermediate container baa33cdaae46
 ---> 9cfc7761cead
Step 19/28 : RUN mkdir -p /etc/systemd/system/default.target.wants              /etc/security/limits.d/              /etc/systemd/logind.conf.d/
 ---> Running in 9c58e77f3ec9
Removing intermediate container 9c58e77f3ec9
 ---> 16a81c8bbf68
Step 20/28 : COPY config/* /opt/tableau/docker_build/
 ---> 90dd8ba098e1
Step 21/28 : RUN cp /opt/tableau/docker_build/tableau_server_install.service /etc/systemd/system/
 ---> Running in ae256a35e190
Removing intermediate container ae256a35e190
 ---> ff786600c5e9
Step 22/28 : RUN cp /opt/tableau/docker_build/99-tableau_server_limitsd.conf /etc/security/limits.d/
 ---> Running in 0e7183dfc81a
Removing intermediate container 0e7183dfc81a
 ---> cf6cb6c443fd
Step 23/28 : RUN cp /opt/tableau/docker_build/tableau_server_logind.conf /etc/systemd/logind.conf.d/
 ---> Running in 126e6c3b1210
Removing intermediate container 126e6c3b1210
 ---> b1baafe56ee2
Step 24/28 : RUN cp /opt/tableau/docker_build/user@at.service /etc/systemd/system/user@`id -u tableau`.service
 ---> Running in 2f28d76ab00c
Removing intermediate container 2f28d76ab00c
 ---> a9416b66f3b9
Step 25/28 : RUN systemctl enable tableau_server_install
 ---> Running in 3b676b4538af
Created symlink /etc/systemd/system/multi-user.target.wants/tableau_server_install.service, pointing to /etc/systemd/system/tableau_server_install.service.
Removing intermediate container 3b676b4538af
 ---> 9aea5d3f4c42
Step 26/28 : RUN systemctl enable user@`id -u tableau`.service
 ---> Running in 26d8348baed3
Created symlink /etc/systemd/system/default.target.wants/user@999.service, pointing to /etc/systemd/system/user@999.service.
Removing intermediate container 26d8348baed3
 ---> 96592e1295af
Step 27/28 : EXPOSE 80 8850
 ---> Running in ef447c881d15
Removing intermediate container ef447c881d15
 ---> 6cc6b4dd662c
Step 28/28 : CMD /sbin/init
 ---> Running in 7ce31ce9a88b
Removing intermediate container 7ce31ce9a88b
 ---> d1770e3161f0
Successfully built d1770e3161f0
Successfully tagged tableau-server:2018-3-2
WARNING: Image for service tableau-server was built because it did not already exist. To rebuild this image you must use `docker-compose build` or `docker-compose up --build`.
Creating tableau-server
```

## second step: follow Tableau install

```
>tail -f logs/
[2019-01-03 22:48:12+00:00]: update TSM_PASSWORD
[2019-01-03 22:48:12+00:00]: start initalize tsm
[2019-01-03 22:48:12+00:00]: Thu Jan 3 22:48:12 UTC 2019
++ date +%y.%m%d.%H%M.%S
+ trace_file=/var/tmp/initialize-tsm-19.0103.2248.12.log
+ exec
+ BASH_XTRACEFD=11
Creating directories and setting permissions...
Using '/var/opt/tableau/tableau_server' as the data directory.
Adding user 'tsm' to group 'tableau'...
Adding user 'tsm' to group 'tsmadmin'...
Added. Note: These group membership changes do not take effect in shells already open. For these to take effect, log out of the shell and log back in.
Creating environment file...
Starting TSM services...
Updating repository version in Tableau Server Coordination Service.
TSM services started successfully
Use the 'tsm' command to continue setting up Tableau Server.
>> Tableau binary directory will be added to PATH for new shells. To get the
>> updated path, either start a new session, or for bash users run:
>> source /etc/profile.d/tableau_server.sh
The TSM administrative web interface (and REST API) is now available at
https://tableau-server:8850
You can continue the configuration and initialization of Tableau server using either the TSM command line interface,
or the web interface.
You will be prompted to authenticate, or can log in using the username 'tsm', with the same password you used to log into this session (or any other username in the administrative group and with its password).
Done.
[2019-01-03 22:49:21+00:00]: initalize done
[2019-01-03 22:49:21+00:00]: login tsm ...
[2019-01-03 22:49:27+00:00]: login tsm done
[2019-01-03 22:49:27+00:00]: licenses activate
Trial activated.
[2019-01-03 22:49:32+00:00]: licenses activate done
[2019-01-03 22:49:32+00:00]: register
Registration complete.
[2019-01-03 22:49:39+00:00]: register done
[2019-01-03 22:49:39+00:00]: settings import
[2019-01-03 22:49:44+00:00]: settings import done
[2019-01-03 22:49:44+00:00]: pending-changes apply
Starting deployments asynchronous job.
Job id is '1', timeout is 10 minutes.
6% - Retrieving the topology to deploy.
13% - Retrieving the configuration to deploy.
20% - Validating the new topology.
26% - Determining if server needs to be started.
33% - Disabling all services.
40% - Waiting for the services to stop.
46% - Updating nodes to new topology.
53% - Waiting for topology to be applied.
60% - Updating nodes to new configuration.
66% - Disabling all services.
73% - Waiting for the services to stop.
80% - Reconfiguring services.
86% - Waiting for services to reconfigure.    
93% - Enabling all services.
100% - Waiting for the services to start.
Successfully deployed nodes with updated configuration and topology version.
[2019-01-03 22:51:10+00:00]: penging-changes apply done
[2019-01-03 22:51:10+00:00]: initalize server
Initializing the server...
Job id is '2', timeout is 33.33 minutes.
2% - Validating that there are no pending changes.
5% - Generating passwords.     
7% - Promoting configuration.
10% - Waiting for services to reconfigure.    
12% - Initializing the topology.                                  
15% - Checking if required database services are present.
17% - Disabling database services.
20% - Installing the maintenance app.    
23% - Initializing the temporary database instance.
25% - Starting the temporary database instance.    
28% - Creating roles and databases.
30% - Running migrations.    
33% - Localizing the default projects.
35% - Stopping the temporary database instance.    
38% - Making the temporary database default.    
41% - Enabling the database services.    
43% - Removing the database maintenance app.
46% - Generating new asset key.
48% - Saving asset key.
51% - Enabling the database services.
53% - Waiting for the database services to enable.    
56% - Connecting to the Backup/Restore service.
58% - Saving asset key metadata.    
61% - Disabling database services.
64% - Waiting for database services to disable.    
66% - Finalizing the topology.                                    
69% - Disabling all services.    
71% - Waiting for the services to stop.    
74% - Reconfiguring services.
76% - Waiting for services to reconfigure.    
79% - Enabling all services.    
82% - Waiting for the services to start.    
84% - Initializing the next active repository. 
84% - Initializing the next active repository.    
87% - Enabling the services required for indexing.    
89% - Connecting to Vizportal Maintenance.
92% - Rebuilding the search index.    
94% - Finalizing the initialization.
97% - Enabling all services.
100% - Waiting for the services to start.

Server was initialized successfully.
[2019-01-03 23:03:11+00:00]: initialize server done
[2019-01-03 23:03:11+00:00]: initialuser
===== redirecting to http://localhost/auth
===== Signed out
===== Creating new session
=====     Server:   http://localhost:80
=====     Username: latelier_admin
===== Connecting to the server...
===== Signing in...
===== Succeeded
[2019-01-03 23:03:16+00:00]: initial user login is latelier_admin password ais6IyeequoVael5eig7SohBQui7aegh
[2019-01-03 23:03:16+00:00]: backup services conf
tar: Removing leading `/' from member names
/etc/security/limits.d/99-tableau_server_20183.18.1214.0808.conf
/etc/security/limits.d/99-tableau_server_limitsd.conf
/etc/systemd/logind.conf.d/tableau_server_20183.18.1214.0808.conf
/etc/systemd/logind.conf.d/tableau_server_logind.conf
/etc/systemd/system/user@999.service
/etc/systemd/system/default.target.wants/user@999.service
[2019-01-03 23:03:16+00:00]: all done
```

## restore previous backup
first copy your tsbak in backups/ :
```
cp path_to_backup/tableau_backup_20190301_214822-2019-01-03.tsbak backups/
```
then restore :
```
>make restore
docker exec -it tableau-server /opt/tableau/docker_build/tableau-restore.sh
Restoring 'tableau_backup_20190301_214822-2019-01-03.tsbak'...
Using server-side file name 'tableau_backup_20190301_214822-2019-01-03.tsbak'
Job id is '3', timeout is 2880 minutes.
3% - Checking backup compatibility.
6% - Generating manifest.
10% - Disabling all services.
13% - Waiting for the services to stop.    
16% - Installing restore services.    
20% - Determining required files for individual nodes.    
23% - Checking available disk space on all nodes.
26% - Transferring required files to remote nodes.
30% - Restoring data for services.  
33% - Restoring database.    
36% - Restoring asset keys.
40% - Restoring data to object storage.    
43% - Committing data for services.    
46% - Committing restored data to database.    
50% - Enabling the database services.
53% - Waiting for the database services to enable.    
56% - Connecting to the Backup/Restore service.
60% - Saving asset key metadata.    
63% - Re-encrypting assets.    
66% - Disabling database services.
70% - Waiting for database services to disable.    
73% - Committing asset keys.
76% - Committing data to object storage.
80% - Deleting temporary backup file.
83% - Cleaning up restore data on all nodes.
86% - Uninstalling restore services.
93% - Connecting to Vizportal Maintenance.
96% - Rebuilding the search index.    
100% - Disabling the services used for indexing.

The backup 'tableau_backup_20190301_214822-2019-01-03.tsbak' was successfully restored.

```
