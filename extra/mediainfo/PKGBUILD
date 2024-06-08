# Maintainer: Johannes Löthberg <johannes@kyriasis.com>
# Maintainer: George Rawlinson <grawlinson@archlinux.org>
# Contributor: Sergej Pupykin <pupykin.s+arch@gmail.com>
# Contributor: hydro <hydro@freenet.de>

pkgbase=mediainfo
pkgname=(mediainfo mediainfo-gui)
pkgver=24.05
pkgrel=1
pkgdesc='Supplies technical and tag information about media files'
arch=('x86_64')
url='https://mediaarea.net'
license=('BSD-2-Clause')
depends=("libmediainfo=$pkgver")
makedepends=('wxwidgets-gtk3')
source=("$pkgname-$pkgver.tar.gz::https://github.com/MediaArea/MediaInfo/archive/v$pkgver.tar.gz")
sha512sums=('1743220c36a3f87e4099db651b4adfce5f002bbd0c547471167efbb4e7b689fd278c5438c0949e7409f3dd78a047dcccec149f0185d9f95699f80348dda5fc3f')
b2sums=('ea6c674e2f4ff41d87196fb4064b5dfea9622e78e90d2ed44f6960002b3b18c42e70abba1f77b330bec5629f16b0a286a83b6532c7d262ee9bd51990372f3ad5')

prepare() {
  cd MediaInfo-$pkgver
# Install service menus in modern path
  sed -e 's|kservices5/ServiceMenus|kio/servicemenus|g' -i Project/GNU/GUI/Makefile.am
}

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
