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

git clone https://github.com/qt/qtbase --branch v6.2.0-beta2 --verbose --depth 1
mkdir qt-build && cd qt-build
cmake ../qtbase \
    -DCMAKE_BUILD_TYPE=Release \
    -DBUILD_SHARED_LIBS=OFF \
    -DQT_FEATURE_sql=OFF \
    -DQT_FEATURE_dbus=OFF \
    -DQT_FEATURE_testlib=OFF \
    -DQT_FEATURE_qmake=OFF \
    -DCMAKE_INSTALL_PREFIX=../static-installed \
    -GNinja
cmake --build . --parallel
cmake --install .
cd ..

git clone https://github.com/qt/qtsvg --branch v6.2.0-beta2 --verbose --depth 1
mkdir qtsvg-build && cd qtsvg-build
../static-installed/bin/qt-configure-module ../qtsvg/
cmake --build . --parallel
cmake --install .
cd ..

git clone https://github.com/qt/qtdeclarative --branch v6.2.0-beta2 --verbose --depth 1
mkdir qtdeclarative-build && cd qtdeclarative-build
../static-installed/bin/qt-configure-module ../qtdeclarative/
cmake --build . --parallel
cmake --install .
cd ..

git clone https://github.com/qt/qtwayland --branch v6.2.0-beta2 --verbose --depth 1
mkdir qtwayland-build && cd qtwayland-build
../static-installed/bin/qt-configure-module ../qtwayland/
cmake --build . --parallel
cmake --install .
cd ..

git clone https://github.com/qt/qt5compat --branch v6.2.0-beta2 --verbose --depth 1
mkdir qt5compat-build && cd qt5compat-build
../static-installed/bin/qt-configure-module ../qt5compat/
cmake --build . --parallel
cmake --install .
cd ..

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

git clone https://github.com/moodyhunter/QvMeta.git --recursive --verbose --depth 1
cd QvMeta
git submodule update --remote
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
