# Maintainer: Daniel Bermond <dbermond@archlinux.org>

pkgname=lib32-sndio
pkgver=1.11.0
pkgrel=1
pkgdesc='A small audio and MIDI framework (32-bit)'
arch=('x86_64')
url='https://sndio.org'
license=('ISC')
depends=(
    'lib32-alsa-lib'
    'lib32-glibc'
    'lib32-libbsd'
    "sndio=${pkgver}")
backup=('etc/default/sndiod32')
source=("https://sndio.org/sndio-${pkgver}.tar.gz"{,.asc}
        '010-sndio-32-bit-daemon.patch')
sha256sums=('3e274b5968aa863090d6c6857d7df4f432cd0bafbe4d27312bdca34726eff1e8'
            'SKIP'
            '8a486668fbbbf61d4fc0d3b909e9ddbd1fe32e5b136fa46c2bafc9460c215362')
validpgpkeys=('6B1A7447AAF091CCDD36BAA6015E339411694A6E') # Alexandre Ratchov <alex@caoua.org>

prepare() {
    patch -d "sndio-${pkgver}" -Np1 -i "${srcdir}/010-sndio-32-bit-daemon.patch"
}

build() {
    export CFLAGS+=' -m32'
    export LDFLAGS+=' -m32'
    export PKG_CONFIG_PATH='/usr/lib32/pkgconfig'
    
    cd "sndio-${pkgver}"
    ./configure \
        --prefix='/usr' \
        --libdir='/usr/lib32' \
        --enable-alsa
    make
}

package() {
    make -C "sndio-${pkgver}" DESTDIR="$pkgdir" install
    install -D -m644 "sndio-${pkgver}/contrib/default.sndiod" "${pkgdir}/etc/default/sndiod32"
    install -D -m644 "sndio-${pkgver}/contrib/sndiod.service" "${pkgdir}/usr/lib/systemd/system/sndiod32.service"
    install -D -m644 "sndio-${pkgver}/LICENSE" -t "${pkgdir}/usr/share/licenses/${pkgname}"
    rm -r "${pkgdir}/usr"/{include,share/man}
    
    local _bin
    while read -r -d '' _bin
    do
        mv "$_bin"{,32}
    done < <(find "${pkgdir}/usr/bin" -type f -executable -print0)
}
