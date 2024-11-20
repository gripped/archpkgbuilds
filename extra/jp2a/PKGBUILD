# Maintainer: Morten Linderud <foxboron@archlinux.org>
# Maintainer: Carl Smedstad <carsme@archlinux.org>

pkgname='jp2a'
pkgver=1.3.2
pkgrel=1
pkgdesc='A small utility for converting JPG images to ASCII'
arch=('x86_64')
url='https://github.com/Talinx/jp2a/'
license=('GPL-2.0-only')
depends=(
  'curl'
  'glibc'
  'libexif'
  'libjpeg-turbo'
  'libpng'
  'libwebp'
  'ncurses'
)
makedepends=(
  'doxygen'
  'git'
)
source=("git+https://github.com/Talinx/jp2a.git#tag=v${pkgver}")
sha256sums=('519b2a651b0e639bffe18f6fa77229b34f8402699e322992bab1c9ef43dd28d0')

prepare() {
  cd "${pkgname}"
  autoreconf -vi
}

build() {
  cd "${pkgname}"
  bashcompdir=/usr/share/bash-completion/completions ./configure --prefix='/usr'
  make
}

check() {
  cd "${pkgname}"
  make check
}

package() {
  cd "${pkgname}"
  make DESTDIR="${pkgdir}" install
}
