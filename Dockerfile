FROM olivergw/trinitycore-base

RUN cd /root && git clone -b 3.3.5 git://github.com/TrinityCore/TrinityCore.git

RUN mkdir /root/TrinityCore/build

WORKDIR /root/TrinityCore/build

RUN cmake ../ -DCMAKE_INSTALL_PREFIX=/root/server && \
    make -j $(nproc) install && \
    rm -rf /root/TrinityCore/build

EXPOSE 3443 3724 8085

CMD ["/root/server/bin/worldserver"]
