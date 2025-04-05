# Maintainer: schuay <jakob.gruber@gmail.com>
# Maintainer: George Rawlinson <grawlinson@archlinux.org>
# Contributor: stonecrest <stonecrest[at]gmail[dot]com>
# Contributor: Chocobo1 <chocobo1 AT archlinux DOT net>

pkgname=mac
pkgver=11.03
_pkgver="${pkgver//./}"
pkgrel=1
pkgdesc='APE codec and decompressor'
arch=('x86_64')
url='https://www.monkeysaudio.com/index.html'
license=('BSD-3-Clause')
depends=('glibc' 'gcc-libs')
makedepends=('cmake' 'python-html2text')
source=(
  "$pkgname-$pkgver.zip::https://monkeysaudio.com/files/MAC_${_pkgver}_SDK.zip"
  "$pkgname-$pkgver-license.html::https://www.monkeysaudio.com/license.html"
)
sha512sums=('572d123ccec44df09740ef6d4dd95d5baec87e87d018a7122905fd9230c755df729017638bd6d0c1595c9b30ad804de336ce90773a7b14ff61e8528a7cdf1d8d'
            '986318c72718b8c82bc6c53ad873211a27e034ba93cfebd38a991d532301990c3ed6862c65ddb37525323f830690ad70e39a14d2f82e78e38c41b7730cbf132c')
b2sums=('97fdc98fc79af183c39aed76c1c193f4be2adae3b9c88fb53d703718c0373ebd96a41cc4dd0b9136a23650f3bcdb42f725121d1abc62ecabe4261378cbc0b075'
        '52aa32ab396fbf0896c2b39fa4ecb25e6893923dbbf7498df45e16eaff1fee04cb2d05ae6cbe65867f58f92b2ed978a068aba17a7e707f3a023a377a2916828e')

build() {
  cmake \
    -S . \
    -B build \
    -D CMAKE_BUILD_TYPE='None' \
    -D CMAKE_INSTALL_PREFIX='/usr'

  cmake --build build

  # generate license
  html2text --ignore-links "$pkgname-$pkgver-license.html" \
    | sed -n '/^## License$/,$p' \
    > LICENSE.md
}

package() {
  DESTDIR="$pkgdir" cmake --install build

  install -vDm644 -t "$pkgdir/usr/share/licenses/$pkgname" LICENSE.md
}
