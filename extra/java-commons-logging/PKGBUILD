# Maintainer: Sergej Pupykin <pupykin.s+arch@gmail.com>
# Contributor: Simon Lipp <sloonz+aur@gmail.com>
# Maintainer: Stefan Husmann < stefan-husmann@t-online.de>

pkgname=java-commons-logging
pkgver=1.3.6
pkgrel=1
pkgdesc="Wrapper interface for logging APIs in Java"
arch=('any')
url="https://commons.apache.org/logging/"
license=(APACHE)
depends=('java-runtime')
source=("https://archive.apache.org/dist/commons/logging/binaries/commons-logging-$pkgver-bin.tar.gz"
        "https://archive.apache.org/dist/commons/logging/source/commons-logging-$pkgver-src.tar.gz")
sha512sums=('15ed28cf924b189c6732e723a0e66f8590caee204800746c639b104e7bff066738778f1c2645a0b14d015e0f2ac7d992d538106c55a216934eebd8489a580d48'
            '66b7be2f24c3e2900372645eb803613425aa8d1b11337cd57a87e52eef63b25a193ac0bcde361fd7cb5521582dc26030288f97f9410777570b8f460ae5cf6393')


build() {
  # TODO: build from sources
  true
}

package() {
  cd "$srcdir"/commons-logging-$pkgver/
  install -d "$pkgdir"/usr/share/java/commons-logging/
  install -m0644 commons-logging-$pkgver.jar \
    "$pkgdir"/usr/share/java/commons-logging/commons-logging.jar
}
