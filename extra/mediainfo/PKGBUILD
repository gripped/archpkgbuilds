# Maintainer: Johannes Löthberg <johannes@kyriasis.com>
# Maintainer: George Rawlinson <grawlinson@archlinux.org>
# Contributor: Sergej Pupykin <pupykin.s+arch@gmail.com>
# Contributor: hydro <hydro@freenet.de>

pkgbase=mediainfo
pkgname=(mediainfo mediainfo-gui)
pkgver=25.04
pkgrel=1
pkgdesc='Supplies technical and tag information about media files'
arch=('x86_64')
url='https://mediaarea.net'
license=('BSD-2-Clause')
depends=("libmediainfo=$pkgver")
makedepends=('wxwidgets-gtk3')
source=("$pkgname-$pkgver.tar.gz::https://github.com/MediaArea/MediaInfo/archive/v$pkgver.tar.gz")
sha512sums=('b4b380c7633636e0270504b0224267c1b26e7315697d7c08c758b79bb20ca973479c19330f8e32b6530d21099300ddcee2025bbc15b8467c6c701da662d0641a')
b2sums=('18c9ae9dab60f811a9cd7165b05aef80a8fbf16bfbeebf3ef356c657a39482cf002aa64e8243639adc5df4acb205bb0257ad08654465e14d485d0498b98e07e3')

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
