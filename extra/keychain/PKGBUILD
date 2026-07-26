# Maintainer: Antonio Rojas <arojas@archlinux.org>
# Maintainer: Caleb Maclennan <caleb@alerque.com>
# Contributor: Eric Bélanger <eric@archlinux.org>

pkgname=keychain
pkgver=3.0.0
pkgrel=2
pkgdesc='A front-end to ssh-agent, allowing one long-running ssh-agent process per system, rather than per login'
arch=(any)
url='https://www.funtoo.org/Keychain'
license=(GPL-2.0-only)
depends=(python)
makedepends=(git)
source=(git+https://github.com/danielrobbins/keychain#tag=$pkgver)
sha256sums=('d845558fed0101a5f0dd40357c118e8824a2c51f0996ce8a00e3c77404f54cf7')

build() {
  cd $pkgname
  make
}

package() {
  cd $pkgname
  install -Dm755 keychain.pyz "$pkgdir"/usr/bin/keychain
}
