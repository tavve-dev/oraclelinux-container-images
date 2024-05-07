#
# Tavve Dockerfile
# (c) 2024 Tavve Holdings LLC

FROM oraclelinux:9-slim-fips

## epel
RUN microdnf install oracle-epel-release-el9

## ansible/vagrant necessities
RUN microdnf install \
    ansible \
    openssh-server \
    openssh-clients \
    python3-dnf \
    sudo \
    yum

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

CMD ["/lib/systemd/systemd"]
