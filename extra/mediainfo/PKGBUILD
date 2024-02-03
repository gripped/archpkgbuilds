# Maintainer: Johannes Löthberg <johannes@kyriasis.com>
# Maintainer: George Rawlinson <grawlinson@archlinux.org>
# Contributor: Sergej Pupykin <pupykin.s+arch@gmail.com>
# Contributor: hydro <hydro@freenet.de>

pkgbase=mediainfo
pkgname=(mediainfo mediainfo-gui)
pkgver=24.01
pkgrel=1
pkgdesc='Supplies technical and tag information about media files'
arch=('x86_64')
url='https://mediaarea.net'
license=('BSD')
depends=("libmediainfo=$pkgver")
makedepends=('wxwidgets-gtk3')
source=("$pkgname-$pkgver.tar.gz::https://github.com/MediaArea/MediaInfo/archive/v$pkgver.tar.gz")
sha512sums=('dac6b9d864e4a4aa16ae5e69cd59d1b8a012c0c2a37a7f0336e1071669bcd8c1c98d2afa7f391d5f723908ba635b370cbc2e25136bb8fe9d28b43bc0f61c0c70')
b2sums=('e3f39696e9b9026646432357cd8052b172d38b5cf53d001a7b2f710a79a96e26c78506ffed7108dbaba90e85e7a7bc0163d61db5565c9e9db5e86c22902106bf')

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
