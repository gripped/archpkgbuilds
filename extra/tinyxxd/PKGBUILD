# Maintainer: Alexander F. Rødseth <xyproto@archlinux.org>

pkgname=tinyxxd
pkgver=1.3.4
pkgrel=1
pkgdesc='Standalone version of the hex dump utility that comes with ViM'
arch=(x86_64)
url='https://github.com/xyproto/tinyxxd'
provides=(xxd)
conflicts=(xxd)
license=(GPL-2.0-only)
source=("$url/releases/download/v$pkgver/$pkgname-$pkgver.tar.gz")
b2sums=('5c9bf4868b6e02f6247594d3067a788a6455937d95a7bc7c5e553350e9e544888f50bef1ff866a11bddbe9c9606746fc9837ecb1469e53e987b205574a80841e')

build() {
  make -C $pkgname-$pkgver
}

package() {
  cd $pkgname-$pkgver
  DESTDIR="$pkgdir" make install
  install -Dm644 $pkgname.1 "$pkgdir/usr/share/man/$pkgname/man1/$pkgname.1"
  ln -s /usr/bin/tinyxxd "$pkgdir/usr/bin/xxd"
}
