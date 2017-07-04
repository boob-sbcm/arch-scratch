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
RUN ["/.ducktape", "https://github.com/binhex/arch-scratch/releases/download/0.0.2/archlinux-root-2017-07-04.tar.bz2"]

# remove bootstrap files
RUN /usr/bin/rm -f /.shim /.cert /.ducktape /.dockerenv /.dockerinit

# set entry point as /bin/bash
CMD ["/bin/bash"]