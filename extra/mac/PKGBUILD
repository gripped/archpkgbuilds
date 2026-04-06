# Maintainer: schuay <jakob.gruber@gmail.com>
# Maintainer: George Rawlinson <grawlinson@archlinux.org>
# Contributor: stonecrest <stonecrest[at]gmail[dot]com>
# Contributor: Chocobo1 <chocobo1 AT archlinux DOT net>

pkgname=mac
pkgver=12.62
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
sha512sums=('9c4349d9a2573b547204797dd72f4c4db08860048169a3c8d964d27becd3930700bed8f6b9cc565fdb5c08d66a1c8cdec9908bf5e211b817970bc32546c351cb'
            '2ea89fb14c3de969a9c6d60fd3cd82b8f08212a7933b70d11a472cb9ece0fb516bd52eba6a3884e4693380f4ff01fc461c58367866a292515accf8dec15c1410')
b2sums=('54efc5cacc0a999ccb1c0b792650819dfc6c6b303a43cf008ffe707595043a481166500406c8613a80155d5017fe93cf03abeb48fe8fc4a95222d3c9f430a046'
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
