FROM resin/rpi-raspbian:jessie

RUN \
    gpg --keyserver pgpkeys.mit.edu --recv-keys 8B48AD6246925553 7638D0442B90D010 \
    gpg -a --export 8B48AD6246925553 7638D0442B90D010 | apt-key add - \
    echo "deb http://http.debian.net/debian jessie-backports main" | tee \ 
    /etc/apt/sources.list.d/jessie-backports.list && \
    apt-get update && \
    apt-get install -y apt-transport-https unzip curl wget supervisor openssh-server && \
    apt-get install -y --force-yes docker.io && \

    mkdir /var/run/sshd && \
    sed -i 's/PermitRootLogin without-password/PermitRootLogin yes/' /etc/ssh/sshd_config

EXPOSE 22
