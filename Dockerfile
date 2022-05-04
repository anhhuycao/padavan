FROM alpine:3.15.4
WORKDIR /home
RUN apk add make gcc g++ cpio curl wget nano xxd kmod \
    pkgconfig rpcgen fakeroot ncurses bash patch \
    bsd-compat-headers python2 python3 zlib-dev \
    automake gettext gettext-dev autoconf bison \
    flex coreutils cmake git libtool gawk sudo
RUN git clone --progress https://github.com/hanwckf/padavan-4.4.git
RUN ls -la
RUN cd padavan-4.4/toolchain-mipsel \
    && sh dl_toolchain.sh \
    && cd
RUN cd padavan-4.4/trunk \
    && fakeroot ./build_firmware_modify CR660x
VOLUME [ "/home/padavan-4.4" ]

