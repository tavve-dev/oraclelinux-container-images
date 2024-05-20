#
# Tavve Dockerfile
# (c) 2024 Tavve Holdings LLC

FROM oraclelinux:9-slim-fips

RUN <<EOR
## ansible/vagrant/build necessities
microdnf install \
  gzip \
  jq \
  openssh-server \
  openssh-clients \
  python3-dnf \
  sudo \
  yum \
  zip

## ansible
microdnf --enablerepo=ol9_addons install ansible-core

## these were present in arm64 but NOT x86_64
microdnf install \
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

microdnf upgrade
EOR

CMD ["/usr/sbin/init"]
