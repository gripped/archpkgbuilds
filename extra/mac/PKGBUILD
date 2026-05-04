# Maintainer: schuay <jakob.gruber@gmail.com>
# Maintainer: George Rawlinson <grawlinson@archlinux.org>
# Contributor: stonecrest <stonecrest[at]gmail[dot]com>
# Contributor: Chocobo1 <chocobo1 AT archlinux DOT net>

pkgname=mac
pkgver=12.76
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
sha512sums=('a0c62e239e556cfca03d6a4d3d1ae3b46e2d8541d13a5ebefda7ca683af5fb6a28b650cf5d929beeb8ce5b109a6af4e0cfd4d7979933566176a8589bcf3405d1'
            '2774fec39eac0a1c15626e6fce5da79cbb72237276a5f9b1288422fd30e03357bc1ba5f44a1319cabace28875150d31a16443bc2b5a756bfcfa35d1e68e56a3b')
b2sums=('e296e3252e7ef3eec918477decfe3808bec11bff93709024c7b41f4c7d70684d326bf8446039194a8ed7cc6e63d90c51bd3f2d32e16ee6fbe658398d95297bb5'
        '8b56d74842178f2b9438be07453b4fc42981baa3dd5ab1375d55c375ce1b5f3911d9928408e94ade709b2abe44d9f3058f1bfb5ed4bd2dd916c0b8960b68e8bd')

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
