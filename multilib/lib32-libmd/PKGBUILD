# Maintainer: Daniel Bermond <dbermond@archlinux.org>

pkgname=lib32-libmd
pkgver=1.3.0
pkgrel=1
pkgdesc='Message Digest functions from BSD systems (32-bit)'
arch=('x86_64')
url='https://www.hadrons.org/software/libmd/'
license=('BSD-3-Clause AND BSD-2-Clause AND ISC AND Beerware AND CC0-1.0')
depends=(
    'lib32-glibc'
    'libmd')
source=("https://archive.hadrons.org/software/libmd/libmd-${pkgver}.tar.xz"{,.asc})
sha256sums=('fc0f1eb6b6766470326f2c014693809190e67dba84274a6fbae9d4912d066706'
            'SKIP')
validpgpkeys=('4F3E74F436050C10F5696574B972BF3EA4AE57A3') # Guillem Jover

build() {
    export CFLAGS+=' -m32'
    export LDFLAGS+=' -m32'
    export PKG_CONFIG_PATH='/usr/lib32/pkgconfig'
    
    cd "libmd-${pkgver}"
    ./configure \
        --prefix='/usr' \
        --libdir='/usr/lib32'
    make
}

check() {
    make -C "libmd-${pkgver}" check
}

package() {
    make -C "libmd-${pkgver}" DESTDIR="$pkgdir" install
    install -D -m644 "libmd-${pkgver}/COPYING" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
    rm -r "${pkgdir}/usr"/{include,share/man}
}
