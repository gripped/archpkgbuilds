# Maintainer: Sergej Pupykin <pupykin.s+arch@gmail.com>
# Maintainer: Roman Kyrylych <Roman.Kyrylych@gmail.com>
# Contributor: Roman Kyrylych <Roman.Kyrylych@gmail.com>

pkgname=iniparser
pkgver=4.2.1
pkgrel=1
pkgdesc='A free stand-alone ini file parsing library written in portable ANSI C'
arch=('x86_64')
url='https://github.com/ndevilla/iniparser'
license=('MIT')
depends=('glibc')
provides=('libiniparser.so')
makedepends=('chrpath')
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/ndevilla/iniparser/archive/v${pkgver}.tar.gz")
md5sums=('402ca3059f3dd1f9acd664d9c9b6aa27')
sha256sums=('9120fd13260be1dbec74b8aaf47777c434976626f3b3288c0d17b70e21cce2d2')

build() {
  cd "${pkgname}-${pkgver}"

  make
}

package() {
  cd "${pkgname}-${pkgver}"

  install -Dm0644 src/iniparser.h "${pkgdir}"/usr/include/iniparser.h
  install -Dm0644 src/dictionary.h "${pkgdir}"/usr/include/dictionary.h
  install -Dm0644 libiniparser.so.1 "$pkgdir"/usr/lib/libiniparser.so.1
  install -Dm0644 LICENSE "${pkgdir}"/usr/share/licenses/iniparser/LICENSE
  ln -sf libiniparser.so.1 "${pkgdir}"/usr/lib/libiniparser.so
  chrpath -d "${pkgdir}"/usr/lib/libiniparser.so
}
