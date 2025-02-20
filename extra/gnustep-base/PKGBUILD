# Maintainer: Sergej Pupykin <pupykin.s+arch@gmail.com>
# Maintainer: Vesa Kaihlavirta <vegai@iki.fi>
# Contributor: Sebastian Sareyko <public@nooms.de>

pkgname=gnustep-base
pkgver=1.30.0
pkgrel=2
pkgdesc="The GNUstep base package"
arch=('x86_64')
url="http://www.gnustep.org/"
license=("GPL" "LGPL")
depends=(libxslt avahi gmp gcc-libs openssl libffi gnutls icu)
makedepends=(gcc-objc gnustep-make)
provides=('libgnustep-base.so')
groups=('gnustep-core')
options=('!emptydirs' '!makeflags')
source=(https://github.com/gnustep/libs-base/releases/download/base-${pkgver//./_}/gnustep-base-${pkgver}.tar.gz{,.sig})
sha256sums=('00b5bc4179045b581f9f9dc3751b800c07a5d204682e3e0eddd8b5e5dee51faa'
            'SKIP')
validpgpkeys=('83AAE47CE829A4146EF83420CA868D4C99149679')

build() {
  # this uses malloc_usable_size, which is incompatible with fortification level 3
  export CFLAGS="${CFLAGS/_FORTIFY_SOURCE=3/_FORTIFY_SOURCE=2}"
  export CXXFLAGS="${CXXFLAGS/_FORTIFY_SOURCE=3/_FORTIFY_SOURCE=2}"

  cd $pkgname-$pkgver
  source /usr/share/GNUstep/Makefiles/GNUstep.sh
  ./configure --prefix=/usr --sysconfdir=/etc/GNUstep \
	--with-ffi-include=/usr/lib/libffi-`pacman -Q libffi | cut -f2 -d\ |cut -f1 -d-`/include/
  # fix file ownership
  sed -i 's/tar -xf $(TIMEZONE_ARCHIVE);/tar -xf $(TIMEZONE_ARCHIVE);chown -R root:root * ;/' NSTimeZones/Makefile.postamble
  sed -i 's|.*gnutls_transport_set_lowat.*||' Source/GSSocketStream.m
  make
}

package() {
  cd $pkgname-$pkgver
  make DESTDIR="$pkgdir" install
  chown -R root.root "$pkgdir/"
}
