#
# Troglobyte AppHub:
# author: Michael Gene Brockus
# mail: <mailto: michaelbrockus@gmail.com>
#
FROM ubuntu:22.04 AS dummy

# setting basic image info
ENV DEBIAN_FRONTEND noninteractive
ENV LANG 'C.UTF-8'


FROM dummy AS getter

RUN apt-get update --fix-missing && apt-get dist-upgrade -y \
    && apt-get -y install \
       apt-utils \
       python3 \
       python3-pip \
       gcc-12 \
       git \
       && rm -rf /var/lib/apt/lists/*

RUN pip3 -q install --upgrade pip \
    && python3 -m pip -q install \
       meson==0.63.0 \
       ninja==1.10.2.3
