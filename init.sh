#!/bin/bash
set -x

subscription-manager register
subscription-manager release --set=8.9
dnf config-manager --disable ubi-8-appstream-rpms
dnf config-manager --disable ubi-8-baseos-rpms
dnf config-manager --disable ubi-8-codeready-builder-rpms
yum clean all
dnf clean all
rm -rf /var/cache/dnf

subscription-manager repos --enable codeready-builder-for-rhel-8-$(arch)-rpms
dnf install -y https://dl.fedoraproject.org/pub/epel/epel-release-latest-8.noarch.rpm

dnf install -y sudo zsh tcsh vim firefox iputils iproute redhat-lsb-core binutils gcc-c++ git \
  xorg-x11-xauth xorg-x11-fonts-* xorg-x11-utils dbus-x11 google-noto-sans-cjk-ttc-fonts \
  libXft libXScrnSaver libXi libXrandr libSM libpng12 libglvnd-glx libXcomposite pulseaudio-libs-glib2 graphite2 \
  ncurses-compat-libs glibc.i686 glibc-devel.i686 libnsl numactl-libs

ln -s /cad /usr/cad

read -p "Username: " USERNAME
passwd ${USERNAME}
mkhomedir_helper ${USERNAME}
usermod -aG wheel ${USERNAME}
