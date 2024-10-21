# Maintainer: Alexander F. Rødseth <xyproto@archlinux.org>

pkgname=tinyxxd
pkgver=1.3.6
pkgrel=1
pkgdesc='Standalone version of the hex dump utility that comes with ViM'
arch=(x86_64)
url='https://github.com/xyproto/tinyxxd'
provides=(xxd)
conflicts=(xxd)
license=(GPL-2.0-only MIT)
source=("$url/releases/download/v$pkgver/$pkgname-$pkgver.tar.gz")
b2sums=('8bb935c2c5915afec565e54511d4461caf21ef34c3e9f110798a1397765a66af9f04281783c09d08f16171f31d3288f303e7c97699069dfcb1efa2ff1ebf47da')

build() {
  make -C $pkgname-$pkgver
}

package() {
  cd $pkgname-$pkgver
  DESTDIR="$pkgdir" make install
  install -Dm644 $pkgname.1 "$pkgdir/usr/share/man/$pkgname/man1/$pkgname.1"
  install -Dm644 AUTHORS.md "$pkgdir/usr/share/licenses/$pkgname/AUTHORS.md"
  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
  ln -s /usr/bin/tinyxxd "$pkgdir/usr/bin/xxd"
}
