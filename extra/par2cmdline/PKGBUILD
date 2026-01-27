# vim:set ts=2 sw=2 et:
# Maintainer: BlackEagle < ike DOT devolder AT gmail DOT com >
# Maintainer: Sébastien Luttringer <seblu@aur.archlinux.org

pkgname=par2cmdline
pkgver=1.1.0
pkgrel=2
pkgdesc='A PAR 2.0 compatible file verification and repair tool'
url='https://github.com/BlackIkeEagle/par2cmdline'
license=('GPL-2.0-or-later')
arch=('x86_64')
options=(debug)
depends=('gcc-libs')
source=("https://github.com/Parchive/$pkgname/releases/download/v$pkgver/$pkgname-$pkgver.tar.gz"
        "https://github.com/Parchive/$pkgname/releases/download/v$pkgver/$pkgname-$pkgver.tar.gz.sig")
sha512sums=('b880d5db2b2c32301a3081788a09d82fc89f5538238162ba5cc9a01b900eec623d310c2934753daa5d197fb235858076e19467f1820e8b2daa13034aec293cb9'
            'SKIP')

validpgpkeys=(
  'DB2277BCD500AA3825610BDDDB323392796CA067'
)

prepare() {
  cd "$pkgname-$pkgver"
  autoreconf -fiv
}

build() {
  cd "$pkgname-$pkgver"
  ./configure --prefix=/usr
  make
}

check() {
  cd "$pkgname-$pkgver"
  make -j1 check
}

package() {
  cd "$pkgname-$pkgver"
  make DESTDIR="$pkgdir" install
}
