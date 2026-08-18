# Maintainer: Antonio Rojas <arojas@archlinux.org>
# Maintainer: Caleb Maclennan <caleb@alerque.com>
# Contributor: Eric Bélanger <eric@archlinux.org>

pkgname=keychain
pkgver=3.0.3
pkgrel=1
pkgdesc='A front-end to ssh-agent, allowing one long-running ssh-agent process per system, rather than per login'
arch=(any)
url='https://www.funtoo.org/Keychain'
license=(GPL-2.0-only)
depends=(python)
makedepends=(git)
source=(git+https://github.com/danielrobbins/keychain#tag=$pkgver)
sha256sums=('737e7e866cf46ce206d3d4a38ce6321eb7c2cb0cce4a702719d510fd9624d6d7')

build() {
  cd $pkgname
  make
}

package() {
  cd $pkgname
  install -Dm755 keychain.pyz "$pkgdir"/usr/bin/keychain
}
