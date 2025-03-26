pkgname=deskflow
pkgver=1.20.1
pkgrel=1
pkgdesc='Share one mouse and keyboard between multiple computers'
url='https://deskflow.org/'
arch=(x86_64)
license=(LicenseRef-GPL-2.0-only-WITH-OpenSSL-Exception)
depends=(
  gcc-libs
  gdk-pixbuf2
  glib2
  glibc
  hicolor-icon-theme
  libei
  libglvnd
  libice
  libnotify
  libportal
  libsm
  libx11
  libxext
  libxi
  libxinerama
  libxkbcommon
  libxkbcommon-x11
  libxkbfile
  libxrandr
  libxtst
  openssl
  pugixml
  qt6-base
  tomlplusplus
)
makedepends=(
  cli11
  cmake
  git
  gtest
  ninja
  python
  qt6-tools
  xorgproto
)
source=("git+https://github.com/deskflow/deskflow.git#tag=v${pkgver}")
sha256sums=('4b63180b32f485dcd164578727f98da73ddf141130c85c5d914f018343cb38f0')
b2sums=('6c828e9996b7c46211acf7a77463791bac829dc3ed986652093c6786c724e38cf839118c3860a7ef705cc7fb6f77f5f6e3dd6cb8307e95a8d19782a9a032475d')

build() {
  cd "${pkgname}"
  cmake \
    -DCMAKE_INSTALL_PREFIX=/usr \
    -DCMAKE_BUILD_TYPE=None \
    -DCMAKE_C_FLAGS="${CFLAGS}" \
    -DCMAKE_CXX_FLAGS="${CXXFLAGS}" \
    -DCMAKE_EXE_LINKER_FLAGS="${LDFLAGS}" \
    -DCMAKE_SHARED_LINKER_FLAGS="${LDFLAGS}" \
    -Wno-dev \
    -G Ninja \
    -B build \
    -S .
  cmake --build build --verbose
}

check() {
  cd "${pkgname}"
  export QT_QPA_PLATFORM=offscreen
  ./build/bin/unittests
  ./build/bin/integtests
}

package() {
  cd "${pkgname}"
  DESTDIR="${pkgdir}" cmake --install build
  install -Dm 644 README.md doc/configuration.md -t "${pkgdir}/usr/share/doc/${pkgname}"
}

# vim: ts=2 sw=2 et:
