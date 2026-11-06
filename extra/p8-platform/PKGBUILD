# Maintainer: BlackIkeEagle <ike DOT devolder AT gmail DOT com>
# Contributor: Cedric Girard <girard.cedric@gmail.com>

pkgname=p8-platform
pkgver=2.2.0
pkgrel=1
pkgdesc="Platform support library used by libCEC and binary add-ons for Kodi"
arch=('x86_64')
url="https://github.com/Pulse-Eight/platform"
license=('GPL-2.0-or-later')
conflicts=('libplatform')
replaces=('libplatform')
makedepends=('cmake')
depends=(
  'glibc'
  'libgcc'
  'libstdc++'
)
source=(https://github.com/Pulse-Eight/platform/archive/p8-platform-${pkgver}.tar.gz)
sha256sums=('e1a0669e54793794afb5965d7d35a5456d8dbbda772fe505824c481279887ba0')

build() {
  cd "$srcdir"/platform-p8-platform-${pkgver}
  cmake . \
    -DCMAKE_BUILD_TYPE=Release \
    -DBUILD_SHARED_LIBS=1 \
    -DCMAKE_INSTALL_PREFIX=/usr \
    -DCMAKE_INSTALL_LIBDIR=/usr/lib \
    -DCMAKE_INSTALL_LIBDIR_NOARCH=/usr/lib
  make
}

package() {
  cd "$srcdir"/platform-p8-platform-${pkgver}
  make DESTDIR="$pkgdir/" install
}

# vim:set ts=2 sw=2 et:
