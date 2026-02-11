# Maintainer: Felix Yan <felixonmars@archlinux.org>
# Contributor: Massimiliano Torromeo <massimiliano.torromeo@gmail.com>

pkgname=libuv
pkgver=1.52.0
pkgrel=1
pkgdesc="Multi-platform support library with a focus on asynchronous I/O"
arch=('x86_64')
url="https://github.com/libuv/libuv"
license=('custom')
depends=('glibc' 'libnsl')
makedepends=('git' 'python-sphinx')
source=("git+https://github.com/libuv/libuv.git?signed#tag=v${pkgver}")
sha512sums=('13f83d7d38891145661a3e994969bcb06a9c561a4e18961e65040ddc32e706c1fb52c9be9ab696adfe9d97817e2eecfd916d57d7053b92df4d724fa374c05e05')
# PGP key IDs are available from https://github.com/libuv/libuv/blob/v1.x/MAINTAINERS.md
validpgpkeys=('57353E0DBDAAA7E839B66A1AFF47D5E4AD8B4FDC'  # Colin Ihrig (@cjihrig)
              '94AE36675C464D64BAFA68DD7434390BDBE9B9C5'  # Colin Ihrig (cjihrig-kb)
              '612F0EAD9401622379DF4402F28C3C8DA33C03BE'  # Santiago Gimeno
              'AEAD0A4B686767751A0E4AEF34A25FB128246514'
              'CFBB9CA9A5BEAFD70E2B3C5A79A67C55A3679C8B') # Jameson Nash (@vtjnash)

prepare() {
    cd $pkgname
    # Disable tests that fail on build.a.o (but pass locally)
    sed -e '/udp_multicast_join/d' \
        -e '/tcp_connect6_link_local/d' \
        -i test/test-list.h
}

build() {
    cd $pkgname
    ./autogen.sh
    ./configure --prefix=/usr
    make
    make man -C docs
}

check() {
    cd $pkgname
    make check
}

package() {
    cd $pkgname

    make DESTDIR="$pkgdir" install

    install -Dm644 LICENSE \
        "$pkgdir"/usr/share/licenses/$pkgname/LICENSE
    install -Dm644 AUTHORS \
        "$pkgdir"/usr/share/doc/$pkgname/AUTHORS
    install -Dm644 README.md \
        "$pkgdir"/usr/share/doc/$pkgname/README.md
    install -Dm644 ChangeLog \
        "$pkgdir"/usr/share/doc/$pkgname/ChangeLog
    install -Dm644 docs/build/man/libuv.1 \
        "$pkgdir"/usr/share/man/man1/libuv.1
}
