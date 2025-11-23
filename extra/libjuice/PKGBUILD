# Maintainer: Sven-Hendrik Haase <svenstaro@archlinux.org>
# Contributor: Paul-Louis Ageneau <paul-louis at ageneau dot org>
pkgname=libjuice
pkgver=1.7.0
pkgrel=1
pkgdesc="UDP Interactive Connectivity Establishment (ICE) library"
arch=('x86_64')
url="https://github.com/paullouisageneau/$pkgname"
license=('MPL-2.0')
makedepends=('cmake')
depends=('glibc')
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/paullouisageneau/libjuice/archive/refs/tags/v${pkgver}.tar.gz")
sha512sums=('20800c54231188982f75bf823e1a450c6e501247fdb7348f4dc1dfaee6c6bf1394b681cd7e576156ddf2a1936668ebda10a1e74b9778f5bdd2a46c26173b68ac')

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
