# Maintainer: Johannes Löthberg <johannes@kyriasis.com>
# Maintainer: George Rawlinson <grawlinson@archlinux.org>
# Contributor: Sergej Pupykin <pupykin.s+arch@gmail.com>
# Contributor: hydro <hydro@freenet.de>

pkgbase=mediainfo
pkgname=(mediainfo mediainfo-gui)
pkgver=25.03
pkgrel=1
pkgdesc='Supplies technical and tag information about media files'
arch=('x86_64')
url='https://mediaarea.net'
license=('BSD-2-Clause')
depends=("libmediainfo=$pkgver")
makedepends=('wxwidgets-gtk3')
source=("$pkgname-$pkgver.tar.gz::https://github.com/MediaArea/MediaInfo/archive/v$pkgver.tar.gz")
sha512sums=('eebbb7ac82aef3fc066d8d14bd2cf1ac40ddcacc337c1af19fe599436174dadd5f127e743895bf6568d0b8a26602367d6edc1f364564a9355ea895de626f35a8')
b2sums=('8f70db6d1eb136cf64edc3e5bc60750cc08838edf4e37a17daa657622b8c59055d3ca9771bcde4b8615843bbf39510b19337d2ba565e6918d3b1a35042663848')

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
