#!bin/bash

pacman -Syu --needed --noconfirm git cmake ninja \
    libjpeg-turbo xcb-util-keysyms xcb-util-cursor libgl fontconfig xdg-utils \
    shared-mime-info xcb-util-wm libxrender libxi sqlite mesa \
    tslib libinput libxkbcommon-x11 libproxy libcups double-conversion brotli libb2 \
    libfbclient mariadb-libs unixodbc postgresql alsa-lib gst-plugins-base-libs \
    gtk3 libpulse cups freetds vulkan-headers xmlstarlet \
    python at-spi2-core \
    libxcomposite \
    abseil-cpp c-ares re2

curl -LO https://github.com/Shadowsocks-NET/qt-static-build/releases/download/v6.2.0-beta3/qt-somewhere-static-v6.2.0-beta3-archlinux-x86_64.tar.zst
mkdir static-installed
tar -C static-installed -xf qt-somewhere-static-v6.2.0-beta3-archlinux-x86_64.tar.zst

git clone https://github.com/grpc/grpc --recursive --verbose --depth 1
mkdir grpc-build && cd grpc-build
cmake ../grpc \
    -DBUILD_SHARED_LIBS=OFF \
    -DCMAKE_BUILD_TYPE=Release \
    -DCMAKE_INSTALL_PREFIX=../static-installed \
    -GNinja
cmake --build . --parallel
cmake --install .
cd ..

export CMAKE_PREFIX_PATH="$(pwd)/static-installed"

git clone https://github.com/Shadowsocks-NET/QvMeta.git --verbose --depth 1
cd QvMeta
git clone https://github.com/Shadowsocks-NET/Qv2ray.git --recursive --verbose --depth 1
git clone https://github.com/Shadowsocks-NET/QvPlugins.git --recursive --verbose --depth 1
cd ..
mkdir QvMeta-build && cd QvMeta-build
cmake ../QvMeta \
    -DBUILD_TESTING=OFF \
    -DCMAKE_BUILD_TYPE=Release \
    -DCMAKE_INSTALL_PREFIX=installed \
    -DQV2RAY_BUILD_INFO="Qv2ray Static Nightly Build for AUR" \
    -DQV2RAY_DEFAULT_VASSETS_PATH="/usr/share/v2ray" \
    -DQV2RAY_DEFAULT_VCORE_PATH="/usr/bin/v2ray" \
    -DQV2RAY_AUTO_UPDATE=OFF \
    -DUSE_SYSTEM_LIBUV=OFF \
    -DUSE_SYSTEM_UVW=OFF \
    -GNinja
cmake --build . --parallel
cmake --install .
