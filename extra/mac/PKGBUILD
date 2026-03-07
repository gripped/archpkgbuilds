# Maintainer: schuay <jakob.gruber@gmail.com>
# Maintainer: George Rawlinson <grawlinson@archlinux.org>
# Contributor: stonecrest <stonecrest[at]gmail[dot]com>
# Contributor: Chocobo1 <chocobo1 AT archlinux DOT net>

pkgname=mac
pkgver=12.50
_pkgver="${pkgver//./}"
pkgrel=1
pkgdesc='APE codec and decompressor'
arch=(x86_64)
url='https://www.monkeysaudio.com/index.html'
license=(BSD-3-Clause)
depends=(
  glibc
  libgcc
  libstdc++
)
makedepends=(
  cmake
  python-html2text
)
source=(
  "$pkgname-$pkgver.zip::https://monkeysaudio.com/files/MAC_${_pkgver}_SDK.zip"
  "$pkgname-$pkgver-license.html::https://www.monkeysaudio.com/license.html"
)
sha512sums=('1c5e4ffb2204347250414f6f8b9261da12d6ea6f7905b57e901f0baf76995bdd31f6f1e80725fe93d0bcba501022803a68601ced8cd18e31e65f0a24d295228d'
            '2ea89fb14c3de969a9c6d60fd3cd82b8f08212a7933b70d11a472cb9ece0fb516bd52eba6a3884e4693380f4ff01fc461c58367866a292515accf8dec15c1410')
b2sums=('1baa7d0942e727becd4a5d4ed1708b46048aa1fcbaecfde5b33a9d456ffd0b755e6e1b7d630e665919c9e548efd79d20f9be3f0c8f63cdd3622ba581a7bce37b'
        'cf3d0c275bc56c75ac124f105283a48b3afb962b8171d76a6dc210eb7f3e95095daefc53c92f839aaa757af9e64c34c911ec0614eea7f520cb17e98be8ca80fb')

prepare() {
  # generate license
  html2text --ignore-links "$pkgname-$pkgver-license.html" \
    | sed -n '/^## License$/,$p' \
    > LICENSE.md
}
build() {
  local cmake_options=(
    -B build
    -S .
    -W no-dev
    -D CMAKE_BUILD_TYPE=None
    -D CMAKE_INSTALL_PREFIX=/usr
  )

  cmake "${cmake_options[@]}"

  cmake --build build
}

package() {
  DESTDIR="$pkgdir" cmake --install build

  install -vDm644 -t "$pkgdir/usr/share/licenses/$pkgname" LICENSE.md
}
