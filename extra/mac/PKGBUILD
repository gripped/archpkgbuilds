# Maintainer: schuay <jakob.gruber@gmail.com>
# Maintainer: George Rawlinson <grawlinson@archlinux.org>
# Contributor: stonecrest <stonecrest[at]gmail[dot]com>
# Contributor: Chocobo1 <chocobo1 AT archlinux DOT net>

pkgname=mac
pkgver=11.62
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
sha512sums=('81045cb2a0321f4328bf26a79e855ddc3e268635885a022413f9870e5a70abedf215d793be4eb1617979d431fea9912280bd4118d994028d38f793087d1ef281'
            '986318c72718b8c82bc6c53ad873211a27e034ba93cfebd38a991d532301990c3ed6862c65ddb37525323f830690ad70e39a14d2f82e78e38c41b7730cbf132c')
b2sums=('2537cbfaacc4c28d10d9d6c46edb30af05daa20ed891c6d24d200d8ae450b979f9d3c6e85bf9ed60f3414efbc0ba6378a7e9f9abcb6956feeb63d99416d1a316'
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
