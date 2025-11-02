# Maintainer: Antonio Rojas <arojas@archlinux.org>
# Maintainer: Caleb Maclennan <caleb@alerque.com>
# Contributor: Eric Bélanger <eric@archlinux.org>

pkgname=keychain
pkgver=2.9.8
pkgrel=1
pkgdesc='A front-end to ssh-agent, allowing one long-running ssh-agent process per system, rather than per login'
arch=(any)
url='https://www.funtoo.org/Keychain'
license=(GPL-2.0-only)
depends=(sh)
makedepends=(git)
source=(git+https://github.com/danielrobbins/keychain#tag=$pkgver)
sha256sums=('890c2dd5236eb4f25921bc2e371cbb5ff2a227e72481cf2fdc72599a8c744443')

build() {
  cd $pkgname
  make
}

package() {
  cd $pkgname
  install -Dm755 keychain "$pkgdir"/usr/bin/keychain
  install -Dm644 keychain.1 "$pkgdir"/usr/share/man/man1/keychain.1
  make DESTDIR="$pkgdir/" PREFIX=/usr install-completions
}
