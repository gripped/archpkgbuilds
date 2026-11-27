# Maintainer: David Runge <dvzrv@archlinux.org>

pkgname=nitrokey-udev-rules
pkgver=1.1.1
pkgrel=1
pkgdesc="Udev rules for Nitrokey devices"
arch=(any)
url="https://github.com/Nitrokey/nitrokey-udev-rules"
license=(CC0-1.0)
source=("$pkgname-$pkgver.tar.gz::$url/archive/refs/tags/v$pkgver.tar.gz")
sha512sums=('8d2cbf405a0f0cc31861b884bcf6675d8d9c87feb610c9fcb3bd9e8536e9924e095bd1f4f95cf675d28718867d643cc39a8f6cc5b0486aa096e8ff61b68c9a34')
b2sums=('8f4d3701a0fbdc409819950e3b6e7ac7f642248a3a4af54fcfe6d7f5e18686cfeef9a3d8d9d809fbe7fa6f2e38c939ae410cc4eda7820cabe5d86a1f9887106f')

package() {
  install -vDm 644 $pkgname-$pkgver/41-nitrokey.rules -t "$pkgdir/usr/lib/udev/rules.d/"
  install -vDm 644 $pkgname-$pkgver/CHANGELOG.md -t "$pkgdir/usr/share/doc/$pkgname/"
  install -vDm 644 $pkgname-$pkgver/LICENSE -t "$pkgdir/usr/share/licenses/$pkgname/"
}
