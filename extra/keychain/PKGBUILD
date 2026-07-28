# Maintainer: Antonio Rojas <arojas@archlinux.org>
# Maintainer: Caleb Maclennan <caleb@alerque.com>
# Contributor: Eric Bélanger <eric@archlinux.org>

pkgname=keychain
pkgver=3.0.1
pkgrel=1
pkgdesc='A front-end to ssh-agent, allowing one long-running ssh-agent process per system, rather than per login'
arch=(any)
url='https://www.funtoo.org/Keychain'
license=(GPL-2.0-only)
depends=(python)
makedepends=(git)
source=(git+https://github.com/danielrobbins/keychain#tag=$pkgver)
sha256sums=('45f6f5451ab5311ec6de6188d99cfdb60e2b82be718c84d6c34b0d3675041096')

build() {
  cd $pkgname
  make
}

package() {
  cd $pkgname
  install -Dm755 keychain.pyz "$pkgdir"/usr/bin/keychain
}
