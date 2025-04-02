pkgname=deskflow
pkgver=1.21.1
pkgrel=1
pkgdesc='Share one mouse and keyboard between multiple computers'
url='https://deskflow.org/'
arch=(x86_64)
license=('GPL-2.0-only WITH LicenseRef-OpenSSL-Exception')
depends=(
  gcc-libs
  glib2
  glibc
  hicolor-icon-theme
  libei
  libglvnd
  libice
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
sha256sums=('5afdc2a2580ee0261d350581dc6a9f20a759111218fd877bc97ebcc747dfd58f')
b2sums=('66278f4726d9f2951a2aab4a7b020bc5e190dc50195343fa2fe8e0a16af2b1349ca2c36de1cead6f06c880f21de09d64ad289b52ef29be0720debd6796eb58ae')

prepare() {
  cd "${pkgname}"
  # backport test settings fixes
  git cherry-pick -n 6bbebe75f9f9d2cdc10b454ec5ec9d7ee21b4b03
}

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
