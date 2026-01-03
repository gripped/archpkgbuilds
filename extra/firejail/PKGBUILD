# Maintainer: Sergej Pupykin <arch+pub@sergej.pp.ru>
# Maintainer: Daniel M. Capella <polyzen@archlinux.org>
# Maintainer: T.J. Townsend <blakkheim@archlinux.org>
# Contributor: ajs124 < aur AT ajs124 DOT de >

pkgname=firejail
pkgver=0.9.78
pkgrel=1
pkgdesc='Linux namespaces sandbox program'
arch=('x86_64')
url=https://github.com/netblue30/firejail
license=('GPL-2.0-only')
depends=('apparmor')
makedepends=('git')
optdepends=('xdg-dbus-proxy: for D-Bus filtering')
backup=('etc/apparmor.d/local/firejail-default'
        'etc/firejail/firecfg.config'
        'etc/firejail/firejail.config'
        'etc/firejail/login.users')
install=firejail.install
source=("git+https://github.com/netblue30/firejail.git#tag=$pkgver")
sha256sums=('20839118dbea89257779387bb24f5fc53f22ba068fa184ec370f634e9e3b2571')
b2sums=('c28109164f06e0b66956e93f05270442d04ce6636f484bcf8b754e6764f7c3b2ab77d9368c705983134f7947b66bf4122ab5c2e3e7493947b837fb8636dfaab2')
#validpgpkeys=('F951164995F5C4006A73411E2CCB36ADFC5849A7')

build() {
  cd $pkgname
  ./configure --prefix=/usr --enable-apparmor
  make
}

package() {
  cd $pkgname
  make DESTDIR="$pkgdir" install
}
