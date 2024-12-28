# Maintainer: schuay <jakob.gruber@gmail.com>
# Maintainer: George Rawlinson <grawlinson@archlinux.org>
# Contributor: stonecrest <stonecrest[at]gmail[dot]com>
# Contributor: Chocobo1 <chocobo1 AT archlinux DOT net>

pkgname=mac
pkgver=10.85
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
sha512sums=('9444f0f41874c46397c23017ea94a7c482059702c26d81e1ca622c1b81474734a3afc2202d3d2821ab4f767c9567cfe5e67f39344465dc1bfc8001c361a93212'
            '440ead15e56d37fd0a6985319ceb871166566e7fea7d07f3fc2df49f5bee01627b31647ce35595ae52c5119c22d9465d19cf41c51cc22b2929a7ea3e0ee941d1')
b2sums=('85e959976956c49b99b9498e25ea7c4d17d1df12d33f4459f53c9067ec49aad1bc09a4b35832191c2e0d39c3d7aec21eae3820ff1b341b5c194f684c1682fccc'
        'f67cb22ad165f06bced85b414f194b44f24b1193535d39bad1f74a1804e73b8fe4b2ecd97c90227070ba7458e9e580d66480f9c49dc3042a91e6106cfad3c8a5')

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
