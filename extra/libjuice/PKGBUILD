# Maintainer: Sven-Hendrik Haase <svenstaro@archlinux.org>
# Contributor: Paul-Louis Ageneau <paul-louis at ageneau dot org>
pkgname=libjuice
pkgver=1.7.2
pkgrel=1
pkgdesc="UDP Interactive Connectivity Establishment (ICE) library"
arch=('x86_64')
url="https://github.com/paullouisageneau/$pkgname"
license=('MPL-2.0')
makedepends=('cmake')
depends=('glibc')
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/paullouisageneau/libjuice/archive/refs/tags/v${pkgver}.tar.gz")
sha512sums=('770b7123949a644ab8df01020abb2c8744496e1e486c91292252bb309a8c38239ae2a6c369b4eb0c028f6ac0ea78e5da09922d0ddf8446e50b4eb299cf1dabca')

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
