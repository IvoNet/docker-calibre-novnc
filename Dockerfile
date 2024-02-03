FROM ivonet/ubuntu:22.04
LABEL maintainer="Ivo Woltring - @ivonet"

RUN apt-get update -qq -y                      \
 && apt-get install -y --no-install-recommends \
        wget \
        xz-utils \
        libqt5gui5 \
        libqt5x11extras5 \
        libgl1-mesa-dri \
        libopengl0 \
        libxcb-cursor0 \
 && apt-get clean                              \
 && rm -rf /var/lib/apt/lists/*

RUN wget -nv -O- https://download.calibre-ebook.com/linux-installer.sh | sh /dev/stdin

ENV LIBGL_ALWAYS_SOFTWARE=true

COPY root/ /
WORKDIR  /root/inbox
EXPOSE 7777
VOLUME ["/calibre-library", \
        "/root/inbox",    \
        "/calibre-autoscan"]

CMD ["sh", "/startapp.sh"]
