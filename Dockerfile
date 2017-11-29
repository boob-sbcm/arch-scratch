FROM scratch
MAINTAINER binhex

# additional files
##################

# add statically linked busybox
ADD build/busybox/busybox /bootstrap/busybox

# unpack tarball
################

# symlink busybox utilities to /bootstrap
RUN ["/bootstrap/busybox", "--install", "-s", "/bootstrap"]

# run busybox bourne shell and use sub shell to execute busbox utils
RUN ["/bootstrap/busybox", "sh", "-c", "/bootstrap/wget -O /bootstrap/archlinux.tar.bz2 \
    https://github.com/binhex/arch-scratch/releases/download/2017102500/archlinux-root-2017-10-25.tar.bz2; \
    /bootstrap/tar -xvjf /bootstrap/archlinux.tar.bz2 -C /; \
    /bootstrap/rm -rf /bootstrap /.dockerenv /.dockerinit"]

# set entry point as /bin/bash
CMD ["/bin/bash"]
