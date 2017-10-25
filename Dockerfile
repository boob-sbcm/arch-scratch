FROM scratch
MAINTAINER binhex

# additional files
##################

# add bootstrap files
ADD build/shim/shim /.shim
ADD build/cert/cert /.cert
ADD build/ducktape/ducktape /.ducktape

# install app
#############

# run shim to set execute permissions for ducktape
RUN ["/.shim", ""]

# run ducktape to download and extract root tarball
RUN ["/.ducktape", "https://github.com/binhex/arch-scratch/releases/download/2017102500/archlinux-root-2017-10-25.tar.bz2"]

# remove bootstrap files
RUN /usr/bin/rm -f /.shim /.cert /.ducktape /.dockerenv /.dockerinit

# set entry point as /bin/bash
CMD ["/bin/bash"]