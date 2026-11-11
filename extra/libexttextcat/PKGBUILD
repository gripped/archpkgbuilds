# Maintainer: Andreas Radke <andyrtr@archlinux.org>
# Contributor: Jaroslav Lichtblau <dragonlord@aur.archlinux.org>

pkgname=libexttextcat
pkgver=3.4.9
pkgrel=1
pkgdesc="N-Gram-Based Text Categorization library primarily intended for language guessing"
arch=('x86_64')
url="https://wiki.documentfoundation.org/Libexttextcat"
license=('BSD-3-Clause')
depends=('glibc')
provides=('libtextcat')
# options=(!lto)
source=(#https://dev-www.libreoffice.org/src/$pkgname/$pkgname-$pkgver.tar.xz
        https://dev-www.libreoffice.org/src/$pkgname-$pkgver.tar.xz)
sha256sums=('71e9a3cc6c4a270efd61d76281664341e1fb0412b591f1939516413a992d1e87')
            
prepare() {
  cd "${srcdir}"/$pkgname-$pkgver
  autoreconf -vfi
}

build() {
  cd "${srcdir}"/$pkgname-$pkgver
  ./configure --prefix=/usr
  make
}

package() {
  cd "${srcdir}"/$pkgname-$pkgver
  make DESTDIR="${pkgdir}" install
  install -D -m644 LICENSE "${pkgdir}"/usr/share/licenses/$pkgname/LICENSE
}
