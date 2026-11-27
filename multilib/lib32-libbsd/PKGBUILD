# Maintainer: Daniel Bermond <dbermond@archlinux.org>

pkgname=lib32-libbsd
pkgver=0.12.2
pkgrel=2
pkgdesc='Provides useful functions commonly found on BSD systems like strlcpy() (32-bit)'
arch=('x86_64')
url='https://libbsd.freedesktop.org'
license=('ISC AND MIT AND Beerware AND BSD-2-Clause AND BSD-3-Clause')
depends=(
    'lib32-glibc'
    'lib32-libmd'
    'libbsd')
makedepends=(
    'git')
source=("git+https://gitlab.freedesktop.org/libbsd/libbsd.git?signed#tag=${pkgver}")
sha256sums=('cfc3f3b3c270f7db25691dbc370eefcb822bc06e275f49508c43540b9acb1e74')
validpgpkeys=('4F3E74F436050C10F5696574B972BF3EA4AE57A3') # Guillem Jover

prepare() {
    cd libbsd
    autoreconf -fi
}

build() {
    export CC='gcc -m32'
    export CFLAGS+=' -m32 -ffat-lto-objects'
    export LDFLAGS+=' -m32'
    export PKG_CONFIG_PATH='/usr/lib32/pkgconfig'
    
    cd libbsd
    ./configure \
        --prefix='/usr' \
        --libdir='/usr/lib32'
    make
}

check() {
    make -C libbsd check
}

package() {
    make -C libbsd DESTDIR="$pkgdir" install
    install -D -m644 libbsd/COPYING "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
    rm -r "${pkgdir}/usr"/{include,share/man}
}
