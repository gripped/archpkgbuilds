# Maintainer: Sven-Hendrik Haase <svenstaro@archlinux.org>
# Contributor: Paul-Louis Ageneau <paul-louis at ageneau dot org>
pkgname=libjuice
pkgver=1.6.2
pkgrel=1
pkgdesc="UDP Interactive Connectivity Establishment (ICE) library"
arch=('x86_64')
url="https://github.com/paullouisageneau/$pkgname"
license=('MPL-2.0')
makedepends=('cmake')
depends=('glibc')
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/paullouisageneau/libjuice/archive/refs/tags/v${pkgver}.tar.gz")
sha512sums=('4af112c961831a38ca32874cbee59e25fe02e6a36957c8a91912113933e06b2b46268e7a1f1aacb5fcff33242f89963064bf484be28c07991c664821c0f4a48d')

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
