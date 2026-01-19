# Maintainer: schuay <jakob.gruber@gmail.com>
# Maintainer: George Rawlinson <grawlinson@archlinux.org>
# Contributor: stonecrest <stonecrest[at]gmail[dot]com>
# Contributor: Chocobo1 <chocobo1 AT archlinux DOT net>

pkgname=mac
pkgver=12.02
_pkgver="${pkgver//./}"
pkgrel=1
pkgdesc='APE codec and decompressor'
arch=(x86_64)
url='https://www.monkeysaudio.com/index.html'
license=(BSD-3-Clause)
depends=(glibc gcc-libs)
makedepends=(cmake python-html2text)
source=(
  "$pkgname-$pkgver.zip::https://monkeysaudio.com/files/MAC_${_pkgver}_SDK.zip"
  "$pkgname-$pkgver-license.html::https://www.monkeysaudio.com/license.html"
)
sha512sums=('0ee3b8461f3fdf136a756f5fdab88455a1e95ab8f05685b8d3765552d75383d27b24d06a972382708f1b6412db111b5c0285615c9fe9cd9a52bf551be003a9dc'
            'f038ba226861db06e9021e324afcb67705b896fd71851c87235c3055e6c3d2e3d321d8ed4849936a401ff3d5db94e8d3d8603edc9eafc505f64d4021b8a9c69e')
b2sums=('3f3aee198775c61fe8d9d7f8548fa27e9cfe6d457bb4a1fa826c81b668ee6b48a5d9af198d95480237d1f3e125d33cd314b49cfbaaaecf0cbf8b9920beb4a8a8'
        '7b1363fe62a75d988061d0e5938ef6a945aaf5c3cc5b16b52854893a851b16db9eff5f504a677ff07f483223ea8fb22fcf56e6b6610370878800c51206234c9f')

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
