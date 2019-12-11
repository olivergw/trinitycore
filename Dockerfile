FROM debian:9
LABEL maintainer="Oliver GW ogw@nwcn.co.uk"

RUN apt-get update && apt-get install -y \
    git \
    clang \
    cmake \
    gcc \
    g++ \
    libmariadbclient-dev \
    libssl-dev \
    libbz2-dev \
    libreadline-dev \
    libncurses-dev \
    libboost-all-dev \
    p7zip \
    default-libmysqlclient-dev \
    mariadb-client \
    && rm -rf /var/lib/apt/lists/*

RUN update-alternatives --install /usr/bin/cc cc /usr/bin/clang 100 && update-alternatives --install /usr/bin/c++ c++ /usr/bin/clang 100

LABEL version="3.3.5a.12340"
LABEL build-date="2019-12-11T10-10-20Z"

RUN cd /root && git clone -b 3.3.5 git://github.com/TrinityCore/TrinityCore.git

RUN mkdir /root/TrinityCore/build

WORKDIR /root/TrinityCore/build

RUN cmake ../ -DCMAKE_INSTALL_PREFIX=/root/server && \
    make -j $(nproc) install && \
    rm -rf /root/TrinityCore/build

EXPOSE 3443 3724 8085

CMD ["/root/server/bin/worldserver"]
