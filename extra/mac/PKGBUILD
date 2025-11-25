# Maintainer: schuay <jakob.gruber@gmail.com>
# Maintainer: George Rawlinson <grawlinson@archlinux.org>
# Contributor: stonecrest <stonecrest[at]gmail[dot]com>
# Contributor: Chocobo1 <chocobo1 AT archlinux DOT net>

pkgname=mac
pkgver=11.88
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
sha512sums=('3d7c9d08d6d0e820888c00ceba6cface2f7cd13aa90b84a15896ed879481667b94ae7bc75a915757b6b3b9ad884813cfe70d023a2f660c95265a574ed166474c'
            '058cc796121e8d14b3862a63fa7c9afec728b57817a585cf194365f4a21e2f300b39666036a6ddf9fb6a245867e74d06fb3a6fd5d460abe9a10700ea4a493ce7')
b2sums=('e6ad54c52b08f48d670743e4fc88861c6c2ed95792a2935cf037a64fa4a8c607bd4d9216007ddc3e05e5f402b445eeb7067aa487a090812250a2694bafd2d86f'
        '1cc1d61e4f64ce30a0de198133251b3da8b77087020c1a7cfd4716a5a7ffdc738e05a0665ea215126950be30f0d8ecac2d54770a16f4492d70731191fc79f702')

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
