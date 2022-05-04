FROM ubuntu:20.04
WORKDIR /home
ENV DEBIAN_FRONTEND noninteractive
RUN apt update \
    && apt upgrade -y \
    && apt install -y unzip libtool-bin curl cmake gperf gawk flex bison nano xxd \
    fakeroot kmod cpio git python3-docutils gettext automake autopoint \
    texinfo build-essential help2man pkg-config zlib1g-dev libgmp3-dev \
    libmpc-dev libmpfr-dev libncurses5-dev libltdl-dev wget libc-dev-bin
RUN git clone --progress https://github.com/hanwckf/padavan-4.4.git
RUN ls -la
RUN cd padavan-4.4/toolchain-mipsel \
    && sh dl_toolchain.sh \
    && cd
RUN cd padavan-4.4/trunk \
    && fakeroot ./build_firmware_modify CR660x
VOLUME [ "/home/padavan-4.4" ]

