# Maintainer: Antonio Rojas <arojas@archlinux.org>
# Maintainer: Felix Yan <felixonmars@archlinux.org>

pkgname=qt6-webengine
_pkgver=6.8.2
pkgver=${_pkgver/-/}
pkgrel=3
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
       # system libvpx disabled since https://codereview.qt-project.org/c/qt/qtwebengine/+/454908
       # libvpx pciutils
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
        git+https://code.qt.io/qt/qtwebengine-chromium)
sha256sums=('44280684c9350bf6bc99191747c84ca353ac10761f5f65a4778b6ee0d9794fa7'
            'SKIP')

prepare() {
  cd $_pkgfn
  git submodule init
  git submodule set-url src/3rdparty "$srcdir"/qtwebengine-chromium
  git -c protocol.file.allow=always submodule update

  cd src/3rdparty
  git cherry-pick -n 24e9ff7caa6aa78c1c73e7329cf1230a455d0c1b # Fix playback issues with system ffmpeg
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
