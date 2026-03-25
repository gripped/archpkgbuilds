# Maintainer: schuay <jakob.gruber@gmail.com>
# Maintainer: George Rawlinson <grawlinson@archlinux.org>
# Contributor: stonecrest <stonecrest[at]gmail[dot]com>
# Contributor: Chocobo1 <chocobo1 AT archlinux DOT net>

pkgname=mac
pkgver=12.60
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
sha512sums=('c626c24b865949bab09a02779f4e2f98ecdf4ba391a7dcc00e10dafa7e41cd2f3346bc66c9dddba8b0d63d46e88ee2ca2989b161bfbb3729afd9c312f337387e'
            '2ea89fb14c3de969a9c6d60fd3cd82b8f08212a7933b70d11a472cb9ece0fb516bd52eba6a3884e4693380f4ff01fc461c58367866a292515accf8dec15c1410')
b2sums=('97d68f2bd659b300bcbf8dd19570aae836c147ac2603dc25d419ce176b7a975ec431c3c6b9d07efdbd36396e4b1b60b665660d195a30ccad2111a85b3cb586a5'
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
