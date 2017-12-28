FROM ubuntu:17.10

WORKDIR /root

COPY . ./

RUN apt-get -qq update -y \
    && DEBIAN_FRONTEND=noninteractive apt-get -qq install -y --no-install-recommends \
        build-essential \
        pkg-config \
        git \
        libsfml-dev \
        libjpeg-dev \
        zlib1g-dev \
        libfreetype6-dev \
        libavformat-dev \
        libavcodec-dev \
        libswscale-dev \
        libavutil-dev \
        libswresample-dev \
        freeglut3-dev \
	libopenal-dev \
	libfontconfig1-dev \
	libxinerama-dev \
	libarchive-dev \
    && apt-get clean -y \
    && rm -rf /var/cache/apt/archives/* /var/lib/apt/lists/* /tmp/* /var/tmp/* \
    && make \
    && make install
	
