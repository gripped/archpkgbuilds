# Maintainer: Levente Polyak <anthraxx[at]archlinux[dot]org>
# Contributor: Eric Bélanger <eric@archlinux.org>

pkgname=mpg123
pkgver=1.32.1
pkgrel=2
pkgdesc='Console based real time MPEG Audio Player for Layer 1, 2 and 3'
url="https://sourceforge.net/projects/mpg123"
arch=('x86_64')
license=('LGPL2.1')
depends=('alsa-lib')
makedepends=('sdl2' 'jack' 'libpulse')
optdepends=('sdl2: for sdl audio support'
            'jack: for jack audio support'
            'libpulse: for pulse audio support'
            'perl: for conplay')
provides=(libmpg123.so libout123.so)
source=(https://downloads.sourceforge.net/sourceforge/${pkgname}/${pkgname}-${pkgver}.tar.bz2{,.sig}
        largename-hack.diff)
sha512sums=('084f4575d3ad88373a04035778b40e4871b6da969f42b426c76d9539632baa12534d7f0f9b976be228fd313dea9c31f7a259e0a8b56d044c7e89fefdf897def2'
            'SKIP'
            'bde9d7ae91e1dd8f420b876c71d0d8b30d3cd190b56cf3515754fe202b20f1b74a161b390db46b212428aec0590c9e12cceb09f12e1d599a5356d871bbd361dc')
validpgpkeys=('D021FF8ECF4BE09719D61A27231C4CBC60D5CAFE')

prepare() {
  cd ${pkgname}-${pkgver}

  # Unbreak downstream compiles which add -D_FILE_OFFSET_BITS=64 even when off_t
  # is already 64-bits long. Meson does this (e.g. when building GStreamer)
  #
  # Otherwise, when _FILE_OFFSET_BITS is defined, mpg123.h uses it to rename
  # functions with a suffix of _64, but these functions do not exist because
  # configure disables the largefile API when off_t is natively 64-bit.
  #
  # Do not apply this hack to lib32-mpg123 or other i686 builds.
  #
  # https://sourceforge.net/p/mpg123/bugs/361/
  patch -Np1 -i ../largename-hack.diff
}

build() {
  cd ${pkgname}-${pkgver}
  ./configure \
    --prefix=/usr \
    --enable-int-quality \
    --with-audio="alsa oss sdl jack pulse"
  # https://bugzilla.gnome.org/show_bug.cgi?id=655517
  sed -i -e 's/ -shared / -Wl,-O1,--as-needed\0/g' libtool
  make
}

package() {
  cd ${pkgname}-${pkgver}
  make DESTDIR="${pkgdir}" install
  install -Dm 755 scripts/conplay "${pkgdir}/usr/bin/conplay"
}

# vim: ts=2 sw=2 et:
