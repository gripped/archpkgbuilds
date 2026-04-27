# Maintainer: schuay <jakob.gruber@gmail.com>
# Maintainer: George Rawlinson <grawlinson@archlinux.org>
# Contributor: stonecrest <stonecrest[at]gmail[dot]com>
# Contributor: Chocobo1 <chocobo1 AT archlinux DOT net>

pkgname=mac
pkgver=12.67
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
sha512sums=('0f5c5de362016ca1527127246dffdae0d35573ed126365f2398e4efb837f1d206e31f96cbeb2124c392edc7d8cb2588f19a83d04be203cf7d6199dd616f26c8e'
            '2ea89fb14c3de969a9c6d60fd3cd82b8f08212a7933b70d11a472cb9ece0fb516bd52eba6a3884e4693380f4ff01fc461c58367866a292515accf8dec15c1410')
b2sums=('3c1d37d1221d778fe1e15d1ad910de3d93b89859e50b9a9e49cb3df279e22cb88d1c845d2881ee4336d0ff2f64dc3c74d49863ca976317c23a18d7c5ff2654df'
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
