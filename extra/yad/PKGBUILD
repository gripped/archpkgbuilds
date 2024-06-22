# Maintainer: Christian Hesse <mail@eworm.de>
# Contributor: Aaron Fischer <mail@aaron-fischer.net>
# Contributor: Steven Allen <steven@stebalien.com>
# Contributor: trile7 at gmail dot com
# Contributor: Ernia <monghitri@aruba.it>

pkgname=yad
pkgver=14.0
pkgrel=1
pkgdesc='A fork of zenity - display graphical dialogs from shell scripts or command line'
url='https://github.com/v1cont/yad'
arch=('x86_64')
license=('GPL3')
depends=('gtk3' 'webkit2gtk-4.1' 'gtksourceview3' 'gspell')
makedepends=('autoconf' 'automake' 'intltool')
source=("https://github.com/v1cont/yad/releases/download/v${pkgver}/${pkgname}-${pkgver}.tar.xz")
sha256sums=('2829681f0a9ebd07b7f651c6266d5bf6199235ef027c4936a76988e0471f8e1d')

prepare() {
  cd "${srcdir}/${pkgname}-${pkgver}"

  # use webkit2gtk-4.1
  sed -i 's|webkit2gtk-4.0|webkit2gtk-4.1|' configure.ac

  autoreconf -ivf
  intltoolize
}

build() {
  cd "${srcdir}/${pkgname}-${pkgver}"

  ./configure \
    --prefix=/usr \
    --enable-icon-browser \
    --enable-html \
    --enable-spell \
    --enable-sourceview

  make
}

package() {
  cd "${srcdir}/${pkgname}-${pkgver}"

  make DESTDIR="${pkgdir}" install
}
