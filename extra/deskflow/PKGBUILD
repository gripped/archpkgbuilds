pkgname=deskflow
pkgver=1.17.2
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
sha256sums=('e6114141303027f46b37c0a813f1c0013b980bdf52fca35cb45776070c1e348e')
b2sums=('d06011edd535d4b4a8a3f24030c63e9f367cfc13474f47d693eae22461e28dcc92a3b102382d0ee6af325899ea14833169894b930dbb0f3c089342fd5e09191e')

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
  install -Dm 644 LICENSE* -t "${pkgdir}/usr/share/licenses/${pkgname}"
}

# vim: ts=2 sw=2 et:
