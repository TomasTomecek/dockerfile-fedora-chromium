FROM fedora:21
MAINTAINER Tomas Tomecek <ttomecek@redhat.com>
#RUN yum install -y dnf dnf-plugins-core && \
#    dnf copr enable -y spot/chromium
RUN printf "[spot-chromium]\nname=spot-chromium\nbaseurl=https://repos.fedorapeople.org/repos/spot/chromium/fedora-21/x86_64/\nenabled=1\ngpgcheck=0" >/etc/yum.repos.d/spot-chromium.repo
RUN yum install -y chromium
RUN yum install -y libv4l pango libexif-devel pangox-compat
RUN yum install -y dejavu\*fonts\*
RUN useradd -o -u ${USER_ID} -G video chromium
USER chromium
ENV HOME /home/chromium
CMD ["/usr/bin/chromium-browser"]
