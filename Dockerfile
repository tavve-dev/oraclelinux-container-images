#
# Tavve Dockerfile
# (c) 2024 Tavve Holdings LLC

FROM oraclelinux:9-slim-fips

## ansible/vagrant necessities
RUN microdnf install \
    openssh-server \
    openssh-clients \
    python3-dnf \
    sudo \
    yum

## ansible
RUN microdnf --enablerepo=ol9_addons install ansible-core

## these were present in arm64 but NOT x86_64
RUN microdnf install \
    acl \
    cracklib \
    cracklib-dicts \
    dbus \
    dbus-broker \
    dbus-common \
    expat \
    gzip \
    kmod-libs \
    libdb \
    libeconf \
    libfdisk \
    libpwquality \
    libseccomp \
    libutempter \
    openssh \
    openssl \
    pam \
    systemd \
    systemd-libs \
    systemd-pam \
    systemd-rpm-macros \
    util-linux \
    util-linux-core

CMD ["/usr/sbin/init"]
