# Maintainer: Johannes Löthberg <johannes@kyriasis.com>
# Maintainer: George Rawlinson <grawlinson@archlinux.org>
# Contributor: Sergej Pupykin <pupykin.s+arch@gmail.com>
# Contributor: hydro <hydro@freenet.de>

pkgbase=mediainfo
pkgname=(mediainfo mediainfo-gui)
pkgver=23.09
pkgrel=1
pkgdesc='Supplies technical and tag information about media files'
arch=('x86_64')
url='https://mediaarea.net'
license=('BSD')
depends=("libmediainfo=$pkgver")
makedepends=('wxwidgets-gtk3')
source=("$pkgname-$pkgver.tar.gz::https://github.com/MediaArea/MediaInfo/archive/v$pkgver.tar.gz")
sha512sums=('a07727d531811b07fbe38ab3a09ee08b97a211e7d8d6b67fadcf1df0108ed8a213dfc91fc3618df8e0b8dd7555732d0511cfa3a5347e613eac295a0dacc16144')
b2sums=('016c167350bce85f33ac76096412d443e8610fda4c0fddce67c630e6b0ca510a2ad6f19cb479caa64e441e1fc02e6bad084ea777f6775e3b7835379898e21c1c')

build() {
  cd "MediaInfo-$pkgver"

  pushd Project/GNU/CLI
  ./autogen.sh
  ./configure --prefix=/usr
  make
  popd

  pushd Project/GNU/GUI
  ./autogen.sh
  ./configure --prefix=/usr
  make
  popd
}

package_mediainfo() {
  pkgdesc+=" (CLI interface)"

  cd "MediaInfo-$pkgver/Project/GNU/CLI"

  make DESTDIR="$pkgdir" install

  # license
  install -vDm644 -t "$pkgdir/usr/share/licenses/$pkgname" "$srcdir/MediaInfo-$pkgver/LICENSE"
}

package_mediainfo-gui() {
  pkgdesc+=" (GUI interface)"
  depends+=('wxwidgets-gtk3' 'hicolor-icon-theme')

  cd "MediaInfo-$pkgver/Project/GNU/GUI"

  make DESTDIR="$pkgdir" install

  # license
  install -vDm644 -t "$pkgdir/usr/share/licenses/$pkgname" "$srcdir/MediaInfo-$pkgver/LICENSE"
}
