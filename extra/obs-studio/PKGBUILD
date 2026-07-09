# Maintainer: Christian Heusel <gromit@archlinux.org>
# Maintainer: Jonathan Grotelüschen <tippfehlr@archlinux.org>
# Contributor: Jonathan Steel <jsteel at archlinux.org>
# Contributor: Benjamin Klettbach <b.klettbach@gmail.com>
# Contributor: Maciek Marciniak <mm2pl at kotmisia.pl>

pkgbase=obs-studio
pkgname=('obs-studio' 'obs-studio-plugin-browser')
pkgver=32.1.2
pkgrel=7
pkgdesc="Free, open source software for live streaming and recording"
arch=('x86_64')
url="https://obsproject.com"
license=('GPL-2.0-only')
depends=('ffmpeg' 'jansson' 'libxinerama' 'libxkbcommon-x11' 'mbedtls' 'rnnoise' 'pciutils'
         'qt6-svg' 'curl' 'jack' 'gtk-update-icon-cache' 'pipewire' 'libxcomposite'
         'libdatachannel' 'uthash' 'simde' 'qrcodegencpp-cmake' 'python')
makedepends=('cef' 'cmake' 'libfdk-aac' 'x264' 'swig' 'luajit' 'sndio' 'nlohmann-json'
             'ffnvcodec-headers' 'websocketpp' 'asio' 'extra-cmake-modules'
             'git')
source=(
  "$pkgname::git+https://github.com/obsproject/obs-studio#tag=$pkgver"
  "${pkgname}-libdshowcapture::git+https://github.com/obsproject/libdshowcapture.git"
  "${pkgname}-obs-browser::git+https://github.com/obsproject/obs-browser.git"
  "${pkgname}-obs-websocket::git+https://github.com/obsproject/obs-websocket.git"
  "obs-browser-Update-to-C-20.patch"
  "obs-browser-enable-support-for-CEF-6613+.patch"
)
sha256sums=('5d515107c68006319c91d24a3a661f6fc4c1a619ebbac85a567fb6f5fec1e2c4'
            'SKIP'
            'SKIP'
            'SKIP'
            '474832a156d29224eabc77bc78ca33b0e6116cb00dc2786b5869744bae8f72c3'
            '6ae679a3dfc3ab36ed03dcbc89de02f8075de26a0f01ea0176aa5aa8fbf499cd')

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

  # current CEF requires C++20
  # https://github.com/obsproject/obs-browser/pull/517
  patch -d plugins/obs-browser -Np1 -i "$srcdir/obs-browser-Update-to-C-20.patch"

  # Enable support for CEF 6613+ (Chrome 128 to 147) and Chrome Runtime
  # https://github.com/obsproject/obs-browser/pull/523
  patch -d plugins/obs-browser -Np1 -i "$srcdir/obs-browser-enable-support-for-CEF-6613+.patch"
}

build() {
  local _cef_api_version=$(grep -oP 'CEF_API_VERSION_LAST CEF_API_VERSION\_\K[0-9]+' /usr/include/cef/include/cef_api_versions.h)
  echo Setting CEF_API_VERSION to $_cef_api_version

  export CXXFLAGS+=" -Wno-error=deprecated-declarations -Wno-error=ignored-qualifiers -Wno-error=unused-parameter"
  local cmake_options=(
    -B build
    -S $pkgname
    -DCMAKE_INSTALL_PREFIX="/usr"
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
    -DCALM_DEPRECATION=ON
    -DENABLE_WEBSOCKET=ON
    -Wno-dev
  )
  cmake "${cmake_options[@]}"
  cmake --build build
}

package_obs-studio() {
  optdepends=('libfdk-aac: FDK AAC codec support'
              'libva-intel-driver: hardware encoding for older Intel GPUs'
              'intel-media-driver: hardware encoding for recent Intel GPUs'
              'libva-mesa-driver: hardware encoding'
              'luajit: scripting support'
              'sndio: Sndio input client'
              'v4l2loopback-dkms: virtual camera support'
              'xdg-desktop-portal-impl: Wayland window/screen capture'
              'obs-studio-plugin-browser: CEF-based browser plugin'
              )

  DESTDIR="$pkgdir" cmake --install build
  mv $pkgdir/usr/lib/obs-plugins/{obs-browser-page,obs-browser.so} .
  mv $pkgdir/usr/share/obs/obs-plugins/obs-browser .
}

package_obs-studio-plugin-browser() {
  pkgdesc="CEF-based OBS Studio browser plugin"
  url="https://obsproject.com/kb/browser-source"
  depends=('cef' 'glibc' 'libgcc' 'libstdc++' 'libx11' 'obs-studio' 'qt6-base')

  install -Dm755 obs-browser-page obs-browser.so -t $pkgdir/usr/lib/obs-plugins/
  install -d $pkgdir/usr/share/obs/obs-plugins/
  mv obs-browser $pkgdir/usr/share/obs/obs-plugins/
}
