# Maintainer: schuay <jakob.gruber@gmail.com>
# Maintainer: George Rawlinson <grawlinson@archlinux.org>
# Contributor: stonecrest <stonecrest[at]gmail[dot]com>
# Contributor: Chocobo1 <chocobo1 AT archlinux DOT net>

pkgname=mac
pkgver=11.10
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
sha512sums=('2c9ddda2fba3c54fa79caf45bdb892b65901e8c31abc1be810dea6c26727d711064f2e9379256e636ff142e4c3dae2a524e7f18ef20d58107bdf808ecb0f56ca'
            '986318c72718b8c82bc6c53ad873211a27e034ba93cfebd38a991d532301990c3ed6862c65ddb37525323f830690ad70e39a14d2f82e78e38c41b7730cbf132c')
b2sums=('7db7768818d53a231bddd1ec2615c54d9917008ae8bc34e2a70089b233861db8d685f08c42be98d1d985b9a80551d09d9a4914dbe2db625bf9ec970f5f214e2a'
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
