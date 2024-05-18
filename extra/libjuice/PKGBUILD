# Maintainer: Sven-Hendrik Haase <svenstaro@archlinux.org>
# Contributor: Paul-Louis Ageneau <paul-louis at ageneau dot org>
pkgname=libjuice
pkgver=1.4.2
pkgrel=1
pkgdesc="UDP Interactive Connectivity Establishment (ICE) library"
arch=('x86_64')
url="https://github.com/paullouisageneau/$pkgname"
license=('MPL-2.0')
makedepends=('cmake')
depends=('glibc')
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/paullouisageneau/libjuice/archive/refs/tags/v${pkgver}.tar.gz")
sha512sums=('5696ada382b70e5e8edc123c021cc1bf48a091253e20c705d1a23de3e5a9a240c138090228d02c5937a2418202e10216fafce4579195d5c2c92e7f7be107e622')

build() {
  cmake -B build -S $pkgname-$pkgver \
    -DCMAKE_BUILD_TYPE='None' \
    -DCMAKE_INSTALL_PREFIX=/usr \
    -DNO_TESTS=1 \
    -Wno-dev

  cmake --build build
}

package() {
  DESTDIR="$pkgdir/" cmake --install build

  cd ${pkgname}-${pkgver}
  install -Dm644 LICENSE "${pkgdir}"/usr/share/licenses/$pkgname/LICENSE
}
