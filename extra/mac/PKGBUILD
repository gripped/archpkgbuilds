# Maintainer: schuay <jakob.gruber@gmail.com>
# Maintainer: George Rawlinson <grawlinson@archlinux.org>
# Contributor: stonecrest <stonecrest[at]gmail[dot]com>
# Contributor: Chocobo1 <chocobo1 AT archlinux DOT net>

pkgname=mac
pkgver=11.09
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
sha512sums=('c733908c426aebcbacc0d9fc69cd8d0579cfa6779c655a5aea3070786a4c88779271bfd8a059d29c2cca4e72caa68f366c6119a2be01d6ef0159d10d45a36769'
            '986318c72718b8c82bc6c53ad873211a27e034ba93cfebd38a991d532301990c3ed6862c65ddb37525323f830690ad70e39a14d2f82e78e38c41b7730cbf132c')
b2sums=('ea1ef35893710fc890da61cfef0d05c483b34dcb29fd4e5bfea3873bcf9ecc3d0d854ee2b289d378b2f5ec39636dbe31d7c1e5d1b76950e90913af277dfa586e'
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
