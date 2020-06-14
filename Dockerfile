FROM ubuntu:focal

LABEL maintainer="Claudio Bantaloukas <rockdreamer@gmail.com>"
# Based on work by Luis Martinez de Bartolome <luism@jfrog.com>

ENV CXX=/usr/bin/g++ \
    CC=/usr/bin/gcc \
    DEBIAN_FRONTEND=noninteractive

RUN apt-get -qq update \
    && apt-get -qq install -y --no-install-recommends \
       sudo \
       binutils \
       wget \
       git \
       libc6-dev \
       g++-10 \
       libgmp-dev \
       libmpfr-dev \
       libmpc-dev \
       nasm \
       dh-autoreconf \
       ninja-build \
       libffi-dev \
       libssl-dev \
       pkg-config \
       subversion \
       zlib1g-dev \
       libbz2-dev \
       libsqlite3-dev \
       libreadline-dev \
       xz-utils \
       curl \
       libncurses5-dev \
       libncursesw5-dev \
       liblzma-dev \
       ca-certificates \
       autoconf-archive \
       python3-pip \
    && update-alternatives --install /usr/bin/g++ g++ /usr/bin/g++-10 100 \
    && update-alternatives --install /usr/bin/c++ c++ /usr/bin/g++-10 100 \
    && update-alternatives --install /usr/bin/gcc gcc /usr/bin/gcc-10 100 \
    && update-alternatives --install /usr/bin/cc cc /usr/bin/gcc-10 100 \
    && ln -s /usr/include/locale.h /usr/include/xlocale.h \
    && rm -rf /var/lib/apt/lists/* \
    && wget --no-check-certificate --quiet https://cmake.org/files/v3.17/cmake-3.17.3-Linux-x86_64.tar.gz \
    && tar -xzf cmake-3.17.3-Linux-x86_64.tar.gz \
       --exclude=bin/cmake-gui \
       --exclude=doc/cmake \
       --exclude=share/cmake-3.12/Help \
    && cp -fR cmake-3.17.3-Linux-x86_64/* /usr \
    && rm -rf cmake-3.17.3-Linux-x86_64 \
    && rm cmake-3.17.3-Linux-x86_64.tar.gz \
    && pip install -q --upgrade --no-cache-dir pip \
    && pip install -q --no-cache-dir conan conan-package-tools