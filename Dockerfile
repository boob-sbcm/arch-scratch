FROM scratch
MAINTAINER binhex

# additional files
##################

# add bootstrap files
ADD build/busybox/busybox /.busybox

# install app
#############

# create bootstrap temp folder
RUN /.busybox mkdir -p /.bootstrap

# change dir
RUN /.busybox cd /.bootstrap

# download root tarball
RUN /.busybox wget -O ./archlinux.tar.bz2 "https://github.com/binhex/arch-scratch/releases/download/2017102500/archlinux-root-2017-10-25.tar.bz2"

# untar tarball
RUN /.busybox tar -xvjf ./archlinux.tar.bz2 -C /

# remove bootstrap files
RUN /usr/bin/rm -rf /.busybox /.dockerenv /.dockerinit /.bootstrap

# set entry point as /bin/bash
CMD ["/bin/bash"]