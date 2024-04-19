# Maintainer: Sven-Hendrik Haase <svenstaro@archlinux.org>
# Contributor: Paul-Louis Ageneau <paul-louis at ageneau dot org>
pkgname=libjuice
pkgver=1.4.0
pkgrel=1
pkgdesc="UDP Interactive Connectivity Establishment (ICE) library"
arch=('x86_64')
url="https://github.com/paullouisageneau/$pkgname"
license=('MPL2')
makedepends=('cmake')
depends=('glibc')
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/paullouisageneau/libjuice/archive/refs/tags/v${pkgver}.tar.gz")
sha512sums=('b5dc7c3bca3c36112e266516ea24662251fdaf40c994ae08ced3787a43d8868fbf81db9abcc7a88a1d5064c85b688625b9eac92c1e47567d5306b81537ba9e23')

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
