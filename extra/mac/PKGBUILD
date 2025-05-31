# Maintainer: schuay <jakob.gruber@gmail.com>
# Maintainer: George Rawlinson <grawlinson@archlinux.org>
# Contributor: stonecrest <stonecrest[at]gmail[dot]com>
# Contributor: Chocobo1 <chocobo1 AT archlinux DOT net>

pkgname=mac
pkgver=11.15
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
sha512sums=('bacc85ec961429a242a0a8c26edb848f17fda0278b9214c1fe92227afa0f029a6174f4ed4cab3b03a5441a24c29da03be71c3d85a9621792c7a2b29717d45f2b'
            '986318c72718b8c82bc6c53ad873211a27e034ba93cfebd38a991d532301990c3ed6862c65ddb37525323f830690ad70e39a14d2f82e78e38c41b7730cbf132c')
b2sums=('7c233985e3fe60a676fb216e9bd68941d2f7e334d8994daa849b93558ef5108d5231724bf79f71eaf75713393c53525542b8783cab9caf958bc45750da9cfbf9'
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
