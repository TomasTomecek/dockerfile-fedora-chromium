#!/bin/sh

install_chromium_from_copr() {
    dnf install -y dnf dnf-plugins-core && dnf copr enable -y spot/chromium
    dnf install -y chromium || dnf copr disable -y spot/chromium
    return 2
}

install_chromium_from_fp() {
    printf "[spot-chromium]\nname=spot-chromium\nbaseurl=https://repos.fedorapeople.org/repos/spot/chromium/fedora-21/x86_64/\nenabled=1\ngpgcheck=0" >/etc/yum.repos.d/spot-chromium.repo
    dnf install -y chromium
}

install_chromium_from_copr || install_chromium_from_fp || exit 2

# FIXME: minimize only needed deps
dnf install -y libv4l pango libexif-devel pangox-compat
# chromium uses these fonts
dnf install -y dejavu\*fonts\*

dnf clean all
