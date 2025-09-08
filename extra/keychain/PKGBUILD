# Maintainer: Antonio Rojas <arojas@archlinux.org>
# Contributor: Eric Bélanger <eric@archlinux.org>

pkgname=keychain
pkgver=2.9.6
pkgrel=1
pkgdesc='A front-end to ssh-agent, allowing one long-running ssh-agent process per system, rather than per login'
arch=(any)
url='https://www.funtoo.org/Keychain'
license=(GPL-2.0-only)
depends=(sh)
makedepends=(git)
source=(git+https://github.com/danielrobbins/keychain#tag=$pkgver)
sha256sums=('ecdef486ba0a1d976dcdad7b4e0f088ff4675b7518294bf9d595eb8446b76729')

build() {
  cd $pkgname
  make
}

package() {
  cd $pkgname
  install -Dm755 keychain "$pkgdir"/usr/bin/keychain
  install -Dm644 keychain.1 "$pkgdir"/usr/share/man/man1/keychain.1
}
