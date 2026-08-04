# Maintainer: Filipe Laíns (FFY00) <lains@archlinux.org>
# Maintainer: Caleb Maclennan <caleb@alerque.com>
# Contributor: nfnty <arch@nfnty.se>

pkgname=shotcut
pkgdesc='Cross-platform Qt based Video Editor'
pkgver=26.8.1
pkgrel=1
arch=('x86_64')
url='https://www.shotcut.org'
license=('GPL3')
depends=('qt6-base' 'qt6-declarative' 'qt6-imageformats' 'qt6-multimedia' 'qt6-translations'
         'mlt' 'movit' 'ffmpeg' 'libx264' 'libvpx' 'lame' 'frei0r-plugins' 'ladspa' 'qt6-charts'
         'qt6-websockets' 'qt6-5compat')
# Re qt6-5compat, techinally optional but assumed, see
# https://gitlab.archlinux.org/archlinux/packaging/packages/shotcut/-/issues/8
optdepends=('swh-plugins: Several audio filters'
            'opencv: For motion tracking')
makedepends=('qt6-tools' 'git' 'cmake' 'ninja' 'clang' 'vulkan-headers')
source=("git+https://github.com/mltframework/shotcut.git#tag=v${pkgver}")
sha512sums=('0bf362749f59b6e83c3766cff6ceb570b1ebe82b5eb0348076a049dab3ebc7023a542a75635b5d01eb96e5f9a19e594997abbce628970adc0baa1c825e10d899')

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
