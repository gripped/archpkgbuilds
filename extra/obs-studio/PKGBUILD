# Maintainer: Christian Heusel <gromit@archlinux.org>
# Maintainer: Jonathan Grotelüschen <tippfehlr@archlinux.org>
# Maintainer: DeepChirp <deepchirp@archlinux.org>
# Contributor: Jonathan Steel <jsteel at archlinux.org>
# Contributor: Benjamin Klettbach <b.klettbach@gmail.com>
# Contributor: Maciek Marciniak <mm2pl at kotmisia.pl>

pkgname=obs-studio
pkgver=33.0.1
pkgrel=1
pkgdesc="Free, open source software for live streaming and recording"
arch=('x86_64')
url="https://obsproject.com"
license=('GPL-2.0-only')
depends=(
  'alsa-lib' 'cef' 'curl' 'ffmpeg' 'fontconfig' 'freetype2' 'glib2'
  'glibc' 'hicolor-icon-theme' 'jack' 'jansson' 'libdatachannel' 'libdrm'
  'libfdk-aac' 'libgcc' 'libglvnd' 'libpipewire' 'libpulse' 'libstdc++'
  'libva' 'libvpl' 'libx11' 'libxcb' 'libxkbcommon' 'luajit' 'mbedtls3'
  'pciutils' 'python' 'qrcodegencpp-cmake' 'qt6-base' 'qt6-svg' 'rnnoise'
  'speexdsp' 'systemd-libs' 'util-linux-libs' 'v4l-utils' 'wayland' 'x264'
  'zlib'
)
makedepends=(
  'asio' 'cmake' 'extra-cmake-modules' 'ffnvcodec-headers' 'git'
  'nlohmann-json' 'simde' 'sndio' 'swig' 'uthash' 'websocketpp'
)
optdepends=(
  'libva-intel-driver: hardware encoding for older Intel GPUs'
  'intel-media-driver: hardware encoding for recent Intel GPUs'
  'libva-mesa-driver: hardware encoding'
  'sndio: Sndio input client'
  'v4l2loopback-dkms: virtual camera support'
  'xdg-desktop-portal-impl: Wayland window/screen capture'
)
provides=("obs-studio-plugin-browser=$pkgver")
conflicts=('obs-studio-plugin-browser')
replaces=('obs-studio-plugin-browser<=32.2.2')
source=(
  "$pkgname::git+https://github.com/obsproject/obs-studio#tag=$pkgver"
  "${pkgname}-libdshowcapture::git+https://github.com/obsproject/libdshowcapture.git"
  "${pkgname}-obs-browser::git+https://github.com/obsproject/obs-browser.git"
  "${pkgname}-obs-websocket::git+https://github.com/obsproject/obs-websocket.git"
)
sha256sums=('146e64de76ee79a8bc9155a7eb33886ab7b9b3a3de0f275a7ba3ff75ceb2ac74'
            'SKIP'
            'SKIP'
            'SKIP')

prepare() {
  cd $pkgname

  git submodule init

  git config submodule."plugins/obs-browser".url "${srcdir}/${pkgname}"-obs-browser
  git config submodule."plugins/obs-websocket".url "${srcdir}/${pkgname}"-obs-websocket
  git config submodule."plugins/win-dshow/libdshowcapture".url "${srcdir}/${pkgname}"-libdshowcapture

  git -c protocol.file.allow=always submodule update --init --recursive

  # use FindCEF provided by system CEF
  rm cmake/finders/FindCEF.cmake

  # set rpath to /usr/lib/cef for obs-browser plugin
  sed -e 's|INSTALL_RPATH ".*"|INSTALL_RPATH "/usr/lib/cef/"|' -i plugins/obs-browser/cmake/os-linux.cmake
}

build() {
  local _cef_api_version=$(grep -oP 'CEF_API_VERSION_LAST CEF_API_VERSION\_\K[0-9]+' /usr/include/cef/include/cef_api_versions.h)
  echo Setting CEF_API_VERSION to $_cef_api_version

  local cmake_options=(
    -B build
    -S $pkgname
    -DCMAKE_INSTALL_PREFIX="/usr"
    -DCMAKE_COMPILE_WARNING_AS_ERROR=OFF
    # mbedtls 4 not supported yet
    # https://github.com/obsproject/obs-studio/issues/13601
    -DMbedTLS_DIR="/usr/lib/mbedtls3/cmake/MbedTLS"
    -DENABLE_BROWSER=ON
    -DCEF_API_VERSION=$_cef_api_version
    -DENABLE_VST=ON
    -DENABLE_VLC=OFF
    -DENABLE_NEW_MPEGTS_OUTPUT=OFF
    -DENABLE_AJA=OFF
    -DENABLE_JACK=ON
    -DENABLE_LIBFDK=ON
    -DENABLE_WEBRTC=ON
    -DOBS_VERSION_OVERRIDE="$pkgver"
    -DENABLE_WEBSOCKET=ON
  )
  cmake "${cmake_options[@]}"
  cmake --build build
}

package() {
  DESTDIR="$pkgdir" cmake --install build
}
