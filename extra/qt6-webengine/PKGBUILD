# Maintainer: Antonio Rojas <arojas@archlinux.org>
# Maintainer: Felix Yan <felixonmars@archlinux.org>

pkgname=qt6-webengine
_pkgver=6.9.0
pkgver=${_pkgver/-/}
pkgrel=4
arch=(x86_64)
url='https://www.qt.io'
license=(GPL-3.0-only
         LGPL-3.0-only
         LicenseRef-Qt-Commercial
         Qt-GPL-exception-1.0)
pkgdesc='Provides support for web applications using the Chromium browser project'
depends=(alsa-lib
         dbus
         expat
         ffmpeg
         fontconfig
         freetype2
         gcc-libs
         glib2
         glibc
         harfbuzz
         icu
         lcms2
         libdrm
         libevent
         libjpeg-turbo
         libpng
         libtiff
         libwebp
         libx11
         libxcb
         libxcomposite
         libxfixes
         libxkbcommon
         libxkbfile
         libxdamage
         libxext
         libxml2
         libxrandr
         libxslt
         libxtst
         mesa
         minizip
         nspr
         nss
         openjpeg2
         opus
         qt6-base
         qt6-declarative
         qt6-positioning
         qt6-webchannel
         re2
         snappy
         ttf-font
         zlib)
       # pciutils
       # libvpx disabled if VA-API is used
makedepends=(cmake
             git
             gperf
             jsoncpp
             libepoxy
             libpulse
             libva
             libxcursor
             ninja
             nodejs
             perf
             pipewire
             python-html5lib
             qt6-tools
             qt6-websockets)
optdepends=('pipewire: WebRTC desktop sharing under Wayland')
groups=(qt6)
_pkgfn=${pkgname/6-/}
source=(git+https://code.qt.io/qt/$_pkgfn#tag=v$_pkgver
        git+https://code.qt.io/qt/qtwebengine-chromium
        pipewire-1.4.patch)
sha256sums=('b241666ad58bc6c30bd9e0e89cb6f7ba2df57be0c51faabe75c858972fa8367e'
            'SKIP'
            '6a441e426ea993e0abefcb3a92adb5fe3a328974eca6de94087cd597a4315f7a')

prepare() {
  cd $_pkgfn
  git submodule init
  git submodule set-url src/3rdparty "$srcdir"/qtwebengine-chromium
  git -c protocol.file.allow=always submodule update

  # NativeSkiaOutputDeviceOpenGL: Fix leaking X11 Pixmap
  # https://bugreports.qt.io/browse/QTBUG-135047
  # https://codereview.qt-project.org/c/qt/qtwebengine/+/634033
  git cherry-pick -n 08f793a6ef5da886e1282a3fb9a2829bd14413b2

  # Add "default" and "gl" ANGLE implementation support to Ozone
  # https://bugreports.qt.io/browse/QTBUG-133570
  # https://codereview.qt-project.org/c/qt/qtwebengine/+/634920
  git cherry-pick -n a56ea1e9cf1004d475932dc954c9cc494fbf32b1

  # Do not list GLX frame buffer configurations unnecessarily
  # https://bugreports.qt.io/browse/QTBUG-135647
  # https://codereview.qt-project.org/c/qt/qtwebengine/+/638638
  git cherry-pick -n 23cb28fa0c21c3205b398eb177dffada62de6cc9

  # NativeSkiaOutputDeviceVulkan: Use minimal set of usage flags for VkImage
  # https://bugreports.qt.io/browse/QTBUG-123607
  # https://codereview.qt-project.org/c/qt/qtwebengine/+/638636
  git cherry-pick -n f88fa0c83c7f0c063475539b327065f8615fe9d7

  # Allow MAP_DROPPABLE memory mappings in Linux sandbox
  # https://bugreports.qt.io/browse/QTBUG-134631
  # https://codereview.qt-project.org/c/qt/qtwebengine-chromium/+/631750
  git -C src/3rdparty cherry-pick -n 416c7ff1efbb6565b109ff1462bc84a6870e13b9

  patch -d src/3rdparty/chromium/third_party/webrtc -p1 < ../pipewire-1.4.patch
}

build() {
  cmake -B build -S $_pkgfn -G Ninja \
    -DCMAKE_MESSAGE_LOG_LEVEL=STATUS \
    -DCMAKE_TOOLCHAIN_FILE=/usr/lib/cmake/Qt6/qt.toolchain.cmake \
    -DQT_FEATURE_webengine_system_ffmpeg=ON \
    -DQT_FEATURE_webengine_system_icu=ON \
    -DQT_FEATURE_webengine_system_libevent=ON \
    -DQT_FEATURE_webengine_system_re2=ON \
    -DQT_FEATURE_webengine_proprietary_codecs=ON \
    -DQT_FEATURE_webengine_kerberos=ON \
    -DQT_FEATURE_webengine_webrtc_pipewire=ON
  cmake --build build
}

package() {
  DESTDIR="$pkgdir" cmake --install build

  install -Dm644 "$srcdir"/${_pkgfn}/src/3rdparty/chromium/LICENSE "$pkgdir"/usr/share/licenses/${pkgname}/LICENSE.chromium
}
