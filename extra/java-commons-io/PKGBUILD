# Maintainer: Filipe Laíns (FFY00) <lains@archlçinux.org>
# Contributor: Lukas Fleischer <lfleischer@archlinux.org>
# Contributor: Stefan Husmann <stefan-husmann@t-online.de>
# Contributor: Simon Lipp <sloonz+aur@gmail.com>

pkgname=java-commons-io
pkgver=2.19.0
pkgrel=1
pkgdesc='IO related classes for Java.'
arch=('any')
url='https://commons.apache.org/io/'
license=('APACHE')
depends=('java-runtime')
source=("https://www.apache.org/dist/commons/io/binaries/commons-io-$pkgver-bin.tar.gz"{,.asc})
sha512sums=('447500ae140b6d9ef2fa69019c053b0d1780daa9ffa1d486fa4fb2daac045244d9ea747a6292ea5b605e18cf0688100a48861c01fee560545624f8001ffc9a01'
            'SKIP')
validpgpkeys=('6BDACA2C0493CCA133B372D09C4F7E9D98B1CC53'  # Benson Margulies
              'CD5464315F0B98C77E6E8ECD9DAADC1C9FCC82D0'  # Benedikt Ritter
              '2DB4F1EF0FA761ECC4EA935C86FDC7E2A11262CB') # Gary David Gregory (Code signing key) <ggregory@apache.org>

package() {
  install -Dm 644 "$srcdir"/commons-io-$pkgver/commons-io-$pkgver.jar "$pkgdir"/usr/share/java/commons-io/commons-io.jar
}
