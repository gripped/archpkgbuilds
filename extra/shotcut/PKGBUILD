# Maintainer: Filipe Laíns (FFY00) <lains@archlinux.org>
# Maintainer: Caleb Maclennan <caleb@alerque.com>
# Contributor: nfnty <arch@nfnty.se>

pkgname=shotcut
pkgdesc='Cross-platform Qt based Video Editor'
pkgver=25.12.31
pkgrel=1
arch=('x86_64')
url='https://www.shotcut.org'
license=('GPL3')
depends=('qt6-base' 'qt6-declarative' 'qt6-imageformats' 'qt6-multimedia' 'qt6-translations'
         'mlt' 'movit' 'ffmpeg' 'libx264' 'libvpx' 'lame' 'frei0r-plugins' 'ladspa' 'qt6-charts'
         'qt6-websockets')
optdepends=('swh-plugins: Several audio filters'
            'opencv: For motion tracking')
makedepends=('qt6-tools' 'git' 'cmake' 'ninja' 'clang')
source=("git+https://github.com/mltframework/shotcut.git#tag=v${pkgver}")
sha512sums=('b7008c142d5436759bdd2a1ebd9e56f9f39cc83fc6bb2ac332e42fac2a1cc74b05091113f54d628b793dd10ed12e51125b78badbcf639da96f723692fd57f6ba')

prepare() {
  cd "${pkgname}"

  sed -e 's|${Qt6_LUPDATE_EXECUTABLE}|/usr/lib/qt6/bin/lupdate|' -i translations/CMakeLists.txt
}

build() {
  cd "${pkgname}"

  # https://github.com/mltframework/shotcut/issues/1275
  export CXXFLAGS+=" -DSHOTCUT_NOUPGRADE"

  cmake -B build -G Ninja \
    -D CMAKE_POLICY_VERSION_MINIMUM=3.5 \
    -D CMAKE_BUILD_TYPE=Release \
    -D CMAKE_INSTALL_PREFIX=/usr \
    -D SHOTCUT_VERSION="$pkgver"
  cmake --build build --verbose
}

package() {
  cd "${pkgname}"

  DESTDIR="${pkgdir}" cmake --install build
}

# vim:set ft=sh sw=2 sts=2 et:
