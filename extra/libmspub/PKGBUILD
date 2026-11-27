# Maintainer: AndyRTR <andyrtr@archlinux.org>
# Contributor: Simone Sclavi 'Ito' <darkhado@gmail.com>

pkgname=libmspub
pkgver=0.1.6
pkgrel=1
pkgdesc="Microsoft Publisher file format parser library (latest snapshot)"
arch=('x86_64')
url="https://wiki.documentfoundation.org/DLP/Libraries/libmspub"
license=('MPL-2.0')
depends=('libwpd' 'icu' 'librevenge'
         'zlib' 'glibc' 'libstdc++' 'libgcc')
makedepends=('libwpg' 'boost' 'doxygen')
source=(https://dev-www.libreoffice.org/src/${pkgname}/${pkgname}-${pkgver}.tar.xz)
sha256sums=('408eb742b172a0ccbd128a0ff6402eee495839cd905198ce2b3f2607bba617f4')

prepare() {
    cd "${pkgname}"-${pkgver}
    autoreconf -vfi
}

build() {
    cd "${pkgname}"-${pkgver}
    ./configure --prefix=/usr --with-docs
    sed -i -e 's/ -shared / -Wl,-O1,--as-needed\0/g' libtool
    make
}

package() {
    cd "${pkgname}"-${pkgver}
    make DESTDIR="$pkgdir" install
}
